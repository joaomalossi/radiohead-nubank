library(dplyr)
library(spotifyr)
library(ggplot2)

Sys.setenv(SPOTIFY_CLIENT_ID = 'xxxxxxxxxxxxx')
Sys.setenv(SPOTIFY_CLIENT_SECRET = 'xxxxxxxxxxxxx')

spotify_df <- get_artist_audio_features('radiohead')

str(spotify_df)

track_df <- spotify_df %>%
        select(track_name, valence, duration_ms, album_name)

selected <- track_df %>% 
        select(valence, track_name) %>%
        arrange(-valence) %>% 
        slice(1:13)

print(selected)

m <- ggplot(selected, aes(x = track_name, y = valence))
m +geom_bar(stat = "identity", fill = "#FF6666") +
theme(axis.text.x=element_text(angle=90,hjust=1,vjust=0.5)) +
ggtitle("Gráfico de valência") +
labs(x="Músicas",y="Valência") +
theme(plot.title = element_text(color="#666666", face="bold", size=20, hjust=0)) +
theme(axis.title = element_text(color="#666666", face="bold", size=14))

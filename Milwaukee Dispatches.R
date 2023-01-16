library(tidyverse)
library(sf)
library(viridis)
library(rayshader)

sightings = st_read(dsn = "~/Downloads/Milwaukee Map/")
sightings = mutate(sightings, Sightings = Join_Count)

outputFile <- file.path("~/Dropbox/R Code Repository/MilwaukeeMapData/", "MKE.mp4")

ggSightings = ggplot(data = dispatches) + 
  geom_sf(aes(fill = Dispatches)) + 
  scale_fill_viridis("Police Dispatches") +
  ggtitle("Cumulative Police Dispatches Per Zip Code - Milwaukee") +
  theme_bw()

plot_gg(ggSightings,multicore=TRUE,width=5,height=5,scale=250,windowsize=c(1400,866),
        zoom = 0.55, phi = 30)
render_snapshot()
render_movie(filename = outputFile)
# https://posit.cloud

# install.packages("osmdata")
# install.packages("sf")
# install.packages("mapview")

library(osmdata)
library(sf)
library(mapview)

bbox <- c(left = -73.9581, bottom = 40.7624, right = -73.9467, top = 40.7751) # Define the bounding box for Upper East Side, New York City

osm_query <- opq(bbox = bbox) |> 
  add_osm_feature(key = "amenity", value = "pharmacy")

osm_data <- osmdata_sf(osm_query)

pharmacies <- osm_data$osm_points # Filter the data to keep only the pharmacies

mapview(pharmacies, zcol = "name")

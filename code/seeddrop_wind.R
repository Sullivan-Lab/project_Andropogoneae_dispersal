setwd("E:/Users/Kurt/Desktop/Seed drop data/GPS")
library(gdalUtils)
library(raster)
library(rgdal)
library(geiger)
library(phytools)
library(picante)
library(maptools)
library(ape)
library(MODIStsp)

#load in the gps points
andropogon_burmanicus = read.csv("E:/Users/Kurt/Desktop/Seed drop data/GPS/cleaned longlat/andropogon_burmanicus.csv", header=FALSE)
andropogon_gerardi = read.csv("E:/Users/Kurt/Desktop/Seed drop data/GPS/cleaned longlat/andropogon_gerardi.csv", header=FALSE)
andropogon_glomeratus = read.csv("E:/Users/Kurt/Desktop/Seed drop data/GPS/cleaned longlat/andropogon_glomeratus.csv", header=FALSE)
andropogon_virginicus = read.csv("E:/Users/Kurt/Desktop/Seed drop data/GPS/cleaned longlat/andropogon_virginicus.csv", header=FALSE)
arthraxon_hispidus = read.csv("E:/Users/Kurt/Desktop/Seed drop data/GPS/cleaned longlat/arthraxon_hispidus.csv", header=FALSE)
bothriochloa_laguroides = read.csv("E:/Users/Kurt/Desktop/Seed drop data/GPS/cleaned longlat/bothriochloa_laguroides.csv", header=FALSE)
capillipedium_spicigerum = read.csv("E:/Users/Kurt/Desktop/Seed drop data/GPS/cleaned longlat/capillipedium_spicigerum.csv", header=FALSE)
chasmanthium_laxum = read.csv("E:/Users/Kurt/Desktop/Seed drop data/GPS/cleaned longlat/chasmanthium_laxum.csv", header=FALSE)
cymbopogon_refractus = read.csv("E:/Users/Kurt/Desktop/Seed drop data/GPS/cleaned longlat/cymbopogon_refractus.csv", header=FALSE)
elionurus_tripsacoides = read.csv("E:/Users/Kurt/Desktop/Seed drop data/GPS/cleaned longlat/elionurus_tripsacoides.csv", header=FALSE)
hyparrhenia_diplandra = read.csv("E:/Users/Kurt/Desktop/Seed drop data/GPS/cleaned longlat/hyparrhenia_diplandra.csv", header=FALSE)
hyparrhenia_finitima = read.csv("E:/Users/Kurt/Desktop/Seed drop data/GPS/cleaned longlat/hyparrhenia_finitima.csv", header=FALSE)
hyparrhenia_hirta = read.csv("E:/Users/Kurt/Desktop/Seed drop data/GPS/cleaned longlat/hyparrhenia_hirta.csv", header=FALSE)
ischaemum_rugosum = read.csv("E:/Users/Kurt/Desktop/Seed drop data/GPS/cleaned longlat/ischaemum_rugosum.csv", header=FALSE)
kerriochloa_siamensis = read.csv("E:/Users/Kurt/Desktop/Seed drop data/GPS/cleaned longlat/kerriochloa_siamensis.csv", header=FALSE)
pogonatherum_paniceum = read.csv("E:/Users/Kurt/Desktop/Seed drop data/GPS/cleaned longlat/pogonatherum_paniceum.csv", header=FALSE)
rottboellia_tuberculosa = read.csv("E:/Users/Kurt/Desktop/Seed drop data/GPS/cleaned longlat/rottboellia_tuberculosa.csv", header=FALSE)
saccharum_contortum = read.csv("E:/Users/Kurt/Desktop/Seed drop data/GPS/cleaned longlat/saccharum_contortum.csv", header=FALSE)
schizachyrium_scoparium = read.csv("E:/Users/Kurt/Desktop/Seed drop data/GPS/cleaned longlat/schizachyrium_scoparium.csv", header=FALSE)
sorghastrum_elliottii = read.csv("E:/Users/Kurt/Desktop/Seed drop data/GPS/cleaned longlat/sorghastrum_elliottii.csv", header=FALSE)
sorghastrum_nutans = read.csv("E:/Users/Kurt/Desktop/Seed drop data/GPS/cleaned longlat/sorghastrum_nutans.csv", header=FALSE)
thelepogon_elegans = read.csv("E:/Users/Kurt/Desktop/Seed drop data/GPS/cleaned longlat/thelepogon_elegans.csv", header=FALSE)
themeda_triandra = read.csv("E:/Users/Kurt/Desktop/Seed drop data/GPS/cleaned longlat/themeda_triandra.csv", header=FALSE)
tripsacum_dactyloides = read.csv("E:/Users/Kurt/Desktop/Seed drop data/GPS/cleaned longlat/tripsacum_dactyloides.csv", header=FALSE)
zea_mays_parviglumis = read.csv("E:/Users/Kurt/Desktop/Seed drop data/GPS/cleaned longlat/zea_mays_parviglumis.csv", header=FALSE)


#windspeed m s-1
#raster loads in grib file
jan2021 = raster("E:/Users/Kurt/Desktop/Seed drop data/GPS/windspeed/jan2021.grib")
#need to change to match format expected by extract function
extent(jan2021)=c(xmn=-180, xmx=180, ymn=-90, ymx=90)
crs(jan2021) <- "+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs" 
crs(jan2021) <- "+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"

feb2021 = raster("E:/Users/Kurt/Desktop/Seed drop data/GPS/windspeed/feb2021.grib")
#need to change to match format expected by extract function
extent(feb2021)=c(xmn=-180, xmx=180, ymn=-90, ymx=90)
crs(feb2021) <- "+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs" 
crs(feb2021) <- "+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"

march2021 = raster("E:/Users/Kurt/Desktop/Seed drop data/GPS/windspeed/march2021.grib")
#need to change to match format expected by extract function
extent(march2021)=c(xmn=-180, xmx=180, ymn=-90, ymx=90)
crs(march2021) <- "+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs" 
crs(march2021) <- "+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"

april2021 = raster("E:/Users/Kurt/Desktop/Seed drop data/GPS/windspeed/april2021.grib")
#need to change to match format expected by extract function
extent(april2021)=c(xmn=-180, xmx=180, ymn=-90, ymx=90)
crs(april2021) <- "+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs" 
crs(april2021) <- "+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"

may2021 = raster("E:/Users/Kurt/Desktop/Seed drop data/GPS/windspeed/may2021.grib")
#need to change to match format expected by extract function
extent(may2021)=c(xmn=-180, xmx=180, ymn=-90, ymx=90)
crs(may2021) <- "+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs" 
crs(may2021) <- "+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"

june2021 = raster("E:/Users/Kurt/Desktop/Seed drop data/GPS/windspeed/june2021.grib")
#need to change to match format expected by extract function
extent(june2021)=c(xmn=-180, xmx=180, ymn=-90, ymx=90)
crs(june2021) <- "+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs" 
crs(june2021) <- "+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"

july2021 = raster("E:/Users/Kurt/Desktop/Seed drop data/GPS/windspeed/july2021.grib")
#need to change to match format expected by extract function
extent(july2021)=c(xmn=-180, xmx=180, ymn=-90, ymx=90)
crs(july2021) <- "+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs" 
crs(july2021) <- "+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"

august2021 = raster("E:/Users/Kurt/Desktop/Seed drop data/GPS/windspeed/august2021.grib")
#need to change to match format expected by extract function
extent(august2021)=c(xmn=-180, xmx=180, ymn=-90, ymx=90)
crs(august2021) <- "+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs" 
crs(august2021) <- "+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"

september2021 = raster("E:/Users/Kurt/Desktop/Seed drop data/GPS/windspeed/september2021.grib")
#need to change to match format expected by extract function
extent(september2021)=c(xmn=-180, xmx=180, ymn=-90, ymx=90)
crs(september2021) <- "+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs" 
crs(september2021) <- "+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"

october2021 = raster("E:/Users/Kurt/Desktop/Seed drop data/GPS/windspeed/october2021.grib")
#need to change to match format expected by extract function
extent(october2021)=c(xmn=-180, xmx=180, ymn=-90, ymx=90)
crs(october2021) <- "+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs" 
crs(october2021) <- "+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"

november2021 = raster("E:/Users/Kurt/Desktop/Seed drop data/GPS/windspeed/november2021.grib")
#need to change to match format expected by extract function
extent(november2021)=c(xmn=-180, xmx=180, ymn=-90, ymx=90)
crs(november2021) <- "+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs" 
crs(november2021) <- "+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"

december2021 = raster("E:/Users/Kurt/Desktop/Seed drop data/GPS/windspeed/december2021.grib")
#need to change to match format expected by extract function
extent(december2021)=c(xmn=-180, xmx=180, ymn=-90, ymx=90)
crs(december2021) <- "+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs" 
crs(december2021) <- "+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"

lai = raster(file.choose())
plot(lai)

#extract
write.csv(7*extract(lai,andropogon_gerardi)/255, "andropogon_gerardi.csv")
write.csv(7*extract(lai,andropogon_glomeratus)/255, "andropogon_glomeratus.csv")
write.csv(7*extract(lai,andropogon_burmanicus)/255, "andropogon_burmanicus.csv")
write.csv(7*extract(lai,andropogon_virginicus)/255, "andropogon_virginicus.csv")
write.csv(7*extract(lai,arthraxon_hispidus)/255, "arthraxon_hispidus.csv")
write.csv(7*extract(lai,bothriochloa_laguroides)/255, "bothriochloa_laguroides.csv")
write.csv(7*extract(lai,capillipedium_spicigerum)/255, "capillipedium_spicigerum.csv")
write.csv(7*extract(lai,chasmanthium_laxum)/255, "chasmanthium_laxum.csv")
write.csv(7*extract(lai,rottboellia_tuberculosa)/255, "rottboellia_tuberculosa.csv")
write.csv(7*extract(lai,cymbopogon_refractus)/255, "cymbopogon_refractus.csv")
write.csv(7*extract(lai,elionurus_tripsacoides)/255, "elionurus_tripsacoides.csv")
write.csv(7*extract(lai,hyparrhenia_diplandra)/255, "hyparrhenia_diplandra.csv")
write.csv(7*extract(lai,hyparrhenia_finitima)/255, "hyparrhenia_finitima.csv")
write.csv(7*extract(lai,hyparrhenia_hirta)/255, "hyparrhenia_hirta.csv")
write.csv(7*extract(lai,ischaemum_rugosum)/255, "ischaemum_rugosum.csv")
write.csv(7*extract(lai,kerriochloa_siamensis)/255, "kerriochloa_siamensis.csv")
write.csv(7*extract(lai,pogonatherum_paniceum)/255, "pogonatherum_paniceum.csv")
write.csv(7*extract(lai,saccharum_contortum)/255, "saccharum_contortum.csv")
write.csv(7*extract(lai,schizachyrium_scoparium)/255, "schizachyrium_scoparium.csv")
write.csv(7*extract(lai,sorghastrum_elliottii)/255, "sorghastrum_elliottii.csv")
write.csv(7*extract(lai,sorghastrum_nutans)/255, "sorghastrum_nutans.csv")
write.csv(7*extract(lai,zea_mays_parviglumis)/255, "zea_mays_parviglumis.csv")
write.csv(7*extract(lai,thelepogon_elegans)/255, "thelepogon_elegans.csv")
write.csv(7*extract(lai,themeda_triandra)/255, "themeda_triandra.csv")
write.csv(7*extract(lai,tripsacum_dactyloides)/255, "tripsacum_dactyloides.csv")


#extract
write.csv(extract(november2021,andropogon_gerardi), "andropogon_gerardi.csv")
write.csv(extract(december2021,andropogon_glomeratus), "andropogon_glomeratus.csv")
write.csv(extract(november2021,andropogon_burmanicus), "andropogon_burmanicus.csv")
write.csv(extract(december2021,andropogon_virginicus), "andropogon_virginicus.csv")
write.csv(extract(november2021,arthraxon_hispidus), "arthraxon_hispidus.csv")
write.csv(extract(december2021,bothriochloa_laguroides), "bothriochloa_laguroides.csv")
write.csv(extract(july2021,capillipedium_spicigerum), "capillipedium_spicigerum.csv")
write.csv(extract(november2021,chasmanthium_laxum), "chasmanthium_laxum.csv")
write.csv(extract(november2021,rottboellia_tuberculosa), "rottboellia_tuberculosa.csv")
write.csv(extract(may2021,cymbopogon_refractus), "cymbopogon_refractus.csv")
write.csv(extract(november2021,elionurus_tripsacoides), "elionurus_tripsacoides.csv")
write.csv(extract(december2021,hyparrhenia_diplandra), "hyparrhenia_diplandra.csv")
write.csv(extract(december2021,hyparrhenia_finitima), "hyparrhenia_finitima.csv")
write.csv(extract(december2021,hyparrhenia_hirta), "hyparrhenia_hirta.csv")
write.csv(extract(december2021,ischaemum_rugosum), "ischaemum_rugosum.csv")
write.csv(extract(jan2021,kerriochloa_siamensis), "kerriochloa_siamensis.csv")
write.csv(extract(december2021,pogonatherum_paniceum), "pogonatherum_paniceum.csv")
write.csv(extract(december2021,saccharum_contortum), "saccharum_contortum.csv")
write.csv(extract(december2021,schizachyrium_scoparium), "schizachyrium_scoparium.csv")
write.csv(extract(december2021,sorghastrum_elliottii), "sorghastrum_elliottii.csv")
write.csv(extract(november2021,sorghastrum_nutans), "sorghastrum_nutans.csv")
write.csv(extract(jan2021,zea_mays_parviglumis), "zea_mays_parviglumis.csv")
write.csv(extract(december2021,thelepogon_elegans), "thelepogon_elegans.csv")
write.csv(extract(december2021,themeda_triandra), "themeda_triandra.csv")
write.csv(extract(november2021,tripsacum_dactyloides), "tripsacum_dactyloides.csv")


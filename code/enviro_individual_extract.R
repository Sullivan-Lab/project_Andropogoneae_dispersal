#soil grid extraction
setwd("D:/Kurt/Andro_Plastome_Tree")
setwd("D:/Kurt/SOILGRID Data")
library(gdalUtils)
library(raster)
library(rgdal)
library(geiger)
library(phytools)
library(picante)
library(maptools)
library(ape)
library(MODIStsp)
library(dplyr)
#required to load .nc files of terraclim
library(ncdf4)

#loaded longlat.csv, raster reads long > lat not lat > long
indi.gps = read.csv(file.choose(), header=F)

#bioclim data being raterised
bio1 = raster("BIOCLIM/wc2.1_30s_bio_1.tif")
bio2 = raster("BIOCLIM/wc2.1_30s_bio_2.tif")
bio3 = raster("BIOCLIM/wc2.1_30s_bio_3.tif")
bio4 = raster("BIOCLIM/wc2.1_30s_bio_4.tif")
bio5 = raster("BIOCLIM/wc2.1_30s_bio_5.tif")
bio6 = raster("BIOCLIM/wc2.1_30s_bio_6.tif")
bio7 = raster("BIOCLIM/wc2.1_30s_bio_7.tif")
bio8 = raster("BIOCLIM/wc2.1_30s_bio_8.tif")
bio9 = raster("BIOCLIM/wc2.1_30s_bio_9.tif")
bio10 = raster("BIOCLIM/wc2.1_30s_bio_10.tif")
bio11 = raster("BIOCLIM/wc2.1_30s_bio_11.tif")
bio12 = raster("BIOCLIM/wc2.1_30s_bio_12.tif")
bio13 = raster("BIOCLIM/wc2.1_30s_bio_13.tif")
bio14 = raster("BIOCLIM/wc2.1_30s_bio_14.tif")
bio15 = raster("BIOCLIM/wc2.1_30s_bio_15.tif")
bio16 = raster("BIOCLIM/wc2.1_30s_bio_16.tif")
bio17 = raster("BIOCLIM/wc2.1_30s_bio_17.tif")
bio18 = raster("BIOCLIM/wc2.1_30s_bio_18.tif")
bio19 = raster("BIOCLIM/wc2.1_30s_bio_19.tif")

#soil data
lai.max = raster("D:/Kurt/Andro_Plastome_Tree/maxavgLAI.tif")
burned.mean.log = raster("D:/Kurt/Andro_Plastome_Tree/Log_Burned.tif")
bulk.density05 = raster("D:/Kurt/SOILGRID Data/bulk-density_0-5cm_SoilGrids2.tif")
cation.ec05 = raster("D:/Kurt/SOILGRID Data/cec_0-5cm_SoilGrids2.tif")
coarse.frag.volumetric05 = raster("D:/Kurt/SOILGRID Data/cfvo_0-5cm_mean_SoilGrids2.tif")
clay.content05 = raster("D:/Kurt/SOILGRID Data/clay_0-5cm_SoilGrids2.tif")
nitrogen05 = raster("D:/Kurt/SOILGRID Data/nitrogen_0-5cm_mean_SoilGrids2.tif")
organic.carbon.density05 = raster("D:/Kurt/SOILGRID Data/ocd_0-5cm_mean_SoilGrids2.tif")
soil.organic.carbon.stock030 = raster("D:/Kurt/SOILGRID Data/ocs_0-30cm_mean_SoilGrids2.tif")
soil.ph05 = raster("D:/Kurt/SOILGRID Data/phh2o_0-5cm_mean_SoilGrids2.tif")
sand.content05 = raster("D:/Kurt/SOILGRID Data/sand_0-5cm_mean_SoilGrids2.tif")
silt.content05 = raster("D:/Kurt/SOILGRID Data/silt_0-5cm_mean_SoilGrids2.tif")
soil.organic.carbon.content05 = raster("D:/Kurt/SOILGRID Data/soc_0-5cm_mean_SoilGrids2.tif")


soil.type = raster("D:/Kurt/SOILGRID Data/MostProbable_SoilType_SoilGrids2.tif")

#load in the data from terraclim
#find values for each individual from all years and combine
setwd("D:/Kurt/TerraClim/pdsi")
list <- list() # creates a list
listnc <- dir(pattern = "*.nc") # creates the list of all the nc files

#loop to load in all files per year from the directory, rasterize and create a variable
for (i in 1958:2021) {
  filename <- paste0("TerraClimate_PDSI_", i)
  clim <- paste0("TerraClimate_PDSI_", i, ".nc")
  assign(filename, raster(clim))
  run <- paste("pdsi.", i, ".extract <- as.data.frame(mean(extract(TerraClimate_PDSI_", i, ",Andropogon_kelleri_TK718)))", sep="")
  eval(parse(text=run))
}
mean(as.numeric(c(pdsi.1958.extract,
pdsi.1959.extract,pdsi.1960.extract,pdsi.1961.extract,pdsi.1962.extract,
pdsi.1963.extract,pdsi.1964.extract,pdsi.1965.extract,pdsi.1966.extract,
pdsi.1967.extract,pdsi.1968.extract,pdsi.1969.extract,pdsi.1970.extract,pdsi.1971.extract,
pdsi.1972.extract,pdsi.1973.extract,pdsi.1974.extract,pdsi.1975.extract,
pdsi.1976.extract,pdsi.1977.extract,pdsi.1978.extract,pdsi.1979.extract,
pdsi.1980.extract,pdsi.1981.extract,pdsi.1982.extract,pdsi.1983.extract,
pdsi.1984.extract,pdsi.1985.extract,pdsi.1986.extract,pdsi.1987.extract,
pdsi.1988.extract,pdsi.1989.extract,pdsi.1990.extract,pdsi.1991.extract,pdsi.1992.extract,
pdsi.1993.extract,pdsi.1994.extract,pdsi.1995.extract,pdsi.1996.extract,pdsi.1997.extract,
pdsi.1998.extract,pdsi.1999.extract,pdsi.2000.extract,pdsi.2001.extract,pdsi.2002.extract,pdsi.2003.extract,
pdsi.2004.extract,pdsi.2005.extract,pdsi.2006.extract,pdsi.2007.extract,pdsi.2008.extract,
pdsi.2009.extract,pdsi.2010.extract,pdsi.2011.extract,pdsi.2012.extract,pdsi.2013.extract,
pdsi.2014.extract,pdsi.2015.extract,pdsi.2016.extract,pdsi.2017.extract,pdsi.2018.extract,
pdsi.2019.extract,pdsi.2020.extract,pdsi.2021.extract)),na.rm=TRUE)

for (i in 1958:2021) {
  filename <- paste0("TerraClimate_PDSI_", i)
  clim <- paste0("TerraClimate_PDSI_", i, ".nc")
  assign(filename, raster(clim))
  run <- paste("pdsi.", i, ".extract <- as.data.frame(mean(extract(TerraClimate_PDSI_", i, ",Diheteropogon_grandiflorus_TK551_PM)))", sep="")
  eval(parse(text=run))
}
mean(as.numeric(c(pdsi.1958.extract,
                  pdsi.1959.extract,pdsi.1960.extract,pdsi.1961.extract,pdsi.1962.extract,
                  pdsi.1963.extract,pdsi.1964.extract,pdsi.1965.extract,pdsi.1966.extract,
                  pdsi.1967.extract,pdsi.1968.extract,pdsi.1969.extract,pdsi.1970.extract,pdsi.1971.extract,
                  pdsi.1972.extract,pdsi.1973.extract,pdsi.1974.extract,pdsi.1975.extract,
                  pdsi.1976.extract,pdsi.1977.extract,pdsi.1978.extract,pdsi.1979.extract,
                  pdsi.1980.extract,pdsi.1981.extract,pdsi.1982.extract,pdsi.1983.extract,
                  pdsi.1984.extract,pdsi.1985.extract,pdsi.1986.extract,pdsi.1987.extract,
                  pdsi.1988.extract,pdsi.1989.extract,pdsi.1990.extract,pdsi.1991.extract,pdsi.1992.extract,
                  pdsi.1993.extract,pdsi.1994.extract,pdsi.1995.extract,pdsi.1996.extract,pdsi.1997.extract,
                  pdsi.1998.extract,pdsi.1999.extract,pdsi.2000.extract,pdsi.2001.extract,pdsi.2002.extract,pdsi.2003.extract,
                  pdsi.2004.extract,pdsi.2005.extract,pdsi.2006.extract,pdsi.2007.extract,pdsi.2008.extract,
                  pdsi.2009.extract,pdsi.2010.extract,pdsi.2011.extract,pdsi.2012.extract,pdsi.2013.extract,
                  pdsi.2014.extract,pdsi.2015.extract,pdsi.2016.extract,pdsi.2017.extract,pdsi.2018.extract,
                  pdsi.2019.extract,pdsi.2020.extract,pdsi.2021.extract)),na.rm=TRUE)

for (i in 1958:2021) {
  filename <- paste0("TerraClimate_PDSI_", i)
  clim <- paste0("TerraClimate_PDSI_", i, ".nc")
  assign(filename, raster(clim))
  run <- paste("pdsi.", i, ".extract <- as.data.frame(mean(extract(TerraClimate_PDSI_", i, ",Diheteropogon_filifolius_TK561_PM)))", sep="")
  eval(parse(text=run))
}
mean(as.numeric(c(pdsi.1958.extract,
                  pdsi.1959.extract,pdsi.1960.extract,pdsi.1961.extract,pdsi.1962.extract,
                  pdsi.1963.extract,pdsi.1964.extract,pdsi.1965.extract,pdsi.1966.extract,
                  pdsi.1967.extract,pdsi.1968.extract,pdsi.1969.extract,pdsi.1970.extract,pdsi.1971.extract,
                  pdsi.1972.extract,pdsi.1973.extract,pdsi.1974.extract,pdsi.1975.extract,
                  pdsi.1976.extract,pdsi.1977.extract,pdsi.1978.extract,pdsi.1979.extract,
                  pdsi.1980.extract,pdsi.1981.extract,pdsi.1982.extract,pdsi.1983.extract,
                  pdsi.1984.extract,pdsi.1985.extract,pdsi.1986.extract,pdsi.1987.extract,
                  pdsi.1988.extract,pdsi.1989.extract,pdsi.1990.extract,pdsi.1991.extract,pdsi.1992.extract,
                  pdsi.1993.extract,pdsi.1994.extract,pdsi.1995.extract,pdsi.1996.extract,pdsi.1997.extract,
                  pdsi.1998.extract,pdsi.1999.extract,pdsi.2000.extract,pdsi.2001.extract,pdsi.2002.extract,pdsi.2003.extract,
                  pdsi.2004.extract,pdsi.2005.extract,pdsi.2006.extract,pdsi.2007.extract,pdsi.2008.extract,
                  pdsi.2009.extract,pdsi.2010.extract,pdsi.2011.extract,pdsi.2012.extract,pdsi.2013.extract,
                  pdsi.2014.extract,pdsi.2015.extract,pdsi.2016.extract,pdsi.2017.extract,pdsi.2018.extract,
                  pdsi.2019.extract,pdsi.2020.extract,pdsi.2021.extract)),na.rm=TRUE)


#create list of new data.frames to combine to a single file for analysis
pdsi.list = cbind(pdsi.1958.extract,
                 pdsi.1959.extract,
                 pdsi.1960.extract,
                 pdsi.1961.extract,
                 pdsi.1962.extract,
                 pdsi.1963.extract,
                 pdsi.1964.extract,
                 pdsi.1965.extract,
                 pdsi.1966.extract,
                 pdsi.1967.extract,
                 pdsi.1968.extract,
                 pdsi.1969.extract,
                 pdsi.1970.extract,
                 pdsi.1971.extract,
                 pdsi.1972.extract,
                 pdsi.1973.extract,
                 pdsi.1974.extract,
                 pdsi.1975.extract,
                 pdsi.1976.extract,
                 pdsi.1977.extract,
                 pdsi.1978.extract,
                 pdsi.1979.extract,
                 pdsi.1980.extract,
                 pdsi.1981.extract,
                 pdsi.1982.extract,
                 pdsi.1983.extract,
                 pdsi.1984.extract,
                 pdsi.1985.extract,
                 pdsi.1986.extract,
                 pdsi.1987.extract,
                 pdsi.1988.extract,
                 pdsi.1989.extract,
                 pdsi.1990.extract,
                 pdsi.1991.extract,
                 pdsi.1992.extract,
                 pdsi.1993.extract,
                 pdsi.1994.extract,
                 pdsi.1995.extract,
                 pdsi.1996.extract,
                 pdsi.1997.extract,
                 pdsi.1998.extract,
                 pdsi.1999.extract,
                 pdsi.2000.extract,
                 pdsi.2001.extract,
                 pdsi.2002.extract,
                 pdsi.2003.extract,
                 pdsi.2004.extract,
                 pdsi.2005.extract,
                 pdsi.2006.extract,
                 pdsi.2007.extract,
                 pdsi.2008.extract,
                 pdsi.2009.extract,
                 pdsi.2010.extract,
                 pdsi.2011.extract,
                 pdsi.2012.extract,
                 pdsi.2013.extract,
                 pdsi.2014.extract,
                 pdsi.2015.extract,
                 pdsi.2016.extract,
                 pdsi.2017.extract,
                 pdsi.2018.extract,
                 pdsi.2019.extract,
                 pdsi.2020.extract,
                 pdsi.2021.extract)
write.csv(pdsi.list, "pdsi_indi.csv")

setwd("D:/Kurt/TerraClim/runoff")
list <- list() # creates a list
listnc <- dir(pattern = "*.nc") # creates the list of all the nc files
for (i in 1958:2021) {
  filename <- paste0("TerraClimate_q_", i)
  clim <- paste0("TerraClimate_q_", i, ".nc")
  assign(filename, raster(clim))
  run <- paste("runoff.", i, ".extract <- as.data.frame(extract(TerraClimate_q_", i, ",indi.gps))", sep="")
  eval(parse(text=run))
}
runoff.list = cbind(runoff.1958.extract,
                  runoff.1959.extract,
                  runoff.1960.extract,
                  runoff.1961.extract,
                  runoff.1962.extract,
                  runoff.1963.extract,
                  runoff.1964.extract,
                  runoff.1965.extract,
                  runoff.1966.extract,
                  runoff.1967.extract,
                  runoff.1968.extract,
                  runoff.1969.extract,
                  runoff.1970.extract,
                  runoff.1971.extract,
                  runoff.1972.extract,
                  runoff.1973.extract,
                  runoff.1974.extract,
                  runoff.1975.extract,
                  runoff.1976.extract,
                  runoff.1977.extract,
                  runoff.1978.extract,
                  runoff.1979.extract,
                  runoff.1980.extract,
                  runoff.1981.extract,
                  runoff.1982.extract,
                  runoff.1983.extract,
                  runoff.1984.extract,
                  runoff.1985.extract,
                  runoff.1986.extract,
                  runoff.1987.extract,
                  runoff.1988.extract,
                  runoff.1989.extract,
                  runoff.1990.extract,
                  runoff.1991.extract,
                  runoff.1992.extract,
                  runoff.1993.extract,
                  runoff.1994.extract,
                  runoff.1995.extract,
                  runoff.1996.extract,
                  runoff.1997.extract,
                  runoff.1998.extract,
                  runoff.1999.extract,
                  runoff.2000.extract,
                  runoff.2001.extract,
                  runoff.2002.extract,
                  runoff.2003.extract,
                  runoff.2004.extract,
                  runoff.2005.extract,
                  runoff.2006.extract,
                  runoff.2007.extract,
                  runoff.2008.extract,
                  runoff.2009.extract,
                  runoff.2010.extract,
                  runoff.2011.extract,
                  runoff.2012.extract,
                  runoff.2013.extract,
                  runoff.2014.extract,
                  runoff.2015.extract,
                  runoff.2016.extract,
                  runoff.2017.extract,
                  runoff.2018.extract,
                  runoff.2019.extract,
                  runoff.2020.extract,
                  runoff.2021.extract)
write.csv(runoff.list, "runoff_indi.csv")

setwd("D:/Kurt/TerraClim/soil")
list <- list() # creates a list
listnc <- dir(pattern = "*.nc") # creates the list of all the nc files
for (i in 1958:2021) {
  filename <- paste0("TerraClimate_soil_", i)
  clim <- paste0("TerraClimate_soil_", i, ".nc")
  assign(filename, raster(clim))
  run <- paste("soilmoisture.", i, ".extract <- as.data.frame(extract(TerraClimate_soil_", i, ",indi.gps))", sep="")
  eval(parse(text=run))
}
soilmoisture.list = cbind(soilmoisture.1958.extract,
                    soilmoisture.1959.extract,
                    soilmoisture.1960.extract,
                    soilmoisture.1961.extract,
                    soilmoisture.1962.extract,
                    soilmoisture.1963.extract,
                    soilmoisture.1964.extract,
                    soilmoisture.1965.extract,
                    soilmoisture.1966.extract,
                    soilmoisture.1967.extract,
                    soilmoisture.1968.extract,
                    soilmoisture.1969.extract,
                    soilmoisture.1970.extract,
                    soilmoisture.1971.extract,
                    soilmoisture.1972.extract,
                    soilmoisture.1973.extract,
                    soilmoisture.1974.extract,
                    soilmoisture.1975.extract,
                    soilmoisture.1976.extract,
                    soilmoisture.1977.extract,
                    soilmoisture.1978.extract,
                    soilmoisture.1979.extract,
                    soilmoisture.1980.extract,
                    soilmoisture.1981.extract,
                    soilmoisture.1982.extract,
                    soilmoisture.1983.extract,
                    soilmoisture.1984.extract,
                    soilmoisture.1985.extract,
                    soilmoisture.1986.extract,
                    soilmoisture.1987.extract,
                    soilmoisture.1988.extract,
                    soilmoisture.1989.extract,
                    soilmoisture.1990.extract,
                    soilmoisture.1991.extract,
                    soilmoisture.1992.extract,
                    soilmoisture.1993.extract,
                    soilmoisture.1994.extract,
                    soilmoisture.1995.extract,
                    soilmoisture.1996.extract,
                    soilmoisture.1997.extract,
                    soilmoisture.1998.extract,
                    soilmoisture.1999.extract,
                    soilmoisture.2000.extract,
                    soilmoisture.2001.extract,
                    soilmoisture.2002.extract,
                    soilmoisture.2003.extract,
                    soilmoisture.2004.extract,
                    soilmoisture.2005.extract,
                    soilmoisture.2006.extract,
                    soilmoisture.2007.extract,
                    soilmoisture.2008.extract,
                    soilmoisture.2009.extract,
                    soilmoisture.2010.extract,
                    soilmoisture.2011.extract,
                    soilmoisture.2012.extract,
                    soilmoisture.2013.extract,
                    soilmoisture.2014.extract,
                    soilmoisture.2015.extract,
                    soilmoisture.2016.extract,
                    soilmoisture.2017.extract,
                    soilmoisture.2018.extract,
                    soilmoisture.2019.extract,
                    soilmoisture.2020.extract,
                    soilmoisture.2021.extract)
write.csv(soilmoisture.list, "soilmoisture_indi.csv")

setwd("D:/Kurt/TerraClim/wind")
list <- list() # creates a list
listnc <- dir(pattern = "*.nc") # creates the list of all the nc files
for (i in 1958:2021) {
  filename <- paste0("TerraClimate_ws_", i)
  clim <- paste0("TerraClimate_ws_", i, ".nc")
  assign(filename, raster(clim))
  run <- paste("windspeed.", i, ".extract <- as.data.frame(extract(TerraClimate_ws_", i, ",indi.gps))", sep="")
  eval(parse(text=run))
}
windspeed.list = cbind(windspeed.1958.extract,
                          windspeed.1959.extract,
                          windspeed.1960.extract,
                          windspeed.1961.extract,
                          windspeed.1962.extract,
                          windspeed.1963.extract,
                          windspeed.1964.extract,
                          windspeed.1965.extract,
                          windspeed.1966.extract,
                          windspeed.1967.extract,
                          windspeed.1968.extract,
                          windspeed.1969.extract,
                          windspeed.1970.extract,
                          windspeed.1971.extract,
                          windspeed.1972.extract,
                          windspeed.1973.extract,
                          windspeed.1974.extract,
                          windspeed.1975.extract,
                          windspeed.1976.extract,
                          windspeed.1977.extract,
                          windspeed.1978.extract,
                          windspeed.1979.extract,
                          windspeed.1980.extract,
                          windspeed.1981.extract,
                          windspeed.1982.extract,
                          windspeed.1983.extract,
                          windspeed.1984.extract,
                          windspeed.1985.extract,
                          windspeed.1986.extract,
                          windspeed.1987.extract,
                          windspeed.1988.extract,
                          windspeed.1989.extract,
                          windspeed.1990.extract,
                          windspeed.1991.extract,
                          windspeed.1992.extract,
                          windspeed.1993.extract,
                          windspeed.1994.extract,
                          windspeed.1995.extract,
                          windspeed.1996.extract,
                          windspeed.1997.extract,
                          windspeed.1998.extract,
                          windspeed.1999.extract,
                          windspeed.2000.extract,
                          windspeed.2001.extract,
                          windspeed.2002.extract,
                          windspeed.2003.extract,
                          windspeed.2004.extract,
                          windspeed.2005.extract,
                          windspeed.2006.extract,
                          windspeed.2007.extract,
                          windspeed.2008.extract,
                          windspeed.2009.extract,
                          windspeed.2010.extract,
                          windspeed.2011.extract,
                          windspeed.2012.extract,
                          windspeed.2013.extract,
                          windspeed.2014.extract,
                          windspeed.2015.extract,
                          windspeed.2016.extract,
                          windspeed.2017.extract,
                          windspeed.2018.extract,
                          windspeed.2019.extract,
                          windspeed.2020.extract,
                          windspeed.2021.extract)
write.csv(windspeed.list, "windspeed_indi.csv")



#Extract the data to files
lai.max.extract = extract(lai.max,indi.gps)
write.csv(lai.max.extract, 'lai.indi.csv', row.names=F)

burned.mean.log.extract = extract(burned.mean.log,indi.gps)
write.csv(burned.mean.log.extract, 'burned_mean_log.csv', row.names=F)

bulk.density05.extract = extract(bulk.density05,indi.gps)
write.csv(bulk.density05.extract, 'bulk.density05.indi.csv', row.names=F)

cation.ec05.extract = extract(cation.ec05,indi.gps)
write.csv(cation.ec05.extract, 'cation.ec05.indi.csv', row.names=F)

coarse.frag.volumetric05.extract = extract(coarse.frag.volumetric05,indi.gps)
write.csv(coarse.frag.volumetric05.extract, 'coarse.frag.volumetric05.indi.csv', row.names=F)

clay.content05.extract = extract(clay.content05,indi.gps)
write.csv(clay.content05.extract, 'clay.content05.indi.csv', row.names=F)

nitrogen05.extract = extract(nitrogen05,indi.gps)
write.csv(nitrogen05.extract, 'nitrogen05.indi.csv', row.names=F)

organic.carbon.density05.extract = extract(organic.carbon.density05,indi.gps)
write.csv(organic.carbon.density05.extract, 'organic.carbon.density05.indi.csv', row.names=F)

soil.organic.carbon.stock030.extract = extract(soil.organic.carbon.stock030,indi.gps)
write.csv(soil.organic.carbon.stock030.extract, 'soil.organic.carbon.stock030.indi.csv', row.names=F)

soil.ph05.extract = extract(soil.ph05,indi.gps)
write.csv(soil.ph05.extract, 'soil.ph05.indi.csv', row.names=F)

sand.content05.extract = extract(sand.content05,indi.gps)
write.csv(sand.content05.extract, 'sand.content05.indi.csv', row.names=F)

silt.content05.extract = extract(silt.content05,indi.gps)
write.csv(silt.content05.extract, 'silt.content05.indi.csv', row.names=F)

soil.organic.carbon.content05.extract = extract(soil.organic.carbon.content05,indi.gps)
write.csv(soil.organic.carbon.content05.extract, 'soil.organic.carbon.content05.indi.csv', row.names=F)

soil.type.extract = extract(soil.type,indi.gps)
write.csv(soil.type.extract, 'soil.type.indi.csv', row.names=F)

bio1.extract = extract(bio1,indi.gps)
write.csv(bio1.extract, 'bio1.indi.csv', row.names=F)

bio2.extract = extract(bio2,indi.gps)
write.csv(bio2.extract, 'bio2.indi.csv', row.names=F)

bio3.extract = extract(bio3,indi.gps)
write.csv(bio3.extract, 'bio3.indi.csv', row.names=F)

bio4.extract = extract(bio4,indi.gps)
write.csv(bio4.extract, 'bio4.indi.csv', row.names=F)

bio5.extract = extract(bio5,indi.gps)
write.csv(bio5.extract, 'bio5.indi.csv', row.names=F)

bio6.extract = extract(bio6,indi.gps)
write.csv(bio6.extract, 'bio6.indi.csv', row.names=F)

bio7.extract = extract(bio7,indi.gps)
write.csv(bio7.extract, 'bio7.indi.csv', row.names=F)

bio8.extract = extract(bio8,indi.gps)
write.csv(bio8.extract, 'bio8.indi.csv', row.names=F)

bio9.extract = extract(bio9,indi.gps)
write.csv(bio9.extract, 'bio9.indi.csv', row.names=F)

bio10.extract = extract(bio10,indi.gps)
write.csv(bio10.extract, 'bio10.indi.csv', row.names=F)

bio11.extract = extract(bio11,indi.gps)
write.csv(bio11.extract, 'bio11.indi.csv', row.names=F)

bio12.extract = extract(bio12,indi.gps)
write.csv(bio12.extract, 'bio12.indi.csv', row.names=F)

bio13.extract = extract(bio13,indi.gps)
write.csv(bio13.extract, 'bio13.indi.csv', row.names=F)

bio14.extract = extract(bio14,indi.gps)
write.csv(bio14.extract, 'bio14.indi.csv', row.names=F)

bio15.extract = extract(bio15,indi.gps)
write.csv(bio15.extract, 'bio15.indi.csv', row.names=F)

bio16.extract = extract(bio16,indi.gps)
write.csv(bio16.extract, 'bio16.indi.csv', row.names=F)

bio17.extract = extract(bio17,indi.gps)
write.csv(bio17.extract, 'bio17.indi.csv', row.names=F)

bio18.extract = extract(bio18,indi.gps)
write.csv(bio18.extract, 'bio18.indi.csv', row.names=F)

bio19.extract = extract(bio19,indi.gps)
write.csv(bio19.extract, 'bio19.indi.csv', row.names=F)


#how to do individual species
plot(soil.shallow)
mean(extract(soil.shallow,Andropogon_abyssinicus), na.rm=TRUE)
mean(extract(soil.shallow,Andropogon_abyssinicus), na.rm=TRUE)
mean(extract(soil.shallow,Andropogon_abyssinicus), na.rm=TRUE)
mean(extract(soil.shallow,Andropogon_aequatoriensis), na.rm=TRUE)
mean(extract(soil.shallow,Andropogon_africanus), na.rm=TRUE)
mean(extract(soil.shallow,Andropogon_andringitrensis), na.rm=TRUE)
mean(extract(soil.shallow,Andropogon_angustatus), na.rm=TRUE)
mean(extract(soil.shallow,Andropogon_appendiculatus), na.rm=TRUE)
mean(extract(soil.shallow,Andropogon_arenarius), na.rm=TRUE)
mean(extract(soil.shallow,Andropogon_ascinodis), na.rm=TRUE)
mean(extract(soil.shallow,Andropogon_brachystachyus), na.rm=TRUE)
mean(extract(soil.shallow,Andropogon_brazzae), na.rm=TRUE)
mean(extract(soil.shallow,Andropogon_brazzae), na.rm=TRUE)
mean(extract(soil.shallow,Andropogon_burmanicus), na.rm=TRUE)
mean(extract(soil.shallow,Andropogon_canaliculatus), na.rm=TRUE)
mean(extract(soil.shallow,Andropogon_chevalieri), na.rm=TRUE)
mean(extract(soil.shallow,Andropogon_chinensis), na.rm=TRUE)
mean(extract(soil.shallow,Andropogon_chrysostachyus), na.rm=TRUE)
mean(extract(soil.shallow,Andropogon_chrysostachyus), na.rm=TRUE)
mean(extract(soil.shallow,Andropogon_crossotos), na.rm=TRUE)
mean(extract(soil.shallow,Andropogon_distachyos), na.rm=TRUE)
mean(extract(soil.shallow,Andropogon_durifolius), na.rm=TRUE)
mean(extract(soil.shallow,Andropogon_eucomus), na.rm=TRUE)
mean(extract(soil.shallow,Andropogon_fastigiatus), na.rm=TRUE)
mean(extract(soil.shallow,Andropogon_festuciformis), na.rm=TRUE)
mean(extract(soil.shallow,Andropogon_festuciformis), na.rm=TRUE)
mean(extract(soil.shallow,Andropogon_festuciformis), na.rm=TRUE)
mean(extract(soil.shallow,Andropogon_floridanus), na.rm=TRUE)
mean(extract(soil.shallow,Andropogon_gayanus), na.rm=TRUE)
mean(extract(soil.shallow,Andropogon_gayanus), na.rm=TRUE)
mean(extract(soil.shallow,Andropogon_gerardi), na.rm=TRUE)
mean(extract(soil.shallow,Andropogon_gerardi), na.rm=TRUE)
mean(extract(soil.shallow,Andropogon_glaucescens), na.rm=TRUE)
mean(extract(soil.shallow,Andropogon_glomeratus), na.rm=TRUE)
mean(extract(soil.shallow,Andropogon_greenwayi), na.rm=TRUE)
mean(extract(soil.shallow,Andropogon_greenwayi), na.rm=TRUE)
mean(extract(soil.shallow,Andropogon_gyrans), na.rm=TRUE)
mean(extract(soil.shallow,Andropogon_heterantherus), na.rm=TRUE)
mean(extract(soil.shallow,Andropogon_hondurensis), na.rm=TRUE)
mean(extract(soil.shallow,Andropogon_huillensis), na.rm=TRUE)
mean(extract(soil.shallow,Andropogon_ibityensis), na.rm=TRUE)
mean(extract(soil.shallow,Andropogon_ingratus), na.rm=TRUE)
mean(extract(soil.shallow,Andropogon_insolitus), na.rm=TRUE)
mean(extract(soil.shallow,Andropogon_itremoensis), na.rm=TRUE)
mean(extract(soil.shallow,Andropogon_ivohibensis), na.rm=TRUE)
mean(extract(soil.shallow,Andropogon_ivorensis), na.rm=TRUE)
mean(extract(soil.shallow,Andropogon_kelleri), na.rm=TRUE)
mean(extract(soil.shallow,Andropogon_kelleri), na.rm=TRUE)
mean(extract(soil.shallow,Andropogon_lateralis), na.rm=TRUE)
mean(extract(soil.shallow,Andropogon_laxatus), na.rm=TRUE)
mean(extract(soil.shallow,Andropogon_laxatus), na.rm=TRUE)
mean(extract(soil.shallow,Andropogon_leprodes), na.rm=TRUE)
mean(extract(soil.shallow,Andropogon_leprodes), na.rm=TRUE)
mean(extract(soil.shallow,Andropogon_liebmannii), na.rm=TRUE)
mean(extract(soil.shallow,Andropogon_ligulatus), na.rm=TRUE)
mean(extract(soil.shallow,Andropogon_lividus), na.rm=TRUE)
mean(extract(soil.shallow,Andropogon_longiberbis), na.rm=TRUE)
mean(extract(soil.shallow,Andropogon_macrophyllus), na.rm=TRUE)
mean(extract(soil.shallow,Andropogon_macrothrix), na.rm=TRUE)
mean(extract(soil.shallow,Andropogon_mannii), na.rm=TRUE)
mean(extract(soil.shallow,Andropogon_mannii), na.rm=TRUE)
mean(extract(soil.shallow,Andropogon_mohrii), na.rm=TRUE)
mean(extract(soil.shallow,Andropogon_munroi), na.rm=TRUE)
mean(extract(soil.shallow,Andropogon_pteropholis), na.rm=TRUE)
mean(extract(soil.shallow,Andropogon_pteropholis), na.rm=TRUE)
mean(extract(soil.shallow,Andropogon_pusillus), na.rm=TRUE)
mean(extract(soil.shallow,Andropogon_reedii), na.rm=TRUE)
mean(extract(soil.shallow,Andropogon_schirensis), na.rm=TRUE)
mean(extract(soil.shallow,Andropogon_schirensis), na.rm=TRUE)
mean(extract(soil.shallow,Andropogon_selloanus), na.rm=TRUE)
mean(extract(soil.shallow,Andropogon_tenuiberbis), na.rm=TRUE)
mean(extract(soil.shallow,Andropogon_ternarius), na.rm=TRUE)
mean(extract(soil.shallow,Andropogon_textilis), na.rm=TRUE)
mean(extract(soil.shallow,Andropogon_urbanianus), na.rm=TRUE)
mean(extract(soil.shallow,Andropogon_virgatus), na.rm=TRUE)
mean(extract(soil.shallow,Bothriochloa_decipiens), na.rm=TRUE)
mean(extract(soil.shallow,Diheteropogon_amplectens), na.rm=TRUE)
mean(extract(soil.shallow,Diheteropogon_filifolius), na.rm=TRUE)
mean(extract(soil.shallow,Diheteropogon_grandiflorus), na.rm=TRUE)
mean(extract(soil.shallow,Elymandra_androphila), na.rm=TRUE)
mean(extract(soil.shallow,Elymandra_archaelymandra), na.rm=TRUE)
mean(extract(soil.shallow,Elymandra_lithophila), na.rm=TRUE)
mean(extract(soil.shallow,Elymandra_subulata), na.rm=TRUE)
mean(extract(soil.shallow,Exotheca_abyssinica), na.rm=TRUE)
mean(extract(soil.shallow,Hyparrhenia_anamesa), na.rm=TRUE)
mean(extract(soil.shallow,Hyparrhenia_anemopaegma), na.rm=TRUE)
mean(extract(soil.shallow,Hyparrhenia_arrhenobasis), na.rm=TRUE)
mean(extract(soil.shallow,Hyparrhenia_bagirmica), na.rm=TRUE)
mean(extract(soil.shallow,Hyparrhenia_cyanescens), na.rm=TRUE)
mean(extract(soil.shallow,Hyparrhenia_cyanescens), na.rm=TRUE)
mean(extract(soil.shallow,Hyparrhenia_dichroa), na.rm=TRUE)
mean(extract(soil.shallow,Hyparrhenia_dichroa), na.rm=TRUE)
mean(extract(soil.shallow,Hyparrhenia_dichroa), na.rm=TRUE)
mean(extract(soil.shallow,Hyparrhenia_diplandra), na.rm=TRUE)
mean(extract(soil.shallow,Hyparrhenia_dregeana), na.rm=TRUE)
mean(extract(soil.shallow,Hyparrhenia_dregeana), na.rm=TRUE)
mean(extract(soil.shallow,Hyparrhenia_figariana), na.rm=TRUE)
mean(extract(soil.shallow,Hyparrhenia_figariana), na.rm=TRUE)
mean(extract(soil.shallow,Hyparrhenia_filipendula), na.rm=TRUE)
mean(extract(soil.shallow,Hyparrhenia_finitima), na.rm=TRUE)
mean(extract(soil.shallow,Hyparrhenia_gazensis), na.rm=TRUE)
mean(extract(soil.shallow,Hyparrhenia_glabriuscula), na.rm=TRUE)
mean(extract(soil.shallow,Hyparrhenia_hirta), na.rm=TRUE)
mean(extract(soil.shallow,Hyparrhenia_mobukensis), na.rm=TRUE)
mean(extract(soil.shallow,Hyparrhenia_mobukensis), na.rm=TRUE)
mean(extract(soil.shallow,Hyparrhenia_multiplex), na.rm=TRUE)
mean(extract(soil.shallow,Hyparrhenia_newtonii), na.rm=TRUE)
mean(extract(soil.shallow,Hyparrhenia_newtonii), na.rm=TRUE)
mean(extract(soil.shallow,Hyparrhenia_niariensis), na.rm=TRUE)
mean(extract(soil.shallow,Hyparrhenia_papillipes), na.rm=TRUE)
mean(extract(soil.shallow,Hyparrhenia_poecilotricha), na.rm=TRUE)
mean(extract(soil.shallow,Hyparrhenia_rudis), na.rm=TRUE)
mean(extract(soil.shallow,Hyparrhenia_rudis), na.rm=TRUE)
mean(extract(soil.shallow,Hyparrhenia_rudis), na.rm=TRUE)
mean(extract(soil.shallow,Hyparrhenia_smithiana), na.rm=TRUE)
mean(extract(soil.shallow,Hyparrhenia_subplumosa), na.rm=TRUE)
mean(extract(soil.shallow,Hyparrhenia_tamba), na.rm=TRUE)
mean(extract(soil.shallow,Hyparrhenia_tuberculata), na.rm=TRUE)
mean(extract(soil.shallow,Hyparrhenia_umbrosa), na.rm=TRUE)
mean(extract(soil.shallow,Hyparrhenia_umbrosa), na.rm=TRUE)
mean(extract(soil.shallow,Hyparrhenia_variabilis), na.rm=TRUE)
mean(extract(soil.shallow,Hyparrhenia_welwitschii), na.rm=TRUE)
mean(extract(soil.shallow,Monocymbium_lanceolatum), na.rm=TRUE)
mean(extract(soil.shallow,Schizachyrium_brevifolium), na.rm=TRUE)
mean(extract(soil.shallow,Schizachyrium_brevifolium), na.rm=TRUE)
mean(extract(soil.shallow,Schizachyrium_cirratum), na.rm=TRUE)
mean(extract(soil.shallow,Schizachyrium_claudopus), na.rm=TRUE)
mean(extract(soil.shallow,Schizachyrium_compressum), na.rm=TRUE)
mean(extract(soil.shallow,Schizachyrium_cubense), na.rm=TRUE)
mean(extract(soil.shallow,Schizachyrium_delavayi), na.rm=TRUE)
mean(extract(soil.shallow,Schizachyrium_delicatum), na.rm=TRUE)
mean(extract(soil.shallow,Schizachyrium_djalonicum), na.rm=TRUE)
mean(extract(soil.shallow,Schizachyrium_djalonicum), na.rm=TRUE)
mean(extract(soil.shallow,Schizachyrium_exile), na.rm=TRUE)
mean(extract(soil.shallow,Schizachyrium_fragile), na.rm=TRUE)
mean(extract(soil.shallow,Schizachyrium_gracile), na.rm=TRUE)
mean(extract(soil.shallow,Schizachyrium_gracile), na.rm=TRUE)
mean(extract(soil.shallow,Schizachyrium_gracilipes), na.rm=TRUE)
mean(extract(soil.shallow,Schizachyrium_jeffreysii), na.rm=TRUE)
mean(extract(soil.shallow,Schizachyrium_lomaense), na.rm=TRUE)
mean(extract(soil.shallow,Schizachyrium_malacostachyum), na.rm=TRUE)
mean(extract(soil.shallow,Schizachyrium_microstachyum), na.rm=TRUE)
mean(extract(soil.shallow,Schizachyrium_microstachyum), na.rm=TRUE)
mean(extract(soil.shallow,Schizachyrium_nodulosum), na.rm=TRUE)
mean(extract(soil.shallow,Schizachyrium_pseudeulalia), na.rm=TRUE)
mean(extract(soil.shallow,Schizachyrium_pulchellum), na.rm=TRUE)
mean(extract(soil.shallow,Schizachyrium_ruderale), na.rm=TRUE)
mean(extract(soil.shallow,Schizachyrium_salzmannii), na.rm=TRUE)
mean(extract(soil.shallow,Schizachyrium_scabriflorum), na.rm=TRUE)
mean(extract(soil.shallow,Schizachyrium_schweinfurthi), na.rm=TRUE)
mean(extract(soil.shallow,Schizachyrium_scoparium), na.rm=TRUE)
mean(extract(soil.shallow,Schizachyrium_spicatum), na.rm=TRUE)
mean(extract(soil.shallow,Schizachyrium_spicatum), na.rm=TRUE)
mean(extract(soil.shallow,Schizachyrium_sulcatum), na.rm=TRUE)
mean(extract(soil.shallow,Schizachyrium_thollonii), na.rm=TRUE)
mean(extract(soil.shallow,Schizachyrium_ursulus), na.rm=TRUE)
mean(extract(soil.shallow,Schizachyrium_yangambiense), na.rm=TRUE)

#finish bulk shallow


varlist = names(list)

for (i in 1:175){
  nam <- paste("A", i, sep = "")
  assign(nam, rnorm(3)+d)
}

lapply(list, mean(extract(bio1,)

list
for(i in list){
bio1extract = extract(paste("bio1,", i), sep="")
}

bio1extract = mean(extract(paste("bio1,", i) , na.rm=TRUE))
extract(bio1,Andropogon_abyssinicus_TK207_Arthan2017)

bio2i = mean(extract(bio2,i), na.rm=TRUE)
bio3i = mean(extract(bio3,i), na.rm=TRUE)
bio4i = mean(extract(bio4,i), na.rm=TRUE)
bio7i = mean(extract(bio7,i), na.rm=TRUE)
bio12i = mean(extract(bio12,i), na.rm=TRUE)
bio13i = mean(extract(bio13,i), na.rm=TRUE)
bio14i = mean(extract(bio14,i), na.rm=TRUE)
bio15i = mean(extract(bio15,i), na.rm=TRUE)
bio18i = mean(extract(bio18,i), na.rm=TRUE)
bio19i = mean(extract(bio19,i), na.rm=TRUE)
lai.maxi = mean(extract(lai.max,i), na.rm=TRUE)
burned.mean.logi = mean(extract(burned.mean.log,i), na.rm=TRUE)
bulk.density05i = mean(extract(bulk.density05,i), na.rm=TRUE)
cation.ec05i = mean(extract(cation.ec05,i), na.rm=TRUE)
coarse.frag.volumetric05i = mean(extract(coarse.frag.volumetric05,i), na.rm=TRUE)
clay.content05i = mean(extract(clay.content05,i), na.rm=TRUE)
nitrogen05i = mean(extract(nitrogen05,i), na.rm=TRUE)
soil.organic.carbon.stock030i = mean(extract(soil.organic.carbon.stock030,i), na.rm=TRUE)
soil.ph05i = mean(extract(soil.ph05,i), na.rm=TRUE)
sand.content05i = mean(extract(sand.content05,i), na.rm=TRUE)
silt.content05i = mean(extract(silt.content05,i), na.rm=TRUE)
soil.organic.carbon.content05i = mean(extract(soil.organic.carbon.content05,i), na.rm=TRUE)
soil.typei = mean(extract(soil.type,i), na.rm=TRUE)

i.list = cbind(
  bio1i,
  bio2i,
  bio3i,
  bio4i,
  bio7i,
  bio12i,
  bio13i,
  bio14i,
  bio15i,
  bio18i,
  bio19i,
  lai.maxi,
  burned.mean.logi,
  bulk.density05i,
  cation.ec05i,
  coarse.frag.volumetric05i,
  clay.content05i,
  nitrogen05i,
  soil.organic.carbon.stock030i,
  soil.ph05i,
  sand.content05i,
  silt.content05i,
  soil.organic.carbon.content05i,
  soil.typei)
write.csv(i.list,"i.list.csv")


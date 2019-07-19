# Average June temperature 1970-2000, deg. C
juneTempsFile <- "wc2.0_10m_tavg_06.tif"
# Average June temperature 1960-1990, deg. C * 10
juneTempsFile2 <- "tmean6.bil"
# Average annual temperature 1970-2000, deg. C
avgTempFile <- "wc2.0_bio_10m_01.tif"
install.packages("raster")
install.packages("rgdal")
library(raster)
library(rgdal)
library(viridis)
plot(raster(juneTempsFile), col = plasma(255))


msiyield <- read.csv("Miscanthus_sinensis_yield.csv")
msiXY <- as.matrix(msiyield[,3:2])
colnames(msiXY) <- c("x", "y")
# remove rows without spatial coordinates
msiXY <- msiXY[!is.na(msiXY[,1]), ]

# make raster object for tmean6.bil
juneTempsRaster2 <- raster(juneTempsFile2)
# extract cell numbers
msiCells <- cellFromXY(juneTempsRaster2, msiXY)

# get temperatures
msiJuneTemp <- getValues(juneTempsRaster2)[msiCells]
msiJuneTemp
typeof(msiJuneTemp)

GDtimesten <- function (x){
  part1 <- ifelse(x <= 100L | x >= 300L, 0L | 200L, x-100L)
  return(part1)
}


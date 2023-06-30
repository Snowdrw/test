#library(devtools)
#devtools::install_local("D:/gdalUtils-master.zip")

library(snowwarp)
#download_snowwarp_data(
#  mail = "lxfadd0410@gmail.com",
#  link = "https://drive.google.com/drive/folders/1m171rAXlZQc59OfaByyfdW4ua69U1tEo",
#  folder = file.path(getwd(), "data"))

folder <- file.path(getwd(), "data")
nTiles <- get_snowwarp_tiles(folder)

process_snowwarp(
  folder = folder,
  years = 2000:2020,
  cpus = round(parallel::detectCores()*0.7), # use 70% of cores
  otb_dir = "C:/Users/mac/Desktop/OTB-8.1.2-Win64/OTB-8.1.2-Win64",
  max_ram = memory.limit()*0.7, # use 70% of available RAM
  tiles = nTiles
)

# "Processing of Landsat tile 1 finished at 2022-03-11 11:14:08."
# "Processing of Landsat tile 1 started at 2022-03-11 09:56:22."
# Using Intel(R) Core(TM) i7-10510U CPU @ 1.80GHz (4 cores or 8 threads)   2.30 GHz. 16.0 GB RAM

#extract_snowwarp_stats(
#  folder = folder,
#  cpus = round(parallel::detectCores()*0.7))
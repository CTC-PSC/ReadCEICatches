##########################################################################################
##                                                                                      ##
## This script extracts the observed and estimated ceiling fisheries catches from the   ##
## Check Clb Out. The data frame "x" contains the ceiling catches                       ## 
##                                                                                      ##
##########################################################################################  

# ----------------------------------------------------------------------------------------

## Specify working directory

  wd <- "C:\\Users\\gart\\Desktop\\zzz\\ctc\\annual run old base\\2017\\evaluate cei fit"
  setwd(wd)

## Specify Name of Check Clb Out file

  file <- "1701BCheckClb.out"

# --------------------------------------------------------------------------------------------------------

lines <- readLines(file)
endLine <- grep("TERMINAL RUN COMPARISONS", lines) - 3

lines <- lines[1:endLine]

fisheryLines <- grep("CEILINGS SPECIFIED FOR", lines)
startLines <- fisheryLines + 6
endLines <- startLines + 37

x <- NULL
for(i in 1:length(startLines)) { 

  fishery <- lines[fisheryLines[i]]
  fishery <- substr(fishery, 24, nchar(fishery))

  catches <- lines[startLines[i]:endLines[i]]
  catches <- substr(catches, 1, 20)

  year <- as.numeric(substr(catches, 1,4))

  obs <- as.numeric(substr(catches, 7,12))

  est <- as.numeric(substr(catches, 15,20))

  temp <- data.frame(year, fishery, obs, est)

  x <- rbind(res, temp)

}

# --------------------------------------------------------------------------------------------------------

head(x,50)

## Part 2 - complete.R

## First lets make sure we still have a working directory where we want it pointing.
getwd()
## If the following is returned, we're good to go: 
## [1] "/Users/CamiceRevier1/Desktop/DataScienceTrack/R Programming"
## If not, we'll set the working directory:
setwd(paste(getwd(), "Desktop/DataScienceTrack/R Programming", sep = "/"))

## Now let's write our `complete` function:
complete <- function(directory, id = 1:332) {
  directory <- as.character(directory)
  id <- as.integer(id)
  files_list <- list.files(directory, full.names = TRUE) # To create a list of files.
  dat <- data.frame() # To create empty data frame, ready to be filled with our csv data.
  datmore <- data.frame() # To create data frame for starting csv files.
  idnobs <- data.frame() # To create data frame for final complete data observed.
  idnobs2 <- data.frame() # To creat data frame for working complete observed.
  for (i in id) {
    ## Time to set up our rbind loop to put it all together.      
    datmore <- read.csv(files_list[i]) # To read csv files with `id` value.
    dat <- rbind(dat, datmore) # To rbind new csv file with ones already included.
    noNAs <- datmore[complete.cases(datmore[2:3]),] #To remove rows with NAs in 2nd or 3rd columns.
    nobs <- nrow(noNAs) # To count the number of rows that have complete cases.
    idnobs2 <- c(i, nobs) # To create variables filled with working complete cases.
    idnobs <- rbind(idnobs, idnobs2) # To add together working and new complete cases for final values.
  }
  names(idnobs) <- c("ID", "nobs") # To create column names for output.
  print(idnobs)  # Prompts to show results on screen to save extra step.
}

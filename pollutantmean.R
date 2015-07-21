## Script for R Programming / Week 2 / Assignment 1 - Air Polution
## Part 1 - pullutantmean.R

## First we'll set the working directory more specifically:
setwd(paste(getwd(), "Desktop/DataScienceTrack/R Programming", sep = "/"))

## Then it's time to write our function:
pollutantmean <- function(directory, pollutant, id = 1:332) {
        directory <- as.character(directory)
        pollutant <- as.character(pollutant)
        id <- as.integer(id)
    files_list <- list.files(directory, full.names = TRUE) # To create a list of files.
    dat <- data.frame() # To create empty data frame, ready to be filled with our data.
    for (i in id) {
        dat <- rbind(dat, read.csv(files_list[i])) # To create rbind loop for adding files.
    }
    dat_subset <- dat[which(dat[, "ID"] %in% id),] # To create subset of data from `id` input.
    mean(dat_subset[, pollutant], na.rm=TRUE)  # Identifies mean of pollutant while removing NAs.
}

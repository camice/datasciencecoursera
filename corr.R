## Part 3 - corr.R

## First lets make sure we still have a working directory where we want it pointing.
getwd()
## If the following is returned, we're good to go: 
## [1] "/Users/CamiceRevier1/Desktop/DataScienceTrack/R Programming"
## If not, we'll set the working directory:
setwd(paste(getwd(), "Desktop/DataScienceTrack/R Programming", sep = "/"))

## Now let's write our `corr` function:
corr <- function(directory, threshold = 0) {
    directory <- as.character(directory)
    threshold <- as.numeric(threshold)
    total_corr <- function(myfunc) {
        data <- read.csv(file.path(directory, myfunc)) # To locate csv files.
        nobs <- sum(complete.cases(data)) # To compute the complete cases for all variables.
        if (nobs > threshold) {
          return (cor(data$nitrate, data$sulfate, use="complete.obs")) 
          # To indicate nitrate and sulfate data to be returned from complete observations
          # when above threshold.
      }
    }
    total_corrs <- sapply(list.files(directory), total_corr) # To calculate all correlations.
    total_corrs <- unlist(total_corrs[!sapply(total_corrs, is.null)]) # To remove nulls from totals.
    return (total_corrs)
}

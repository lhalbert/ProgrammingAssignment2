pollutantmean <- function(directory, pollutant, id = 1:332) {
     # Read the list of files
     files <- list.files(directory, full.names=TRUE)
     
     # Set empty data frame to enable combining all data into one file
     dat <- data.frame()
     
     # Gets the number of data files to set loop iteration
     n <- length(files)
     
     # Loop through each data file and bind the data into one file
     for (i in 2:n) {
          dat <- rbind(dat, read.csv(files[i]))
     } 
     
     # Subsets data
     dat_subset <- dat[which(dat[, "id"] == id),]
     
     # Calculate mean for specific field, ignore NA
     mean(dat_subset$pollutant, na.rm=TRUE)
}

## pollutantmean("specdata", "pollutant", id)

 



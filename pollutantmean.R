pollutantmean <- function(directory, pollutant, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'pollutant' is a character vector of length 1 indicating
    ## the name of the pollutant for which we will calculate the
    ## mean; either "sulfate" or "nitrate".
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return the mean of the pollutant across all monitors list
    ## in the 'id' vector (ignoring NA values)
    ## NOTE: Do not round the result!
    
    dirfiles<-list.files(directory, full.names = TRUE)
    cd<-c()
    
    for(i in id){
        df<-read.csv(dirfiles[i]) ## read current csv file
        md<-is.na(df[[pollutant]]) ## copy missing data (NA) to vector
        cd<-c(cd, df[[pollutant]][!md]) ## appends data (minus NA values) to vector 
    }
    mean<-mean(cd) ## find mean
    mean
}
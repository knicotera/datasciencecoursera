complete <- function(directory, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return a data frame of the form:
    ## id nobs
    ## 1  117
    ## 2  1041
    ## ...
    ## where 'id' is the monitor ID number and 'nobs' is the
    ## number of complete cases

    dirfiles<-list.files(directory, full.names = TRUE)
    cd<-c()
    final <- c()
    col_headings <- c('id','nobs')
    
    for(i in id){
        df<-read.csv(dirfiles[i]) ## read current csv file
        cd<-na.omit(df) ## omit rows with incomplete data
        x<-nrow(cd)
        final<-rbind(final, c(i, x))
    }
    final<-as.data.frame(final)
    names(final) <- col_headings
    final
}
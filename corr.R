corr <- function(directory, threshold = 0) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0
    
    ## Return a numeric vector of correlations
    ## NOTE: Do not round the result!
    
    ## You should count quantity of the completed cases in each file and, 
    ## if their sum exceeds threshold, then you should count correlation 
    ## between pollutants.
    
    dir<-list.files(directory, full.names = TRUE) 
    max<-length(dir) 
    thr<-c()
    cordf <- c()
    final<-c()
    
    comp <- complete(directory)
    
    for(i in 1:max){
        if(threshold<comp$nobs[i]){
            thr<-as.data.frame(rbind(thr, c(comp$id[i], comp$nobs[i])))
        } 
    }

    if(is.null(thr)){ 
        final<-numeric()
    } else{
        for(j in 1:nrow(thr)){
            a<-thr$V1[j]
            cordf<-read.csv(dir[a])
            cordf<-na.omit(cordf)
            final<-c(final, cor(cordf$nitrate, cordf$sulfate))
        }    
    }
    final
}
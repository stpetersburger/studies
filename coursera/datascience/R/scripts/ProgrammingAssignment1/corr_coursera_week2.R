corr <- function(directory,threshold=0) {
  
  #creating a list of filepaths
  pollutfiles<-list.files(directory,pattern="*.csv", full.names=TRUE)
  z<-c()
  
  #print(df)
  
  for (f in pollutfiles) {
                            t<-data.frame()
                            t<-read.csv(f,sep=",")
                            if (nrow(na.omit(t))>=threshold) {
                                t<-na.omit(t)
                                x=as.vector(t['nitrate'])
                                y=as.vector(t['sulfate'])
                                z<-append(z,cor(x,y))}
  }
  z
}
pollutantmean <- function(directory, pollutant, id = 1:332) {
  
  #creating a list of filepaths
  pollutfiles<-list.files(directory,pattern="*.csv", full.names=TRUE)
  pollutfiles<-sort(pollutfiles,decreasing=FALSE)
  pollutfiles<-pollutfiles[id]
  #print(pollutfiles)
  #merging the content of the filesinto 1 data frame
  t<-data.frame()
  for (f in pollutfiles) {
                          z<-data.frame()
                          z<-read.csv(f,sep=",",header=TRUE)
                          t<-rbind(t,z)#To join two data frames (datasets) vertically
                          #https://www.statmethods.net/management/merging.html
                          #print(i)
                         }
  #get the type of all the columns in the dataset
  #sapply(t,class)
  mean(t[,c(pollutant)],na.rm=TRUE)
}
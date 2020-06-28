pollutantmean <- function(directory, pollutant, id = 1:332) {
  
  #creating a list of filepaths
  pollutfiles<-list.files(directory,pattern="*.csv", full.names=TRUE)
  pollutfiles<-sort(pollutfiles,decreasing=FALSE)
  pollutfiles<-pollutfiles[id]
  #print(pollutfiles)
  i<-1
  #merging the content of the filesinto 1 data frame
  for (f in pollutfiles) {
                          if (i==1) { t<-data.frame()
                                      t<-read.csv(f,sep=",",header=TRUE)
                                      i<-i+1
                                      print(i)
                                    }
                          else      { z<-data.frame()
                                      z<-read.csv(f,sep=",",header=TRUE)
                                      t<-rbind(t,z)#To join two data frames (datasets) vertically
                                      #https://www.statmethods.net/management/merging.html
                                      #print(i)
                                    }
                        }
  #get the type of all the columns in the dataset
  #sapply(t,class)
  mean(t[,c(pollutant)],na.rm=TRUE)
}
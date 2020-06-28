complete <- function(directory,id=1:332) {
            
            #creating a list of filepaths
            pollutfiles<-list.files(directory,pattern="*.csv", full.names=TRUE)
            pollutfiles<-sort(pollutfiles,decreasing=FALSE)
            pollutfiles<-pollutfiles[id]
            #sum(!is.na(t$sulfate)&!is.na(t$nitrate))
            #nrow(na.omit(t))
            
            i<-1
            if(class(id)=="integer"&typeof(id)=="integer") {
                                                            df<-data.frame(id)}
            else {df<-as.data.frame(rep(id))}
            
            #print(df)
            
            for (f in pollutfiles) {
                                    if (i==1) { t<-data.frame()
                                    t<-read.csv(f,sep=",")
                                    t<-as.data.frame(nrow(na.omit(t)))
                                    names(t)<-"nobs"
                                    i<-i+1
                                    #print(t)
                                    }
                                    else      { z<-data.frame()
                                                z<-read.csv(f,sep=",")
                                                z<-as.data.frame(nrow(na.omit(z)))
                                                names(z)<-"nobs"
                                                t<-rbind(t,z)#To join two data frames (datasets) vertically
                                                #print(t)
                                                
              }
            }
            df<-cbind(df,t)
            names(df)<-c("id","nobs")
            print(df,index=FALSE)
}
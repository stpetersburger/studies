complete <- function(directory,id=1:332) {
  
  #creating a list of filepaths
  pollutfiles<-list.files(directory,pattern="*.csv", full.names=TRUE)
  pollutfiles<-pollutfiles[id]
  pollutfiles<-as.character(sort(pollutfiles))
  #sum(!is.na(t$sulfate)&!is.na(t$nitrate))
  #nrow(na.omit(t))
  
  #i<-1
  if(class(id)=="integer"&typeof(id)=="integer") {
     df<-data.frame(id)
     names(df)<-"id"
     df<-df[order(df$id),c(1)]
     df<-as.data.frame(df)}
  else {df<-as.data.frame(rep(id))}
  
  #print(df)
  t<-data.frame()
  for (f in pollutfiles) { z<-data.frame()
                           z<-read.csv(f,sep=",")
                           z<-as.data.frame(nrow(na.omit(z)))
                           t<-rbind(t,z)
    }
  
  df<-cbind(df,t)
  names(df)<-c("id","nobs")
  df
}
y<-34
#checking mode
mode(y)
#checking how the object is stored
storage.mode(y)
#converting between  modes
as.character(y)
#name object
names(y)<-"thirty four"
#check attributes of an object
attributes(y)
#define your own attributes
attributes(y)$my_attribute<-"its an even number"
#checking lenght of an object
length(y)
#checking class of an object
class(y)
#declare a matrix
p<-matrix(1:6,nrow = 2)
#check the dimmensions of a matrix
dim(p)
#rename the columns and rows of a matrix
dimnames(p)<-list(c("row1","row2"),c("col1","col2","col3"))


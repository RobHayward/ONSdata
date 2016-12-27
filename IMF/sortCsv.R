# this will sort out the Balkan csv file
da <- read.csv('./IMF/BalkLendtemp2.csv')
head(da)
colnames(da) <- gsub('x', 'int', colnames(da))
colnames(da) <- gsub('y', 'ex', colnames(da))
tail(da)

# 第一课
# R base
# object
# 如何创建对象
# 如何索引对象
# 对象之间的转换

# 数值型，字符型，逻辑型
# 向量
1:9
as.character(c(1,3,4))
(x <- c('1','3','4'))
x1 <-c('1','3','4')
x1[1]+x1[2]

x2 <- as.numeric(x1)
x2[1]+x2[2]

x[1:2]
x[c(1,3)]

seq(0,10,1)
rep(2,4)
rep(1:3,4)
rep(1:3,each = 4)

# 创建字符串a~f到向量y
y <- c('a','b','c','d','e','f')
letters[1:6]
LETTERS[1:6]

# 创建数值型向量1~9到向量x
# 创建逻辑向量z，如果x里面的元素大于3取值为真，否则为假 
(x <- 1:9)
(z <- x >3)

(z <- (x >3)*1)
as.logical(z)

# 矩阵
matrix(1:9,nrow=3)
X <- matrix(1:9,nrow=3,byrow = T)

X[1,3]
X[,3]
X[1,]
X[c(1,2),c(1,2)]

c(1,2,'a')
matrix(c(1,2,4,'a'),nrow=2)
# 列表list
?lm
ctl <- c(4.17,5.58,5.18,6.11,4.50,4.61,5.17,4.53,5.33,5.14)
trt <- c(4.81,4.17,4.41,3.59,5.87,3.83,6.03,4.89,4.32,4.69)
group <- gl(2, 10, 20, labels = c("Ctl","Trt"))
weight <- c(ctl, trt)
(lm.D9 <- lm(weight ~ group))

mylist <- list(c(1:3),'a')
mylist[[1]] 
mylist <- list(x=c(1:3),y=c("a"))
mylist$x
mylist$y
# 数据框dataframe
# 如何创建数据框
(mydf <- data.frame(id=c(1:9),name=letters[1:9]))
mydf$id
mydf[,2]

# 因子factor
mydf$id <- factor(mydf$id)

# 数列array

# 第二课
# 数据处理

# 第三题
# 基于titanic.csv数据
# 1.读取数据集，并显示前5行数据。
# 2.检查数据集是否存在缺失值，并统计每列的缺失值数量。
# 3.对于船票价格（fare）列，如果出现缺失值，请填充为该等级船票价格的均价。
# 4.计算每个船舱等级的人数。
# 5.根据船舱等级，计算不同性别人数。
# 6.对数据集按年龄升序进行排序，将结果保存为一个新的文件（sorted_titanic.csv）。
setwd('C:\\Users\\hp\\Downloads\\archive')
dir()
# 1.读取数据集，并显示前5行数据。
mydat <- read.csv('titanic.csv',header = T)
dim(mydat)
head(mydat,5)
tail(mydat,5)
# 2.检查数据集是否存在缺失值，并统计每列的缺失值数量。
# apply函数族
table(is.na(mydat))
apply(mydat,2,function(x) table(is.na(x)))
# 用函数

library(mice)
# md.pattern(mydat)
# 3.对于船票价格（fare）列，如果出现缺失值，请填充为该等级船票价格的均价。
table(is.na(mydat$Fare))

mydat$Fare[is.na(mydat$Fare)] <- mean(mydat$Fare,na.rm = T )

# 4.计算每个船舱等级的人数。
table(mydat$Pclass)
# 5.根据船舱等级，计算不同性别人数。
table(mydat$Pclass,mydat$Sex)
# 6.对数据集按年龄升序进行排序，将结果保存为一个新的文件（sorted_titanic.csv）

write.csv(mydat[order(mydat$Age),],'sorted_titanic.csv')


# Week 5 練習

# 比較韓國瑜&柯文哲在2018/1~2019/1貼文的變化

load("AllData.rda")
nrow(alldata)
names(alldata)

load("HanKY.rda")
load("KeWC.rda")

nrow(Han)
nrow(Ke)

library(dplyr)
library(data.table)
library(ggplot2)

# 設定日期時間格式
Han$Date=as.POSIXct(Han$Date,format = '%Y/%m/%d%H:%M:%S')
Ke$Date=as.POSIXct(Ke$Date,format = '%Y/%m/%d %H:%M:%S')

# 字串長度
Han.mes <- nchar(Han$Message)
summary(Han.mes)
Ke.mes <- nchar(Ke$Message)
summary(Ke.mes)

# 分月份
HanMonth <-Han%>%group_by(month=format(Date,"%Y/%m"))%>%count()%>%mutate(type="Han")
KeMonth <-Ke%>%group_by(month=format(Date,"%Y/%m"))%>%count()%>%mutate(type="Ke")

Month_rank=rbind(HanMonth, KeMonth)%>%arrange((month))

# save(HanMonth, file="HanMonth.rda")
# save(KeMonth, file="KeMonth.rda")
# save(Month_rank, file="MonthRank.rda")

# BAR
ggplot(Month_rank,aes(x=month,y=n,fill=type))+
  geom_bar(stat="identity",position = "dodge")
ggplot(Month_rank,aes(x=month,y=n,fill=type))+
  geom_bar(stat="identity")

# LINE
ggplot(Month_rank,aes(x=month,y=n,group=type,color=type))+geom_line()

# BOXPLOT
ggplot(Month_rank,aes(x=month,y=n))+geom_boxplot()

# POINT
ggplot(head(Han,347),aes(x=Share_Count,y=All_Reaction_Count))+
  geom_point()
ggplot(head(Ke,673),aes(x=Share_Count,y=All_Reaction_Count))+
  geom_point()

# Han.mes <- data.frame(Han.mes)
# Ke.mes <- data.frame(Ke.mes)

# HISTGRAM


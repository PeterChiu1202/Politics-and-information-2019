
# Week 4 Class
library(readr)
Jun.18 <- read_csv("201806_data.csv")
Jul.18 <- read_csv("201807_data.csv")
Aug.18 <- read_csv("201808_data.csv")
Sep.18 <- read_csv("201809_data.csv")
Oct.18 <- read_csv("201810_data.csv")
Nov.18 <- read_csv("201811_data.csv")
Dec.18 <- read_csv("201812_data.csv")
Jan.19 <- read_csv("201901_data.csv")

alldata=rbind(Jun.18, Jul.18, Aug.18, Sep.18, Oct.18, Nov.18, Dec.18, Jan.19)
data0709=rbind(Jul.18, Aug.18, Sep.18)
data1012=rbind(Oct.18, Nov.18, Dec.18)
data1011=rbind(Oct.18, Nov.18)

mean(nchar(data0709$Message))


n.6 = nchar(data0709$Message)
summary(n.6)
Ke6 = grep("柯文哲", data0709$Page_Name)
Din6 = grep("丁守中粉絲團", data0709$Page_Name)
Yao6 = grep("姚文智", data0709$Page_Name)

# 7~9月
library(dplyr)
library(tm)
filter(data0709,grepl("柯文哲",data0709$Page_Name)==T)%>%count() # 222
filter(data0709,grepl("丁守中粉絲團",data0709$Page_Name)==T)%>%count() # 231
filter(data0709,grepl("姚文智",data0709$Page_Name)==T)%>%count() # 329

# 取出柯文哲、丁守中、姚文智在7~9月的發文情況
Ke0709 = filter(data0709,grepl("柯文哲",data0709$Page_Name)==T)
Din0709 = filter(data0709,grepl("丁守中粉絲團",data0709$Page_Name)==T)
Yao0709 = filter(data0709,grepl("姚文智",data0709$Page_Name)==T)

Ke0709$Date=as.POSIXct(Ke0709$Date, format = "%Y/%m/%d %H:%M:%S")
Din0709$Date=as.POSIXct(Din0709$Date, format = "%Y/%m/%d %H:%M:%S")
Yao0709$Date=as.POSIXct(Yao0709$Date, format = "%Y/%m/%d %H:%M:%S")

# 三人發文的點讚數折線圖
plot(Ke0709$Date, Ke0709$LIKE_COUNT, type = "l")
plot(Din0709$Date, Din0709$LIKE_COUNT, type = "l")
plot(Yao0709$Date, Yao0709$LIKE_COUNT, type = "l")


















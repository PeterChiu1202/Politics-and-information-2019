
# Week 6 practice-2
load("AllData.rda")
# load("HanKY.rda")

library(tidyverse)

# 擷取照片型態的資料
photomatrix = filter(alldata, Type == "photo")
# 擷取所有影片資料中只有韓國瑜個人粉絲專頁的照片
HanPhoto = filter(photomatrix, Page_Name == "韓國瑜")
# 擷取所有影片資料中只有柯文哲個人粉絲專頁的照片
KePhoto = filter(photomatrix, Page_Name == "柯文哲")

# 擷取所有影片資料中有韓國瑜個人粉絲專頁以及其他外圍粉絲專頁的照片
Hangroup.Photo = filter(photomatrix, grepl("韓國瑜", photomatrix$Page_Name) == TRUE)
# 擷取所有影片資料中有柯文哲個人粉絲專頁以及其他外圍粉絲專頁的照片
Kegroup.Photo = filter(photomatrix, grepl("柯文哲", photomatrix$Page_Name) == TRUE)

table(Hangroup.Photo$Page_Name)
table(Kegroup.Photo$Page_Name)

# 找出韓國瑜在發布的照片中的臉友回應狀況
HanComment = data.frame(HanPhoto$Page_Name, HanPhoto$Comment_Count)
HangroupComment = Hangroup.Photo[, c(2,13,15)]
# 找出柯文哲在發布的照片中的臉友回應狀況
KeComment = data.frame(KePhoto$Page_Name, KePhoto$Comment_Count)
KegroupComment = Kegroup.Photo[, c(2,13,15)]

# 畫出韓國瑜 & 柯文哲的照片發文數量以及讀者回文數量
library(ggplot2)
# 韓國瑜
ggplot() + geom_bar(data = HangroupComment, aes(x=Page_Name) )

ggplot() + geom_bar( data = HangroupComment, 
                     aes(x=Page_Name, y=Comment_Count, group = Page_Name),
                     stat="identity")
# 柯文哲
ggplot() + geom_bar(data = KegroupComment, aes(x=Page_Name) )

ggplot() + geom_bar( data = KegroupComment, 
                     aes(x=Page_Name, y=Comment_Count, group = Page_Name),
                     stat="identity")

# 兩份資料合併
HanKeComment = rbind(HangroupComment, KegroupComment)
ggplot() + geom_bar(data = HanKeComment, aes(x=Page_Name) )

ggplot() + geom_bar( data = HanKeComment, 
                     aes(x=Page_Name, y=Comment_Count, group = Page_Name),
                     stat="identity")
# library(kableExtra)
# kable(head(HanKeComment))

# 依照page來源，將同一page不同發文時間的文章進行合併
HanKeMessage = HanKeComment %>% group_by(Page_Name) %>% 
  mutate(messageByName = paste0(Message, collapse = ""))

id = which(duplicated(HanKeMessage$Page_Name) == FALSE)

HanKeMessageAll = HanKeMessage[id,c(1,4)]
# kable(head(HanKeMessageAll))

# 清洗內文，只留下中文字後進行斷詞，只取出詞長度為兩字以上的詞
library(jiebaRD)
library(jiebaR)

cutter <- worker("tag")


# 另存成rda檔
save(Hangroup.Photo, file="HanPhoto.rda")
save(Kegroup.Photo, file="KePhoto.rda")
save(HanKeComment, file="HanKe.rda")

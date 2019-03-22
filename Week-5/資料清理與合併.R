
# Data Cleaning and Combine

library(readr)
Jan.18 <- read_csv("201801_data.csv")
Feb.18 <- read_csv("201802_data.csv")
Mar.18 <- read_csv("201803_data.csv")
Apr.18 <- read_csv("201804_data.csv")
May.18 <- read_csv("201805_data.csv")
Jun.18 <- read_csv("201806_data.csv")
Jul.18 <- read_csv("201807_data.csv")
Aug.18 <- read_csv("201808_data.csv")
Sep.18 <- read_csv("201809_data.csv")
Oct.18 <- read_csv("201810_data.csv")
Nov.18 <- read_csv("201811_data.csv")
Dec.18 <- read_csv("201812_data.csv")
Jan.19 <- read_csv("201901_data.csv")

alldata=rbind(Jan.18, Feb.18, Mar.18, Apr.18, May.18, Jun.18,
              Jul.18, Aug.18, Sep.18, Oct.18, Nov.18, Dec.18, Jan.19)

save(alldata, file="AllData.rda")

Han <- alldata %>% 
  filter(Page_Name == "韓國瑜") %>%
  select(Page_Name, Page_ID, Date, All_Reaction_Count, LIKE_COUNT, Comment_Count,
         Share_Count, Message, Type)

Ke <- alldata %>% 
  filter(Page_Name == "柯文哲") %>%
  select(Page_Name, Page_ID, Date, All_Reaction_Count, LIKE_COUNT, Comment_Count,
         Share_Count, Message, Type)

save(Han, file="HanKY.rda")
save(Ke, file="KeWC.rda")


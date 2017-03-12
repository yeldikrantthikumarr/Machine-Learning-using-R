#webscraping using R
install.packages("rvest")
install.packages("stringr")
install.packages("tidyr")
library(rvest)
library(stringr)
library(tidyr)
url <- 'http://espn.go.com/nfl/superbowl/history/winners'
webpage <- read_html(url)
sb_table <- html_nodes(webpage, 'table')
sb <- html_table(sb_table)[[1]]
head(sb)
sb <-sb[-(1:2),]
names(sb)<-c("Number","date","Site","Result")
head(sb)
sb$Number <- 1:51
head(sb)
#sb$Date <-as.Date(sb$Date,"%B. %d, %Y")
sb$date <- as.Date(sb$date, "%B. %d, %Y")
head(sb)

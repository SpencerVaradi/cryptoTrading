# https://steemkr.com/programming/@cryptovest/fetch-realtime-crypto-market-data-with-api-and-forecast-price-the-easy-way

library(shiny)
library(shinydashboard)
library(jsonlite)
library(ggplot2)
library(forecast)
library(lubridate)
library(PoloniexR)
library(dplyr)
library(quantmod)
library(data.table)
library(rlist)
library(pipeR)
library(kableExtra)
library(knitr)
cc <- fromJSON("https://min-api.cryptocompare.com/")

cc$AvailableCalls$Price$HistoDay$Info$Examples





cc_histoday_btc <- fromJSON("https://min-api.cryptocompare.com/data/histoday?fsym=BTC&tsym=USD&allData=true&e=CCCAGG")



# ticker.info <- ReturnTicker(poloniex.public)
# save(ticker.info,file = "tickerInfo.RDS")
load("tickerInfo.RDS")
ticker.info$pair <- rownames(ticker.info)
ticker.info <- tbl_df(ticker.info) %>%
  mutate(BaseCoin = gsub("_.*","",pair), Coin = gsub("*._","",pair))

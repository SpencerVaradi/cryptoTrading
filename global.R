# https://steemkr.com/programming/@cryptovest/fetch-realtime-crypto-market-data-with-api-and-forecast-price-the-easy-way

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
cc <- fromJSON("https://min-api.cryptocompare.com/")

cc$AvailableCalls$Price$HistoDay$Info$Examples

fsym <- "USD"
tsym <- "BTC"



cc_histoday_btc <- fromJSON("https://min-api.cryptocompare.com/data/histoday?fsym=BTC&tsym=USD&allData=true&e=CCCAGG")

endTime <- as.integer(now() - days(7))
startTime <- as.integer(now() - days(30))# cc_histoday_btc$Data$time[1]
# btc_ts <- ts(cc_histoday_btc$Data$close, start = startTime)
#               , end = endTime)
# fit_arima <- auto.arima(btc_ts)
# fc <- as.data.frame(forecast(fit_arima, 30))
# autoplot(fc)
# qplot(fc)
#
# accuracy(fit_arima)

key    = "YC7C2WW1-6B437QS2-A6RP9UXO-3Y5G4XUS"
secret = "faedae3e85145dbd895bb497328c1c16a9219768921f736258bcb3b800e2763e6fba58a0bf747ddd2888c27858037f7681d9072e8420b13f2a2b329c1eba834a"

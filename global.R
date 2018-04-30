# https://steemkr.com/programming/@cryptovest/fetch-realtime-crypto-market-data-with-api-and-forecast-price-the-easy-way

library(shiny)
library(shinydashboard)
library(jsonlite)
library(ggplot2)
library(forecast)
library(lubridate)
library(PoloniexR)
library(dplyr)
library(tidyr)
library(quantmod)
library(data.table)
# library(rlist)
# library(pipeR)
# library(kableExtra)
# library(knitr)

source('widgets.R')
source('chartsTab.R')
source('tradesTab.R')
source('tablesTab.R')
source('server.R')

poloniex.public <- PoloniexPublicAPI()

currencies <- ReturnCurrencies(poloniex.public)





header <- dashboardHeader(title = "Poloniex")

sidebar <-
  dashboardSidebar(sidebarMenu(
    menuItem('Charts', tabName = 'charts_tab', icon = icon('calendar')),
    menuItem('Trades', tabName = 'trades_tab', icon = icon('map')),
    menuItem(('Sample Tables'), tabName = 'tables_tab', icon('table'))

))



body <- dashboardBody(tabItems(chartsTab,tradesTab, tablesTab))
ui <-dashboardPage(header, sidebar, body)




shinyApp(ui, server)

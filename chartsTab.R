chartsTab <- tabItem(
  tabName = 'charts_tab',
  fluidRow(
    column(10,
      h2('currency_title', id = 'currency_title'),
      h3('currency_pair', id = 'currency_paid')
    ),
    column(2,
     dataTableOutput('price_table'),
        p('day_volume', id = 'day_volume'))
  ),

  fluidRow(
    price_chart_box,
    markets_tabs
  ),

  fluidRow(
    buy_box, stopLimit_box, sell_box
  ),

  fluidRow(
    sellOrders_box, buyOrders_box
  ),

  fluidRow(
    marketDepth_box
  ),

  fluidRow(
    tradeHistory_box, myOpenOrders_box
  )
)

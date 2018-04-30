currency_price_volume <-
  box(width = 12, dataTableOutput('price_table'),
    p(id = 'day_volume')
  )

price_chart_box <-
  box(width = 8,
    div(class = "col-md-6", dateRangeInput('chart_dateRange','Date Range', start = Sys.Date() - 30,
      end = Sys.Date(), separator = " - ", format = "dd/mm/yy")),
    div(class = "col-md-3", selectInput('chart_period','Period', choices = c('1H','2H','4H','8H','24H'), selected = '4H')),
    div(class = "col-md-3", selectInput('chart_type', 'Chart Type', choices = c('line','bar', 'candlesticks'), selected = 'candlesticks')),
    plotOutput('price_chart')
  )


markets_tabs <-
  tabBox(width = 4, title = 'Markets', id = 'markets_tabs', selected = 'btc_tab',
    tabPanel('BTC', 'btc_tab', dataTableOutput('btc_market')),
    tabPanel('ETH', 'eth_tab', dataTableOutput('eth_market')),
    tabPanel('XMR', 'xmr_tab', dataTableOutput('xmr_market')),
    tabPanel('USDT', 'usdt_tab', dataTableOutput('usdt_market'))
  )

buy_box <-
  box(width = 4, title = 'Buy',
    p('You have: '),
    p(id = 'buy_you_have'),
    p('Lowest Ask: '),
    p(id = 'buy_lowest_ask'),
    textInput('buy_price_input', 'Price'),
    textInput('buy_amt_input', 'Amount'),
    textInput('buy_total_input','Total'),
    actionButton('buy_buy_btn', 'Buy')
  )

stopLimit_box <-
  box(width = 4, title = "Stop Limit",
    p('You have: '),
    p(id = 'stopLimit_you_have'),
    p('Lowest Ask: '),
    p(id = 'stopLimit_lowest_ask'),
    textInput('stopLimit_price_input', 'Price'),
    textInput('stopLimit_Limit_input', 'Price'),
    textInput('stopLimit_amt_input', 'Amount'),
    textInput('stopLimit_total_input','Total'),
    actionButton('stopLimit_buy_btn', 'Buy'),
    actionButton('stopLimit_sell_btn', 'Sell')
  )

sell_box <-
  box(width = 4, title = 'Sell',
    p('You have: '),
    p(id = 'sell_you_have'),
    p('Highest Ask: '),
    p(id = 'sell_highest_ask'),
    textInput('sell_price_input', 'Price'),
    textInput('sell_amt_input', 'Amount'),
    textInput('sell_total_input','Total'),
    actionButton('sell_sell_btn', 'Sell')
  )

sellOrders_box <-
  box(width = 6, title = 'Sell Orders',
    dataTableOutput('sellOrders_table'))

buyOrders_box <-
  box(width = 6, title = 'By Orders',
    dataTableOutput('buyOrders_table'))

marketDepth_box <-
  box(width = 12, title = 'Market Depth',
    plotOutput('marketDepth_chart'))

tradeHistory_box <-
  tabBox(width = 6, title = 'Trade History', id = 'tradeHistory_box', selected = 'market_trades_tab',
    tabPanel('Market Trades', 'market_trades_tab', dataTableOutput('market_trades_table')),
    tabPanel('My Trades', 'my_trades_tab', dataTableOutput('my_trades_table')))

myOpenOrders_box <-
  box(width = 6, title = 'My Open Orders',
    dataTableOutput('myOpenOrders_table'))

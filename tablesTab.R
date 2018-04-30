ticker.info <- tbl_df(ReturnTicker(poloniex.public))


ticker.info <- ticker.info %>%
  tibble::rownames_to_column(var = 'pair') %>%
  separate(pair, c('base','target'))

ticker.info$base <- lapply(rownames(ticker.info), function (x){strsplit(x,'_')[[1]][1]})
ticker.info$target <- lapply(rownames(ticker.info), function (x){strsplit(x,'_')[[1]][2]})

volume.info <- Return24hVolume(poloniex.public)
volume.info.totals <- volume.info$volume.totals

pair       <- "all"
depth      <- 10
order.book <- ReturnOrderBook(poloniex.public,
                              pair  = pair,
                              depth = depth)
order.book.bid <- order.book$bid
order.book.btc <- order.book$BTC_ETH$bid
order.book[['BTC_ETH']]['bid']


tablesTab <- tabItem(
  tabName = 'tables_tab',
  box(title = 'ticker.info', div(style = 'overflow-x: scroll',
    dataTableOutput('sample_ticker.info_table'))
)

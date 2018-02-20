baseCoin <- "BTC"

ticker.info <- ReturnTicker(poloniex.public)
ticker.info$pair <- rownames(ticker.info)
ticker.info <- tbl_df(ticker.info) %>%
  mutate(BaseCoin = gsub("_.*","",pair), Coin = gsub("*._","",pair))

ticker.info$from

  mutate(from = strsplit(pair, "_")[2], to = strsplit(pair, "_")[1])


targetCoin <- "BTC"
balances <- ReturnBalances(poloniex.trading)
targetTotalBalance <- tbl_df(balances)
targetTotalBalance <- targetTotalBalance %>%
  mutate(coins = names(balances), pair = paste0(targetCoin,"_",coins)) %>%
  left_join(ticker.info,by = pair) %>%
  select(everything())

usdTotalBalance_cols <- c("balances","coins","pair","last")
usdTotalBalance <- targetTotalBalance %>%
  select_vars(names(targetTotalBalance), usdTotalBalance_cols)

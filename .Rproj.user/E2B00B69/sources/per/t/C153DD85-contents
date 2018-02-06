# Altpocket table contains cols:
# Token, Market, Exhange, Amount, Bought At, Bought For, Price Now, Worth Now, Profit, %Change


# Start with trade history and work forward

Sys.setenv(tz="UTC")
pair   <- "all"
from   <- as.POSIXct("2017-07-01 00:00:00 UTC")
to     <- as.POSIXct("2017-07-04 00:00:00 UTC")

trade.history <-  ProcessTradingRequest(poloniex.trading,
                                        command = poloniex.trading@commands$returnTradeHistory,
                                        args = list(currencyPair = pair,
                                                    start        = as.numeric(from,
                                                    end          = as.numeric(to))))

validTrades <- trade.history %>>%
  list.clean
  list.stack(fill = TRUE)

tradePairs <- names(trade.history)
trade.historyT <- tbl_df(rbindlist(trade.history$BTC_ETC, fill = TRUE))


getCurPrice <- function(token, currency = "USD"){

}

getActiveInvestments <- function(tradeHistories, currency = "USD") {
  activeInvestments <- tibble(rbind(tradeHistories))
  activeInvestments <- activeInvestments %>%
    mutate(Token = ,
           Market = ,
           Exhange = ,
           Amount = ,
           BoughtAt = ,
           BoughtFor =BoughtAt * Amount,
           PriceNow = getCurPrice(Token, currency),
           WorthNow = PriceNow * Amount,
           Profit = WorthNow - BoughtFor,
           %Change = ,
           DateBought = ,)
}

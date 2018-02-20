dashboardPage(
  dashboardHeader(title = "Crypto Trading"),
  dashboardSidebar(),
  dashboardBody(
    fluidRow(
      box(
        title = "Current Balances", width = 12,
        selectInput("baseCoinSelect", "Base Coin",
                    choices = unique(ticker.info["BaseCoin"])),
                    tableOutput("tickerTable")
      )
    )
  )
)

function(input, output){
  output$tickerTable <- function(){
    req(input$baseCoinSelect)
      ticker.info %>%
      knitr::kable("html") %>%
      kable_styling(bootstrap_options = c("hover","condensed","responsive"))
  }
}

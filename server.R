server <- function(input, output, session){

  chart.data <- reactive({
    pair <-  paste0(input$pair_base,'_',input$pair_var)
    from <- as.POSIXct(as.character(input$chart_dateRange[1]))
    to <-  as.POSIXct(as.character(input$chart_dateRange[2]))
    period <- as.character(input$chart_period)
    type <- input$chart_type

    data <- ReturnChartData(theObject = poloniex.public,
      pair = pair,
      from = from,
      to = to,
      period = period)

    return(data)
  })

  ### Test data
  # pair <- 'BTC_ETC'
  # from <- as.POSIXct(as.character(Sys.Date() - 30))
  # to <- as.POSIXct(as.character(Sys.Date()))
  # period <- '4H'
  # type <- 'line'



  chart.type <- reactive({input$chart_type})

  output$price_chart <- renderPlot({
    chart.plot <- chart_Series(chart.data()[, 'close'],
    type = input$chart_type,# chart.data()$type,
    name = 'chart') # chart.data()$pair)# ,
    #subset = paste0(from,'/',to))

  chart.plot <- add_MACD()
  chart.plot <- add_BBands()
  chart.plot <- add_RSI()
  return(chart.plot)})


  observe({


  })
}

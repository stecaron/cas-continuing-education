# Define server function --------------------------------------------------


server <- function(input, output, session) {
  
  input_new_log <- reactive(
    data.table(
      log_hours_type = input$new_log_type_hours,
      log_date = input$new_log_date,
      log_location = input$new_log_location,
      log_description = input$new_log_description
    )
  )
  
  logs <- reactiveValues(data = import_data("data/data_logs.csv"))
  
  observeEvent(input$new_log_add_button, {
    logs$data <- update_data(logs$data, input_new_log())
    export_data(logs$data, "data/data_logs.csv")
  })
  
  output$historical_logs_table <- renderDataTable({
    logs$data
  })

}
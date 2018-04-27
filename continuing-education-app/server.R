# Define server function --------------------------------------------------


server <- function(input, output, session) {
  
  input_new_log <- reactive(
    list(
      log_hours_type = input$new_log_type_hours,
      log_date = input$new_log_date,
      log_location = input$new_log_location,
      log_description = input$new_log_description
    )
  )
  
  observeEvent(input$new_log_add_button, {
    data_logs <- update_data(data_logs, input_new_log())
    export_data(data_logs, "../data/data_logs.csv")
  })

}
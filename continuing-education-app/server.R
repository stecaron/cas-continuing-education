# Define server function --------------------------------------------------


server <- function(input, output, session) {
  
  input_new_log <- reactive(
    data.table(
      log_hours_type = input$new_log_type_hours,
      log_number_hours = input$new_log_number_hours,
      log_date = input$new_log_date,
      log_location = input$new_log_location,
      log_description = input$new_log_description
    )
  )
  
  logs <- reactiveValues(data = import_data("data/data_logs.csv"))
  
  observeEvent(input$new_log_add_button, {
    logs$data <- update_data(logs$data, input_new_log())
    export_data(logs$data, "data/data_logs.csv")
    showModal(modalDialog(
      title = "Lezgo!",
      "Your log has been successfully added to your log file."
    ))
  })
  
  output$historical_logs_table <- renderDataTable({
    datatable(logs$data, colnames = c("Hours Type", "Number of hours", "Date", "Location", "Description"), options = list(order = list(list(2, 'asc'))))
  })
  
  data_stats <- reactive({
    included_years <- c(year(input$stats_date) - number_of_calendar_years + 1: year(input$stats_date))
    data.table(logs$data)[year(log_date) %in% included_years,]
  })

  output$value_box_total_hours <- renderValueBox({
    valueBox(
      sum(data_stats()$log_number_hours), "Total hours", icon = icon("calendar"),
      color = "orange"
    )
  })
  
  output$value_box_total_objective <- renderValueBox({
    valueBox(
      round(100 * sum(data_stats()$log_number_hours)/min_number_of_combine_hours, 1), "% total hours target", icon = icon("bullseye"),
      color = "orange"
    )
  })
  
  output$value_box_structured_objective <- renderValueBox({
    valueBox(
      round(100 * sum(data_stats()[log_hours_type == "Unstructured", ]$log_number_hours)/min_number_of_structured_hours, 1), "% structured hours target", icon = icon("bookmark"),
      color = "orange"
    )
  })
  
  output$graph_detailed_summary <- renderPlot({
    data_stats()[, .(number_hours = sum(log_number_hours)), by = .(year = year(log_date), hours_type = log_hours_type)] %>% 
      ggplot(aes(x = as.factor(year), y = number_hours, fill = hours_type)) +
        geom_bar(stat = "identity", position = "dodge") +
        scale_x_discrete("Calendar year") +
        scale_y_continuous("Number of hours completed (hours)") +
        scale_fill_discrete("Type of hours") +
        theme_classic() +
        theme(legend.position = "bottom")
  })

}
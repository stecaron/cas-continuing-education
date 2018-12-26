# Define user interface (UI) ----------------------------------------------

ui <- dashboardPage(
  
  dashboardHeader(title = div(img(src="logo.png", height = 35, width = 35), "Continuing Education App"), titleWidth = 300),
  dashboardSidebar(
    sidebarMenu(
      menuItem(text = "Add a log", tabName = "add_log", icon = icon("cart-plus")),
      menuItem(text = "Statistics", tabName = "stats", icon = icon("bar-chart")),
      menuItem(text = "Historical logs", tabName = "historical_logs", icon = icon("list-ul"))
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "add_log",
        box(title = "Log informations", width = 6,
          selectInput("new_log_type_hours", label = "Type of hours:", choices = c("Structured", "Unstructured"), selected = "Unstructured"),
          numericInput("new_log_number_hours", label = "Number of hours:", step = 0.5, min = 0, value = 0),
          dateInput("new_log_date", label = "Date of the log", value = Sys.Date()),
          selectInput("new_log_prof_hours", label = "Professional hours", choices = c("Yes", "No"), selected = "No"),
          textInput("new_log_location", label = "Location of the log:"),
          textAreaInput("new_log_description", label = "Brief description of the log:"),
          actionButton("new_log_add_button", label = "Add the new log:")
        )
      ),
      tabItem(tabName = "stats",
        fluidRow(
          box(title = "Parameters", width = 4, height = 250,
              dateInput("stats_date", label = "Date of analysis", value = Sys.Date()),
              paste("The CAS/ICA requirements are usually reviewed over the last ", number_of_calendar_years, " calendar years."), br(),
              paste("The requirements are ", min_number_of_combine_hours, " total hours, which includes at least ", min_number_of_structured_hours, "hours of structured activities.")
          ),
          box(title = "Summary", width = 8, height = 250,
            valueBoxOutput("value_box_total_hours"),
            valueBoxOutput("value_box_total_objective"),
            valueBoxOutput("value_box_structured_objective")
          )
        ),
        fluidRow(
          box(title = "Detailed summary", width = 4, height = 500,
              plotOutput("graph_detailed_summary")
          ),
          box(title = "Projections", width = 8, height = 500,
              "Average number of hours to do in order to meet requirements at the end of the calendar year.",
              plotOutput("graph_projections")
          )
        )
      ),
      tabItem(tabName = "historical_logs",
        dataTableOutput("historical_logs_table")
      )
    )
  )
)
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
          selectInput("new_log_type_hours", label = "Type of hours", choices = c("Structured", "Unstructured"), selected = "Unstructured"),
          dateInput("new_log_date", label = "Date of the log", min = "2018-01-01", max = "2021-12-31", value = Sys.Date()),
          textInput("new_log_location", label = "Location of the log"),
          textAreaInput("new_log_description", label = "Brief description of the log"),
          actionButton("new_log_add_button", label = "Save the new log")
        )
      ),
      tabItem(tabName = "stats"
        
      ),
      tabItem(tabName = "historical_logs"
        
      )
    )
  )
)
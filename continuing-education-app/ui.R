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
  dashboardBody()
)
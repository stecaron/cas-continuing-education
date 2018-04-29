
update_data <- function(data, new_data) {
  
  new_data[, log_date := as.character(log_date)]
  updated_data <- rbindlist(list(data, new_data), use.names = TRUE, fill = FALSE)
  
}
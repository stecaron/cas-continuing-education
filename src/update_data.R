
update_data <- function(data, list_of_new_data) {
  
  new_data <- data.frame(
    log_hours_type = list_of_new_data$log_hours_type,
    log_date = list_of_new_data$log_date,
    log_location = list_of_new_data$log_location,
    log_description = list_of_new_data$log_description
  )
  
  rbind(data, new_data)
  
}
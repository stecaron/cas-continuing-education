
import_data <- function(path) {
  
  if (!file.exists(path)) {
    
    empty_data_table <- data.table(
      log_hours_type = NA_character_,
      log_number_hours = NA_integer_,
      log_date = NA_character_,
      log_module = NA_character_,
      log_location = NA_character_,
      log_description = NA_character_
    )
    
    if (!dir.exists("data/")) {
      dir.create(path = "data/")
    }

    fwrite(empty_data_table[-1,], path)
    showNotification("The input data file does not exists so we initialized one for you.")
  }
  
  data <- fread(path)
  data[, log_date := as.Date(log_date)]
  
}

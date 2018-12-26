
import_data <- function(path) {
  
  if (!file.exists(path)) {
    
    empty_data_table <- data.table(
      log_hours_type = NA,
      log_number_hours = NA,
      log_date = NA,
      log_prof_hours = NA,
      log_location = NA,
      log_description = NA
    )
    
    if (!dir.exists("data/")) {
      dir.create(path = "data/")
    }

    fwrite(empty_data_table[-1,], path)
    showNotification("The input data file does not exists so we initialized one for you.")
  }
  
  fread(path)
  
}
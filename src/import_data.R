
import_data <- function(path) {
  
  if (!file.exists(path)) {
    
    empty_data_table <- data.table(
      log_hours_type = NA_character_,
      log_date = NA,
      log_location = NA_character_,
      log_description = NA_character_
    )
    
    if (!dir.exists("data/")) {
      dir.create(path = "data/")
    }

    fwrite(empty_data_table[-1,], path)
    message("The input data file does not exists so we initialized one for you.")
  }
  
  read.csv(path)
  
}
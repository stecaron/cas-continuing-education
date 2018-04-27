
export_data <- function(data, path) {
  
  fwrite(data.table(data), path, dateTimeAs = "write.csv")
  
}
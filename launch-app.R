# -------------------------------------------------------------------------
# Title: launch-app
# Goal: This script aims to launch the shiny app and all required functions
# Date: 26 april 2018
# Author: Stéphane Caron
# -------------------------------------------------------------------------


# Load packages -----------------------------------------------------------

library(shiny)
library(shinydashboard)
library(data.table)


# Source functions --------------------------------------------------------

source("src/import_data.R")
source("src/export_data.R")
source("src/update_data.R")


# Import initial data -----------------------------------------------------

data_logs <- import_data("data/data_logs.csv")

# Run app -----------------------------------------------------------------

runApp("continuing-education-app")

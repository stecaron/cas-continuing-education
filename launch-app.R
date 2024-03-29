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
library(DT)
library(ggplot2)
library(dplyr)


# Source functions --------------------------------------------------------

source("src/import_data.R")
source("src/export_data.R")
source("src/update_data.R")


# Define requirements parameters ------------------------------------------

# Period of time the requirements are reviewed (years)
number_of_calendar_years <- 2
# Minimum number of total hours (unstructured + structured)
min_number_of_combine_hours <- 80
# Minimum number of structured hours (structured)
min_number_of_structured_hours <- 30


# Run app -----------------------------------------------------------------

runApp("continuing-education-app")

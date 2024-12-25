library(readxl)
file_path <- "data/other_parameters.xlsx"
other_parameters <- read_excel(file_path)
save(other_parameters, file = "data/other_parameters.RData")
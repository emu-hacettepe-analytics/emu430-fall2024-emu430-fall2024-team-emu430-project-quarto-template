library(readxl)

file_path <- "data/total_deaths.xlsx"
total_deaths <- read_excel(file_path)

save(total_deaths, file = "data/total_deaths.RData")
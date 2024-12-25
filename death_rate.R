library(readxl)

file_path <- "data/death_rate.xlsx"
death_rate <- read_excel(file_path)

save(death_rate, file = "data/death_rate.RData")
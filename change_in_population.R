library(readxl)

file_path <- "data/change_in_population.xlsx"
change_in_population <- read_excel(file_path)

save(change_in_population, file = "data/change_in_population.RData")
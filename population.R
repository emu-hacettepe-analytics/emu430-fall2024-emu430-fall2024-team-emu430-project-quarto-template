library(readxl)
file_path <- "data/population.xlsx"
population <- read_excel(file_path)
save(population, file = "data/population.RData")
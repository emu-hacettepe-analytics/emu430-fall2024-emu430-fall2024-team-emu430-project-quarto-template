library(readxl)

file_path <- "data/life_expectancy.xlsx"
life_expectancy <- read_excel(file_path)

save(life_expectancy, file = "data/life_expectancy.RData")
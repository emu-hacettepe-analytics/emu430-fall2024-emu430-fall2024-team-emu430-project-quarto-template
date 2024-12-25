library(readxl)

file_path <- "data/mortality.xlsx"
mortality <- read_excel(file_path)

save(mortality, file = "data/mortality.RData")
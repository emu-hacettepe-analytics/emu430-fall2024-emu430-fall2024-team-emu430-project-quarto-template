library(readxl)

file_path <- "data/child.xlsx"
child <- read_excel(file_path)

save(child, file = "data/child.RData")
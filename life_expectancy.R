library(readxl)
file_path <- "C:/Users/bugra/OneDrive/Belgeler/veri_proje/veri_dataset/life_expectancy.xlsx"
life_expectancy <- read_excel(file_path)
save(life_expectancy, file = "C:/Users/bugra/OneDrive/Belgeler/veri_proje/veri_dataset/life_expectancy.RData")
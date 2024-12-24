library(readxl)
file_path <- "C:/Users/bugra/OneDrive/Belgeler/veri_proje/veri_dataset/population.xlsx"
population <- read_excel(file_path)
save(population, file = "C:/Users/bugra/OneDrive/Belgeler/veri_proje/veri_dataset/population.RData")
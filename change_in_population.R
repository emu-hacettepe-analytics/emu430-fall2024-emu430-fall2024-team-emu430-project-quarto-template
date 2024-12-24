library(readxl)
file_path <- "C:/Users/bugra/OneDrive/Belgeler/veri_proje/veri_dataset/change_in_population.xlsx"
change_in_population <- read_excel(file_path)
save(change_in_population, file = "C:/Users/bugra/OneDrive/Belgeler/veri_proje/veri_dataset/change_in_population.RData")
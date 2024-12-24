library(readxl)
file_path <- "C:/Users/bugra/OneDrive/Belgeler/veri_proje/veri_dataset/total_deaths.xlsx"
total_deaths <- read_excel(file_path)
save(total_deaths, file = "C:/Users/bugra/OneDrive/Belgeler/veri_proje/veri_dataset/total_deaths.RData")
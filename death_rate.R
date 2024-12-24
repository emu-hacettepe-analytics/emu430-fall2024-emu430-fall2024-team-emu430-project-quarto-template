library(readxl)
file_path <- "C:/Users/bugra/OneDrive/Belgeler/veri_proje/veri_dataset/death_rate.xlsx"
death_rate <- read_excel(file_path)
save(death_rate, file = "C:/Users/bugra/OneDrive/Belgeler/veri_proje/veri_dataset/death_rate.RData")
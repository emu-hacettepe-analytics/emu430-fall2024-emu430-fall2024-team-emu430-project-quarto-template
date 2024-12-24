library(readxl)
file_path <- "C:/Users/bugra/OneDrive/Belgeler/veri_proje/veri_dataset/other_parameters.xlsx"
other_parameters <- read_excel(file_path)
save(other_parameters, file = "C:/Users/bugra/OneDrive/Belgeler/veri_proje/veri_dataset/other_parameters.RData")
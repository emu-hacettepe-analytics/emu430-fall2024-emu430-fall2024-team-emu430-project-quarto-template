library(readxl)
file_path <- "C:/Users/bugra/OneDrive/Belgeler/veri_proje/veri_dataset/mortality.xlsx"
mortality <- read_excel(file_path)
save(mortality, file = "C:/Users/bugra/OneDrive/Belgeler/veri_proje/veri_dataset/mortality.RData")
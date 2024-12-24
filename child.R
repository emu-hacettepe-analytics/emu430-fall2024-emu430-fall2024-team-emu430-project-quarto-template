library(readxl)
file_path <- "C:/Users/bugra/OneDrive/Belgeler/veri_proje/veri_dataset/child.xlsx"
child <- read_excel(file_path)
save(child, file = "C:/Users/bugra/OneDrive/Belgeler/veri_proje/veri_dataset/child.RData")
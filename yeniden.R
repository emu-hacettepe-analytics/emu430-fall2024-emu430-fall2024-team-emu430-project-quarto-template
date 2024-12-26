# Load required libraries
library(readxl)      # For reading Excel files
library(ggplot2)     # For creating plots
library(dplyr)       # For data manipulation
library(ggthemes)    # For The Economist theme

# Load the Excel file and preprocess the data
data <- read_excel("DATA.xlsx") |> 
  mutate(Date = as.Date(paste0("01-", Date), format = "%d-%m-%Y"))

# Calculate scaling factors for dual y-axes
scale_usd <- max(data$`PPI (%)`, na.rm = TRUE) / max(data$USD, na.rm = TRUE)
scale_import <- max(data$`PPI (%)`, na.rm = TRUE) / max(data$`Import Unit Value Index (TL)`, na.rm = TRUE)

# Graph 1: PPI (%) vs Exchange Rate (USD)
graph_usd <- data |> 
  ggplot(aes(x = Date)) +
  geom_line(aes(y = `PPI (%)`, color = "PPI (%)")) +
  geom_line(aes(y = USD * scale_usd, color = "Exchange Rate (USD)")) +
  scale_y_continuous(
    name = "PPI (%)",
    sec.axis = sec_axis(~ . / scale_usd, name = "Exchange Rate (USD)")
  ) +
  scale_color_manual(values = c("PPI (%)" = "blue", "Exchange Rate (USD)" = "red")) +
  labs(title = "PPI (%) vs Exchange Rate (USD) Over Time",
       x = "Date",
       y = "PPI (%)",
       color = "Variables") +
  theme_minimal() +
  theme_economist()
graph_usd

# Graph 2: PPI (%) vs Import Unit Value Index (TL)
graph_import <- data |> 
  ggplot(aes(x = Date)) +
  geom_line(aes(y = `PPI (%)`, color = "PPI (%)")) +
  geom_line(aes(y = `Import Unit Value Index (TL)` * scale_import, color = "Import Price Index (TL)")) +
  scale_y_continuous(
    name = "PPI (%)",
    sec.axis = sec_axis(~ . / scale_import, name = "Import Price Index (TL)")
  ) +
  scale_color_manual(values = c("PPI (%)" = "blue", "Import Price Index (TL)" = "orange")) +
  labs(title = "PPI (%) vs Import Price Index (TL) Over Time",
       x = "Date",
       y = "PPI (%)",
       color = "Variables") +
  theme_minimal() +
  theme_economist()
graph_import



# Load required libraries
library(dplyr)

# Calculate correlation between PPI (%) and USD
cor_ppi_usd <- data %>%
  summarize(correlation = cor(`PPI (%)`, USD, use = "complete.obs", method = "pearson"))

# Display the correlation result
cor_ppi_usd

# Access the correlation value
cor_ppi_usd$correlation

# Calculate correlation between PPI (%) and Import Unit Value Index (TL)
cor_ppi_import <- data %>%
  summarize(correlation = cor(`PPI (%)`, `Import Unit Value Index (TL)`, use = "complete.obs", method = "pearson"))

# Display the correlation result
cor_ppi_import

# Access the correlation value
cor_ppi_import$correlation

# Load required libraries
library(dplyr)
library(ggplot2)

# Calculate correlation between PPI (%) and USD
cor_ppi_usd <- data %>%
  summarize(correlation = cor(`PPI (%)`, USD, use = "complete.obs", method = "pearson"))

# Scatterplot for PPI (%) and USD
plot_ppi_usd <- ggplot(data, aes(x = USD, y = `PPI (%)`)) +
  geom_point(color = "blue", size = 3) +  # Scatter points
  geom_smooth(method = "lm", se = TRUE, color = "red") +  # Regression line
  labs(
    title = paste("Correlation Between PPI (%) and USD: r =", round(cor_ppi_usd$correlation, 2)),
    x = "Exchange Rate (USD)",
    y = "PPI (%)"
  ) +
  theme_minimal()+
  theme_economist()

# Display the scatterplot
plot_ppi_usd

# Calculate correlation between PPI (%) and Import Unit Value Index (TL)
cor_ppi_import <- data %>%
  summarize(correlation = cor(`PPI (%)`, `Import Unit Value Index (TL)`, use = "complete.obs", method = "pearson"))

# Scatterplot for PPI (%) and Import Unit Value Index (TL)
plot_ppi_import <- ggplot(data, aes(x = `Import Unit Value Index (TL)`, y = `PPI (%)`)) +
  geom_point(color = "blue", size = 3) +  # Scatter points
  geom_smooth(method = "lm", se = TRUE, color = "orange") +  # Regression line
  labs(
    title = paste("Correlation Between PPI (%) and Import Price Index: r =", round(cor_ppi_import$correlation, 2)),
    x = "Import Price Index (TL)",
    y = "PPI (%)"
  ) +
  theme_minimal()+
  theme_economist()

# Display the scatterplot
plot_ppi_import


# Load required libraries
library(readxl)
library(ggplot2)
library(dplyr)
library(tidyr)        # For data reshaping
library(GGally)       # For scatterplot matrix
library(corrplot)     # For correlation heatmap
library(ggthemes)     # For themes

# Load the Excel file and preprocess the data
data <- read_excel("DATA.xlsx") |> 
  mutate(Date = as.Date(paste0("01-", Date), format = "%d-%m-%Y"))

# Scaling factors for dual y-axes
scale_usd <- max(data$`PPI (%)`, na.rm = TRUE) / max(data$USD, na.rm = TRUE)
scale_import <- max(data$`PPI (%)`, na.rm = TRUE) / max(data$`Import Unit Value Index (TL)`, na.rm = TRUE)

# 1. Trend Analysis
trend_plot <- data |> 
  ggplot(aes(x = Date)) +
  geom_line(aes(y = `PPI (%)`, color = "PPI (%)")) +
  geom_line(aes(y = USD, color = "USD")) +
  geom_line(aes(y = `Import Unit Value Index (TL)`, color = "Import Price Index (TL)")) +
  labs(
    title = "Trend Analysis of Economic Indicators",
    x = "Date",
    y = "Value",
    color = "Variables"
  ) +
  theme_minimal()
trend_plot

# 2. Scatterplot Matrix
library(GGally)
ggpairs(data, columns = c("PPI (%)", "USD", "Import Unit Value Index (TL)"),
        title = "Scatterplot Matrix of Economic Indicators")

pairs(data[, c("PPI (%)", "USD", "Import Unit Value Index (TL)")],
      main = "Scatterplot Matrix of Economic Indicators",
      pch = 19, col = "blue")

# 3. Histogram
histogram_plot <- ggplot(data, aes(x = USD)) +
  geom_histogram(binwidth = 0.5, fill = "blue", alpha = 0.7, color = "black") +
  labs(
    title = "Distribution of Exchange Rate (USD)",
    x = "USD",
    y = "Frequency"
  ) +
  theme_minimal()
histogram_plot

# 4. Boxplot
# Boxplot for PPI (%)
boxplot_ppi <- ggplot(data, aes(y = `PPI (%)`)) +
  geom_boxplot(fill = "blue", alpha = 0.7) +
  labs(
    title = "Boxplot of PPI (%)",
    x = "",
    y = "PPI (%)"
  ) +
  theme_minimal()
boxplot_ppi

# Boxplot for USD
boxplot_usd <- ggplot(data, aes(y = USD)) +
  geom_boxplot(fill = "red", alpha = 0.7) +
  labs(
    title = "Boxplot of USD (Exchange Rate)",
    x = "",
    y = "USD"
  ) +
  theme_minimal()
boxplot_usd

# Boxplot for Import Unit Value Index (TL)
boxplot_import <- ggplot(data, aes(y = `Import Unit Value Index (TL)`)) +
  geom_boxplot(fill = "orange", alpha = 0.7) +
  labs(
    title = "Boxplot of Import Unit Value Index (TL)",
    x = "",
    y = "Import Unit Value Index (TL)"
  ) +
  theme_minimal()
boxplot_import


# -----Calculate scaling factor BOX PLOT PPI USD------
scale_usd <- max(data$`PPI (%)`, na.rm = TRUE) / max(data$USD, na.rm = TRUE)

# Create a combined boxplot
boxplot_combined <- ggplot() +
  # PPI Boxplot
  geom_boxplot(
    data = data, aes(x = "PPI (%)", y = `PPI (%)`),
    fill = "blue", alpha = 0.7
  ) +
  # USD Boxplot (scaled)
  geom_boxplot(
    data = data, aes(x = "USD (scaled)", y = USD * scale_usd),
    fill = "red", alpha = 0.7
  ) +
  # Add scales and labels
  scale_y_continuous(
    name = "PPI (%)",
    sec.axis = sec_axis(~ . / scale_usd, name = "USD")
  ) +
  labs(
    title = "Boxplot of PPI (%) and USD",
    x = "Variables",
    y = "Value"
  ) +
  theme_minimal()

# Print the combined boxplot
boxplot_combined


# -----Calculate scaling factor BOX PPI IPI-------
scale_import <- max(data$`PPI (%)`, na.rm = TRUE) / max(data$`Import Unit Value Index (TL)`, na.rm = TRUE)

# Create a combined boxplot with reordered x-axis
boxplot_corrected <- ggplot() +
  # PPI Boxplot
  geom_boxplot(
    data = data, aes(x = factor("PPI (%)"), y = `PPI (%)`),
    fill = "blue", alpha = 0.7
  ) +
  # Import Unit Value Index Boxplot (scaled)
  geom_boxplot(
    data = data, aes(x = factor("Import Unit Value Index (TL)"), y = `Import Unit Value Index (TL)` * scale_import),
    fill = "orange", alpha = 0.7
  ) +
  # Add scales and labels
  scale_y_continuous(
    name = "PPI (%)",
    sec.axis = sec_axis(~ . / scale_import, name = "Import Unit Value Index (TL)")
  ) +
  labs(
    title = "Boxplot of PPI (%) and Import Unit Value Index (TL)",
    x = "Variables",
    y = "Value"
  ) +
  theme_minimal()

# Print the corrected boxplot
boxplot_corrected




# 5. Correlation Heatmap
library(corrplot)
cor_matrix <- data |> select(`PPI (%)`, USD, `Import Unit Value Index (TL)`) |> cor(use = "complete.obs")
corrplot(cor_matrix, method = "color", addCoef.col = "black", title = "Correlation Heatmap")

# ---Korelasyon matrisi oluşturma------
# Gerekli kütüphaneler
library(ggcorrplot)

# Korelasyon matrisi oluşturma
cor_matrix <- data |> 
  select(`PPI (%)`, USD, `Import Unit Value Index (TL)`) |> 
  cor(use = "complete.obs")

# Korelogram oluşturma
ggcorrplot(
  cor_matrix,
  method = "square",       # Kare şeklinde kutucuklar
  lab = TRUE,              # Kutucukların üstünde korelasyon değerleri
  lab_col = "black",       # Sayılar siyah renkte
  colors = c("yellow", "white", "orange"), # Renk paleti (sarıdan maviye)
  title = "Correlation Heatmap",
  outline.color = "black"  # Kutucuk kenar çizgileri siyah
)



# 6. Volatility Analysis
volatility_plot <- data |> 
  mutate(USD_change = c(NA, diff(USD)), PPI_change = c(NA, diff(`PPI (%)`))) |> 
  pivot_longer(cols = c(USD_change, PPI_change), names_to = "Variable", values_to = "Change") |> 
  ggplot(aes(x = Date, y = Change, color = Variable)) +
  geom_line() +
  labs(
    title = "Volatility Analysis of USD and PPI",
    x = "Date",
    y = "Change",
    color = "Variable"
  ) +
  theme_minimal()
volatility_plot

# 7. Lag Analysis
lag_plot <- data |> 
  mutate(USD_lag1 = lag(USD, 1)) |> 
  ggplot(aes(x = USD_lag1, y = `PPI (%)`)) +
  geom_point(color = "blue", size = 3) +
  geom_smooth(method = "lm", se = TRUE, color = "red") +
  labs(
    title = "Lag Analysis: USD (Lag 1) vs PPI (%)",
    x = "USD (Lag 1)",
    y = "PPI (%)"
  ) +
  theme_minimal()
lag_plot


# Lag analysis for IPI and PPI
lag_plot_ipi <- data |> 
  mutate(IPI_lag1 = lag(`Import Unit Value Index (TL)`, 1)) |> 
  ggplot(aes(x = IPI_lag1, y = `PPI (%)`)) +
  geom_point(color = "blue", size = 3) +
  geom_smooth(method = "lm", se = TRUE, color = "orange") +
  labs(
    title = "Lag Analysis: Import Unit Value Index (Lag 1) vs PPI (%)",
    x = "Import Unit Value Index (Lag 1)",
    y = "PPI (%)"
  ) +
  theme_minimal()

# Display the plot
lag_plot_ipi



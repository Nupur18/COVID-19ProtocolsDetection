# reading the data
library(readxl)
water_potability <- read_xls("water_potability.xls") 
summary(water_potability)


# PIE CHART
library(plotrix)
slices <- table(water_potability$Potability)
labels <- c("Portable", "Not portable")
pct <- round(slices/sum(slices)*100)
labels <- paste(labels, " ", pct, "%", seq="")
pie(slices, labels, main = "Pie Chart", col = rainbow(2))

# HISTOGRAM
hist(water_potability$Hardness, main = "Histogram", col = "purple")

# KERNEL DENSITY PLOT
density_data = density (water_potability$Turbidity)
plot(density_data, main = "Kernel Density Plot")
polygon(density_data, col = "pink", border = "black")

# BOX PLOT
boxplot(water_potability$Conductivity, varwidth = TRUE)

# HEAT MAP
data = data.matrix(water_potability[,-1])
heatmap(data, Rowv = NA, Colv = NA, col = heat.colors(256), scale = "column")

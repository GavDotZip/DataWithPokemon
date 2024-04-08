# Script to Analyze my Competitive Team

library(tidyverse)
library(RColorBrewer)
library(GGally)

# Read the CSV file into a data frame
df <- read.csv("Pokemon.csv", header = TRUE, row.names = 2)
head(df)

# Insert Current Competitive Team as of April 2024
compTeam <- c("Blastoise", "Ampharos", "Gengar", "Garchomp", "Venusaur", "Torkoal")
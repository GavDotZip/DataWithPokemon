library(tidyverse)
library(RColorBrewer)
library(GGally)

# Read the CSV file into a data frame
df <- read.csv("Pokemon.csv", header = TRUE, row.names = 2)
head(df)

# Specify the names of the Pokémon to select
gen1Team <- c("Typhlosion", "Ampharos", "Heracross", "Gyarados", "Tyranitar", "Gengar")

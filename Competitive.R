# Script to Analyze my Competitive Team

library(tidyverse)
library(RColorBrewer)
library(GGally)

# Read the CSV file into a data frame
df <- read.csv("Pokemon.csv", header = TRUE, row.names = 2)
head(df)

# Insert Current Competitive Team as of April 2024
compTeam <- c("Blastoise", "Ampharos", "Gengar", "Garchomp", "Venusaur", "Torkoal")

# Subset the data based on the specified names
selected_pokemon <- df[compTeam, ]

# Check the structure of the selected_pokemon data frame
str(selected_pokemon)

# Create a bar chart for each Pokémon based on their Total stats
ggplot(selected_pokemon, aes(x = rownames(selected_pokemon), y = Total, fill = rownames(selected_pokemon))) +
  geom_bar(stat = "identity") +
  labs(title = "Total Stats of Selected Pokémon",
       x = "Pokémon Name",
       y = "Total Stats") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

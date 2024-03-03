library(tidyverse)
library(RColorBrewer)
library(GGally)

# Read the CSV file into a data frame
df <- read.csv("Pokemon.csv", header = TRUE, row.names = 2)
head(df)

# Specify the names of the Pokémon to select
gen1Team <- c("Blastoise", "Ninetales", "Gengar", "Raichu", "Fearow", "Scyther")

# Subset the data based on the specified names
selected_pokemon <- df[gen1Team, ]

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

# Specify the Pokémon name
pokemon_name <- "Blastoise"

# Subset the data for Blastoise
blastoise_data <- df[pokemon_name, ]

# Extract Blastoise's stats (excluding Total, Generation, and Legendary)
blastoise_stats <- blastoise_data[c("HP", "Attack", "Defense", "Sp..Atk", "Sp..Def", "Speed")]

# Calculate the maximum value for each stat to use for scaling
max_values <- apply(blastoise_stats, 2, max)

# Create a dataframe to represent Blastoise's stats relative to the maximum values
blastoise_relative <- data.frame(stats = c("0", "HP", "Attack", "Defense", "Sp..Atk", "Sp..Def", "Speed"),
                                 value = c(0, max_values))

# Reshape blastoise_stats to long format
blastoise_stats_long <- blastoise_stats %>%
  rownames_to_column(var = "stats") %>%
  pivot_longer(cols = -stats, names_to = "stat")

# Create a spider plot for Blastoise's data
ggplot() +
  geom_polygon(data = blastoise_relative, aes(x = stats, y = value, group = 1), fill = "skyblue", color = "blue", alpha = 0.7) +
  geom_path(data = blastoise_stats_long, aes(x = stats, y = value, group = stat), color = "blue", size = 1) +
  coord_polar() +
  theme_minimal() +
  ggtitle(paste("Spider Plot of", pokemon_name)) +
  xlab("") +
  ylab("") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


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



# Specify the Pokémon name
pokemon_name <- "Gengar"

# Subset the data for Gengar
gengar_data <- df[pokemon_name, ]

# Extract Gengar's stats (excluding Total, Generation, and Legendary)
gengar_stats <- gengar_data[c("HP", "Attack", "Defense", "Sp..Atk", "Sp..Def", "Speed")]

# Create a dataframe with Gengar's stats
gengar_stats_df <- data.frame(stats = c("HP", "Attack", "Defense", "Sp..Atk", "Sp..Def", "Speed"),
                              value = as.numeric(gengar_stats))

# Define the sizes for the bubbles (e.g., use the 'Total' stat)
bubble_size <- gengar_data$Total

# Create the bubble chart
ggplot(gengar_stats_df, aes(x = stats, y = value, size = bubble_size)) +
  geom_point(color = "purple", alpha = 0.7) +
  scale_size_continuous(range = c(3, 10)) +  # Adjust the range of bubble sizes
  theme_minimal() +
  ggtitle(paste("Bubble Chart for", pokemon_name)) +
  xlab("Stats") +
  ylab("Values")



# Specify the Pokémon name
pokemon_name <- "Ninetales"

# Subset the data for Ninetales
ninetales_data <- df[pokemon_name, ]

# Extract Ninetales's stats (excluding Total, Generation, and Legendary)
ninetales_stats <- ninetales_data[c("HP", "Attack", "Defense", "Sp..Atk", "Sp..Def", "Speed")]

# Convert the stats to a data frame
ninetales_stats_df <- data.frame(stats = names(ninetales_stats), value = as.numeric(ninetales_stats))

# Create a doughnut chart
ggplot(ninetales_stats_df, aes(x = "", y = value, fill = stats)) +
  geom_bar(stat = "identity", color = "white", width = 1) +
  coord_polar("y", start = 0) +
  theme_void() +
  theme(legend.position = "right") +
  scale_fill_brewer(palette = "Set3") +
  ggtitle(paste("Doughnut Chart for", pokemon_name))



# Specify the Pokémon name
pokemon_name <- "Raichu"

# Subset the data for Raichu
raichu_data <- df[pokemon_name, ]

# Extract Raichu's stats (excluding Total, Generation, and Legendary)
raichu_stats <- raichu_data[c("HP", "Attack", "Defense", "Sp..Atk", "Sp..Def", "Speed")]

# Convert the stats to a data frame
raichu_stats_df <- data.frame(stats = names(raichu_stats), value = as.numeric(raichu_stats))

# Create a lollipop chart
ggplot(raichu_stats_df, aes(x = stats, y = value)) +
  geom_segment(aes(xend = stats, yend = 0), color = "steelblue", size = 1) +
  geom_point(color = "steelblue", size = 3) +
  coord_flip() +
  theme_minimal() +
  ggtitle(paste("Lollipop Chart for", pokemon_name)) +
  xlab("Stats") +
  ylab("Values")

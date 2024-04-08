# Script to Analyze my Competitive Team

library(tidyverse)
library(RColorBrewer)
library(GGally)

# Read the CSV file into a data frame
df <- read.csv("Pokemon.csv", header = TRUE, row.names = 2)
head(df)
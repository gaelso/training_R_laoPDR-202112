## training_R_laoPDR-202112

## Load data
## ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Instructions
## - Download the data.zip file from Google drive
## - Unzip in the training project folder so that the path to the dataa is:
##    + data > tree.csv

library(tidyverse)

## Load tables
tree <- read_csv("data/tree.csv")
tree

## Not recommended
tree <- read_csv("data/tree.csv", show_col_types = FALSE)
tree

## !!! Exercise
## 1. Load the plot and subplot tables in R objects called 'plot' and 'subplot'
## 2. How many rows and columns does each table have?
## 3. Make a graph with tree table, x values from plot_no and y values from tree_dbh


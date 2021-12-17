## training_R_laoPDR-202112

## Modify data
## ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

library(tidyverse)


## Initial table with 50 rows and 5 columns resembling tree data ------------

set.seed(33)
tree <- tibble(
  plot_id = sort(rep(LETTERS[1:5], 10)),
  tree_id = rep(1:10, 5),
  tree_dbh = rlnorm(50,log(20),log(2)),
  tree_hmodel = exp(0.893 + 0.760 * log(tree_dbh) - 0.0340 * (log(tree_dbh))^2),
  tree_herror = exp(rnorm(n = 50, mean = 0, sd = 0.243)),
  tree_height = tree_hmodel * tree_herror
  )

tree

ggplot(data = tree, aes(x = tree_dbh, y = tree_height, fill = plot_id)) +
  geom_point(shape = 21, size = 2) +
  scale_fill_viridis_d() +
  theme_bw() +
  theme(legend.position = "top") +
  labs(x = "DBH (cm)", y = "H (m)", fill = "Plot ID")
 


## mutate() -----------------------------------------------------------------

## Create basal area column: tree_ba
tree2 <- tree %>%
  mutate(
    tree_ba = (tree_dbh/200)^2 * pi
  )

## Repeat but rounding value to 2 digits
tree2 <- tree %>%
  mutate(
    tree_ba = round((tree_dbh/200)^2 * pi, 2)
  )

## !!! Exercise
## Recreate tree2 with mutate() to add:
## - tree_ba same as before,
## - tree_agb, following Lao FREL/FRL Evergreen Forest equation: AGB = 0.3112 * DBH^2.2331
## - tree_agbchave, following Chave 2014 equation: AGB = 0.0673 * (DBH * H * WD)^0.976, assuming WD = 0.57.



## filter() -----------------------------------------------------------------

## Filter all trees with DBH > 60 and H < 30
tree3 <- tree %>% filter(tree_dbh > 60, tree_height < 30)
tree3

## Display all trees and filtered trees in the same plot
ggplot(tree, aes(x = tree_dbh, y = tree_height, fill = plot_id)) +
  geom_point(shape = 21, size = 2) +
  geom_point(data = tree3, shape = 21, fill = NA, color = "red", size = 8) +
  scale_fill_viridis_d() +
  theme_bw() +
  theme(legend.position = "top") +
  labs(x = "DBH (cm)", y = "H (m)", fill = "Plot ID")

  
## !!! Exercise
## 1. Create tree4 based on tree with filtering all trees with Height bigger than 35 m. 
## 2. make a graphs with tree, tree3 and tree4, tree3 and tree 4 should show as large red circles



## select() -----------------------------------------------------------------

tree5 <- tree %>% select(-tree_hmodel)
tree5

## !!! Exercise 
## Create tree6 from trees and select all columns except tree_hmodel and tree_herror
## plus position tree_id before plot-id in the columns order.


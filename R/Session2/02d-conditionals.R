## training_R_laoPDR-202112

## Conditionals
## ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

library(tidyverse)

## Make trees
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



## Comparison operators -----------------------------------------------------

## Bigger, bigger or equal to
1 < 2
1 < 1 
1 <= 2
1 <= 1
1 >= 1
2 > 1

## Equal, different, %in%
1 == 1
1 != 1
1 %in% c(1, 2, 3)
4 %in% c(1, 2, 3)


## NA and is.na()
vec <- c(1, 2, NA, 4, 5)
vec

is.na(vec)



## if_else() ----------------------------------------------------------------

table(tree$plot_id)

tree2 <- tree %>%
  mutate(forest_type = if_else(plot_id %in% c("A", "B", "C"), "Evergreen", "Deciduous"))

table(tree2$plot_id, tree2$forest_type)

## !!! Exercise
## Create 'mytree2' based on 'tree2' and use mutate() and if_else() to create a new column.
## The new column name is 'crew' and it contains 'crew01' for plots A and B and 'crew02'
## for plots C, D and E



## case_when() --------------------------------------------------------------

tree3 <- tree2 %>%
  mutate(
    dbh_class = case_when(
      tree_dbh < 20   ~ "0-19.9",
      tree_dbh < 40   ~ "20-39.9",
      tree_dbh < 60   ~ "40-59.9",
      tree_dbh < 80   ~ "60-79.9",
      tree_dbh < 100  ~ "80-99.9",
      tree_dbh >= 100 ~ "> 100",
      TRUE ~ NA_character_
    )
  )

table(tree3$dbh_class)


ggplot(data = tree3, aes(x = tree_dbh, y = tree_height, fill = dbh_class)) +
  geom_point(shape = 21, size = 2) +
  scale_fill_viridis_d(direction = -1) +
  theme_bw() +
  theme(legend.position = "top") +
  labs(x = "DBH (cm)", y = "H (m)", fill = "Plot ID")


## !!! Exercise 
## 1. Create 'mytree3' based on 'tree3' and use mutate() and case_when() to add
## a new column 'height_class' to assign the following classes based on tree_height
## - 0-9.9, 10-19.9, 20-29.9, 30-39.9, 40-49.9. 
## 2. Create a graph to show tree_height against tree_dbh with points of shape 21, 
## and fill based on height_class








## training_R_laoPDR-202112

## Aggregate data
## ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


## Make 'tree' and 'plot' tables
library(tidyverse)

## Make tree
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

## Make plot
plot <- tibble(
  plot_id = LETTERS[1:5],
  forest_type = if_else(plot_id %in% c("A", "B", "C"), "Evergreen", "Deciduous")
)



## summarise() --------------------------------------------------------------

overall_stats <- tree %>%
  summarise(
    count_tree = n(),
    mean_dbh = mean(tree_dbh),
    sd_dbh = sd(tree_dbh)
  )
overall_stats



## with group_by() ----------------------------------------------------------

plot_stats <- tree %>%
  group_by(plot_id) %>%
  summarise(
    count_tree = n(),
    mean_dbh = mean(tree_dbh),
    sd_dbh = sd(tree_dbh)
  )
plot_stats

## !!! Exercise
## Create 'plot_stat2' based on 'tree' with:
## 1. left_join() to merge 'plot' with 'tree'
## 2. mutate() and case_when() to add tree_agb:
##    a. 0.523081 * tree_dbh^2      in Deciduous Forest
##    b. 0.3112   * tree_dbh^2.2331 in Evergreen Forest
## 3. group_by() and summarise() to calculate number of trees, mean AGB and 
##    sd ADB at plot level


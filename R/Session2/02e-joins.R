## training_R_laoPDR-202112

## Joins
## ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

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

## Remove one plot from 'plot'
plot_sub <- plot %>% filter(plot_id != "B")

## Remove one plot from 'tree' and change plot_id to plot_ID
tree_sub <- tree %>% 
  filter(plot_id != "D") %>%
  select(plot_ID = plot_id, everything())



## left_join() --------------------------------------------------------------

## Automatically detect the common variable
tree2 <- tree %>% left_join(plot)

table(tree2$plot_id, tree2$forest_type)

## Manually enter the common variable
tree3 <- tree %>% left_join(plot, by = "plot_id")

table(tree3$plot_id, tree3$forest_type)

## If the common variable has different names
tree4 <- tree_sub %>% left_join(plot, by = c("plot_ID" = "plot_id"))

table(tree4$plot_ID, tree4$forest_type)

## >>> The best practice is tree3: ensure the common variable has the same name 
##     in both tables and manually name it. 

## !!! Exercise
## 1. Create 'mytree' based on 'tree' and filter out data from plot "E"
## 2. Create 'myplot' based on 'plot' and filter out data from plot "A"
## 3. Create 'mytree2' based on 'mytree' and join 'myplot' with left_join()
## 4. Use table() to show how many trees per plot and forest type are in 'mytree2'


## other joins --------------------------------------------------------------

## Remake tree_sub with 'plot_id'
tree_sub <- tree %>% filter(plot_id != "D")

## left_join() 
## keeps all data from 1st table and only matching records from 2nd table
tree5 <- tree_sub %>% left_join(plot_sub, by = "plot_id")

## "B"is kept with NAs, "D" empty
table(tree5$plot_id, tree5$forest_type)

tree5 %>% filter(plot_id == "B")
tree5 %>% filter(plot_id == "D")

## right_join() 
## Opposite, all data from 2nd table and only matching records from 1st
tree6 <- tree_sub %>% right_join(plot_sub, by = "plot_id")

## "B" empty, "D" kept with NAs
table(tree6$plot_id, tree6$forest_type)

tree6 %>% filter(plot_id == "B")
tree6 %>% filter(plot_id == "D")

## inner_join()
## Keeps only matching records
tree7 <- tree_sub %>% inner_join(plot_sub, by = "plot_id")

## Both plot "B" and "D" empty
table(tree7$plot_id, tree7$forest_type)

tree7 %>% filter(plot_id == "B")
tree7 %>% filter(plot_id == "D")

## full_join()
## Keeps all records
tree8 <- tree_sub %>% full_join(plot_sub, by = "plot_id")

## Both plot "B" and "D" kept with NAs
table(tree8$plot_id, tree8$forest_type)

tree8 %>% filter(plot_id == "B")
tree8 %>% filter(plot_id == "D")

## !!! Exercise
## 1. Create 'mytree3' by joining 'mytree' and 'myplot', keeping only the records 
##    that are both in 'mytree' and 'myplot'
## 2. Create 'mytree4' by joining 'mytree' and 'myplot', keeping all the records 
##    from 'myplot' and only matching records from 'mytree'.
## 3. Use table() to show the number of trees per plot and forest type in 'mytree3' and 'mytree4'.




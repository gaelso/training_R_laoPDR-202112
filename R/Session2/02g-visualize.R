## training_R_laoPDR-202112

## Visualize data
## ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


## Make 'tree' and 'plot' tables
library(tidyverse)
library(ggpubr)


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

## Basic plot 
gr1 <- ggplot(data = tree, aes(x = tree_dbh, y = tree_height, fill = plot_id)) +
  geom_point(shape = 21, size = 2)
gr1



## ggplot theme() -----------------------------------------------------------

## Change all text
gr1 + theme(text = element_text(size = 40))
gr1 + theme(text = element_text(colour = "red"))


## Change axis text
gr1 + theme(axis.title = element_text(size = 40))
gr1 + theme(axis.text = element_text(size = 40, color = "red"))


## Change background
gr1 + theme(panel.background = element_rect(fill = "black"))
gr1 + theme(legend.background = element_rect(fill = "black"))
gr1 + theme(legend.key = element_rect(fill = "black"))
gr1 + theme(plot.background = element_rect(fill = "black"))

## Change grid lines
gr1 + theme(axis.line = element_line(color = "red"))
gr1 + theme(panel.border = element_rect(color = "red", fill = NA))
gr1 + theme(panel.grid = element_line(color = "red"))
gr1

## Legend position
gr1 + theme(legend.position = "top")
gr1 + theme(legend.position = "left")
gr1 + theme(legend.position = "bottom")
gr1 + theme(legend.position = "none")

## Combine all to black with white text
gr1 + theme(
  text = element_text(colour = "white"),
  axis.text = element_text(color = "white"),
  panel.background = element_rect(fill = "black"),
  plot.background = element_rect(fill = "black"),
  legend.background = element_rect(fill = "black"),
  legend.key = element_rect(fill = "black"),
  panel.border = element_rect(color = "white", fill = NA)
)

## !!! Exercise 
## Apply a custom theme to gr1 by changing the color of the text and 
## of all background elements

## ggplot custom themes -----------------------------------------------------

## ggplot default
gr1 + theme_bw()
gr1 + theme_dark()
gr1 + theme_light()
gr1 + theme_classic()
gr1 + theme_minimal()
gr1 + theme_void()

## ggpubr themes
gr1 + ggpubr::theme_classic2()
gr1 + ggpubr::theme_cleveland()
gr1 + ggpubr::theme_pubclean()
gr1 + ggpubr::theme_pubr()
gr1 + ggpubr::theme_transparent()


## Modify elements inside plots ---------------------------------------------

## --- Discrete color variable --- 

## scale_*_brewer list of all palette in help(scale_fill_brewer)
gr1 + scale_fill_brewer(palette = "Dark2")
gr1 + scale_fill_brewer(palette = "PRGn")


gr2 <- ggplot(data = tree, aes(x = tree_dbh, y = tree_height, color = plot_id)) +
  geom_point(size = 2)
gr2

gr2 + scale_color_brewer(palette = "Dark2")

## scale_*_viridis
gr1 + scale_fill_viridis_d()
gr2 + scale_color_viridis_d()


## --- Continuous color variable ---
gr3 <- ggplot(data = tree, aes(x = tree_dbh, y = tree_height, color = tree_herror)) +
  geom_point(size = 2)
gr3

gr3 + scale_color_viridis_c()
gr3 + scale_color_viridis_c(direction = -1)


## --- Shape of points, see ?pch ---
ggplot(data = tree, aes(x = tree_dbh, y = tree_height, color = plot_id)) +
  geom_point(shape = 1, size = 2)

ggplot(data = tree, aes(x = tree_dbh, y = tree_height, color = plot_id)) +
  geom_point(shape = 2, size = 2)

ggplot(data = tree, aes(x = tree_dbh, y = tree_height, color = plot_id)) +
  geom_point(shape = 3, size = 2)

ggplot(data = tree, aes(x = tree_dbh, y = tree_height, color = plot_id)) +
  geom_point(shape = 4, size = 2)



## --- size of points ---
ggplot(data = tree, aes(x = tree_dbh, y = tree_height, color = plot_id)) +
  geom_point(shape = 1, size = 0.5)

ggplot(data = tree, aes(x = tree_dbh, y = tree_height, color = plot_id)) +
  geom_point(shape = 1, size = 10)


## --- Linetype ---
ggplot(data = tree, aes(x = tree_dbh, y = tree_height, color = plot_id)) +
  geom_line()

ggplot(data = tree, aes(x = tree_dbh, y = tree_height, color = plot_id)) +
  geom_line(linetype = "dashed", size = 1)

ggplot(data = tree, aes(x = tree_dbh, y = tree_height, color = plot_id)) +
  geom_line(linetype = "dotted", size = 1)

## --- Labels ---
gr1 +
  labs(x = "AAA", y = "BBB", fill = "CCC", title = "DDD", subtitle = "EEE", caption = "FFF")



## --- limits ---
gr1 + xlim(0, 40)
gr1 + ylim(0, 20)

## >>> filtering the data is better than using limits. 


## Combine line and points
gr2 + geom_line()

## Combine data sets
tree_sub <- tree %>% filter(plot_id == "A")

gr2 + geom_line(data = tree_sub)

gr2 + 
  geom_line(linetype = "dotted", size = 1) + 
  geom_line(data = tree_sub, color = "black", size = 1)


## --- Combine all features ---
gr2 + 
  geom_line(linetype = "dotted", size = 1) + 
  geom_line(data = tree_sub, color = "black", size = 1) +
  theme_bw() + 
  theme(
    legend.position = "bottom",
    plot.background = element_rect(fill = "lightgreen"),
    legend.background = element_rect(fill = "lightgreen"),
    plot.title =  element_text(color = "red"),
    panel.border = element_rect(color = "red", fill = NA)
  ) +
  labs(x = "AAA", y = "BBB", color = "CCC", title = "DDD", subtitle = "EEE", caption = "FFF")



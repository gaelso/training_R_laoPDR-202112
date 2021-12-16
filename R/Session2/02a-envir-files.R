## training_R_laoPDR-202112

## Folder, files, R projects and environment
## ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

library(tidyverse)



## Create objects -----------------------------------------------------------

## Create objects 
a <- 1

b <- "hello"

c <- 1:20

tab <- tibble(num = 1:5, char = letters[1:5])



## List and remove objects --------------------------------------------------

## List
ls()

my_list <- ls()

my_list[1]


## Remove an object from the environment
rm(a)

ls()


## Write and read tables ----------------------------------------------------

## Create a directory
dir.create("results")

## Save the table in the computer
write.csv(tab, "results/tab1.csv")
write.csv(tab, "results/tab2.csv", row.names = FALSE)

## !!! Note the "_" replacing "."
write_csv(tab, "results/tab3.csv")


## Load back the table
tab1 <- read.csv("results/tab1.csv")

tab2 <- read.csv("results/tab2.csv")

tab3 <- read_csv("results/tab3.csv")

tab2b <- read_csv("results/tab2.csv")

## Check how they appear when called
tab1
tab2
tab2b
tab3


## !!! EXERCISES ------------------------------------------------------------
## 1. Create create 2 tibbles "tib1"and "tib2" with 10 rows and 3 columns, 
##     with names and content of your choice (number, character, etc.)
## 2. Create a folder "test" in the project directory
## 3. Save both tables as "tib1.csv" and "tib2.csv" with the function "write_csv()"
## 4. Remove these 2 objects for the R environment.


## Save graphs --------------------------------------------------------------
gr <- tab %>%
  ggplot(aes(x = char, y = num, fill = char)) +
  geom_col(color = "black") +
  scale_fill_viridis_d() +
  theme_bw() +
  theme(legend.position = "none")
gr  
dir.create("results", showWarnings = FALSE)
ggsave(plot = gr, 
       filename = "results/gr.png", 
       width = 15, 
       height = 10, 
       units = "cm", 
       dpi = 300)


## !!! Exercise
## 1. Create a table with 30 rows and 4 columns, mixing numeric and character columns
## 2. Make a graph of your choice with viridis colors and labels
## 3. save your graph i the result subfolder

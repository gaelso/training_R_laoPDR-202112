## Second training on Lao PDR National Forest Inventory data analysis with R

## Folder, files and objects in R

library(tidyverse)


## List and remove objects --------------------------------------------------

## Create objects 
a <- 1

b <- "hello"

c <- 1:20

tab <- tibble(num = 1:5, char = letters[1:5])

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
## 3. Save both tqables as "tib1.csv" and "tib2.csv" with the function "write_csv()"
## 4. Remove the objects for the R environment.



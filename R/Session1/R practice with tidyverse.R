## training_R_laoPDR-202112

## Practice with tidyverse
## ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

library(tidyverse)



## Tibble vs data.frames ----------------------------------------------------

## Create a data frame
tt <- data.frame(a = 1:25, b = letters[1:25])
tt

## Create a tibble
tt2 <- tibble(a = 1:25, b = letters[1:25])
tt2

## Convert a data.frame to tibble
tt3 <- as_tible(tt)
tt3

## Create a table from vectors (all have 25 rows)
vec_num  <- sample(1:100, size = 25, replace = T)
vec_num2 <- 1:25
vec_txt <- paste0(letters[1:25], letters[1:25], letters[1:25])
vec_txt2 <- rep(LETTERS[1:5], 5)

tt4 <- tibble(vec_num, vec_num2, vec_txt, vec_txt2)
tt4

tt5 <- tibble(num1 = vec_num, num2 = vec_num2, txt1 = vec_txt, txt2 = vec_txt2)
tt5


## !!! Exercise:
## Create 3 tibbles with at least 20 row and 3 columns



## dplyr first functions ----------------------------------------------------

## Filter
sub1 <- filter(.data = tt5, num2 <= 5)
sub1

## Select
sub2 <- select(.data = tt5, txt1)
sub2

sub3 <- select(.data = sub1, txt1)

## Using the pipe operator %>%
sub4 <- tt5 %>%
  filter(num2 <= 5) %>%
  select(txt1)
sub4

## Test that sub3 and sub4 are the same table
sub4 == sub3

## !!! Exercise
## Create a tibble with 5 columns and 50 rows, at least 1 columns is numbers from 1 to 50
## Create a subset tibble that contains the first 10 rows and 3 columns of your choice.



## ggplot2 basics -----------------------------------------------------------

## Data and aesthetics in ggplot()
ggplot(tt5, aes(x = num2, y = num1, color = txt2)) +
  geom_point()

## Data outside 
tt5 %>%
  ggplot(aes(x = num2, y = num1, color = txt2)) +
  geom_line()

## Combined geometries
tt5 %>%
  ggplot(aes(x = num2, y = num1, color = txt2)) +
  geom_point() +
  geom_line()
  
## Add filter
tt5 %>%
  filter(num2 <= 10) %>%
  ggplot(aes(x = num2, y = num1, color = txt2)) +
  geom_point() + 
  geom_line()

## Add scale and theme  
tt5 %>%
  filter(num2 <= 10) %>%
  ggplot(aes(x = num2, y = num1, color = txt2)) +
  geom_point() + 
  geom_line() +
  scale_color_viridis_d() +
  theme_bw()

## Add labels  
tt5 %>%
  filter(num2 <= 10) %>%
  ggplot(aes(x = num2, y = num1, color = txt2)) +
  geom_point() + 
  geom_line() +
  scale_color_viridis_d() +
  theme_bw() +
  labs(x = "Number 1", y = " Number 2", color = "Text categories")


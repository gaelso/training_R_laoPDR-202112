## training_R_laoPDR-202112

## Modify data - part1
## ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


## Create a simple table with numbers ---------------------------------------

tab <- tibble(a = 1:5, b = 11:15)
tab



## mutate() -----------------------------------------------------------------

tab2 <- tab %>% mutate(c = a + b)
tab2

tab2 <- tab %>% 
  mutate(
    c = a + b,
    d = letters[1:5]
  )
tab2

## Use paste0() to add characters
tab3 <- tab2 %>%
  mutate(
    e = paste0(d, "-me"),
    f = paste0(c, "-", d)
  )
tab3


## !!! Exercise
## Create 'mytab' based on tab3 and use mutate() to add:
## - g = c + 5
## - h = paste0("a-", d)



## filter() -----------------------------------------------------------------

tab4 <- tab3 %>% filter(a < 5)
tab4


tab5 <- tab3 %>% filter(a < 5, d !=  "a")
tab5

## !!! Exercise
## Create 'mytab2' based on 'mytab' and use filter() to keep only:
## - f different from "c-me"
## - c less or equal to 16



## select() -----------------------------------------------------------------

## select columns
tab6 <- tab5 %>% select(a, b)
tab6

## Remove columns
tab7 <- tab5 %>% select(-b)
tab7


## Select and rename 
tab8 <- tab5 %>% select(aa = a, b)
tab8

## Rearrange columns
tab9 <- tab5 %>% select(d, c, everything())
tab9

## Extract one column as vector
tab10 <- tab5 %>% pull(a)
tab10

## !!! Exercise
## Create 'mytab3' based on 'mytab2' and
## - select the column a, b, c, d
## - rename them as aa, bb, cc, dd
## - rearrange them as dd, aa, bb, cc


## Combine functions with pipes ---------------------------------------------

tab11 <- tibble(a = 1:5, b = 11:15) %>%
  mutate(
    c = a + b,
    d = letters[1:5],
    e = paste0(d, "-me"),
    f = paste0(c, "-", d)
  ) %>%
  filter(a < 5, d !=  "a") %>%
  select(d, c, everything())
tab11

## Compare tab11 and tab9
tab9
tab11
tab9 == tab11


## !!! Exercise
## Create 'mytab4' based on 'tab3' and 
## - Use mutate() to add:
##   - g = c + 5
##   - h = paste0("a-", d)
## - Use filter() to keep only:
##   - f different from "c-me"
##   - c less or equal to 16
## - Use select() to select the column a, b, c, d, rename them as aa, bb, cc, dd
##   and rearrange them as dd, aa, bb, cc
## Check if 'mytab4' is identical to 'mytab3'








## Old examples 
tab <- tibble(a = 1:3, b = 11:13)
tab

tab2 <- tab %>% mutate(c = a + b)
tab2



## filter() -----------------------------------------------------------------
tab <- tibble(a = 1:3, b = 11:13)
tab

tab2 <- tab %>% filter(a < 3)
tab2

tab <- tibble(a = 1:3, b = 11:13)
tab

tab2 <- tab %>% select(a)
tab2

tab <- tibble(a = 1:3, b = 11:13)
tab

tab2 <- tab %>% select(-b)
tab2


tab <- tibble(a = 1:3, b = 11:13)
tab

tab2 <- tab %>% select(aa = a)
tab2

tab <- tibble(a = 1:3, b = 11:13, c = a + b, d = c - 5)
tab

tab2 <- tab %>% select(d, everything())
tab2

tab <- tibble(a = 1:3, b = 11:13)
tab

tab2 <- tab %>% select(a)
tab2

tab <- tibble(a = 1:3, b = 11:13)
tab

tab2 <- tab %>% pull(a)
tab2

tab <- tibble(a = 1:3, b = 11:13)
tab

tab2 <- tab %>%
  mutate(
    c = a + b, 
    d = c - 5
  ) %>%
  filter(a < 3) %>%
  select(aa = a, d, b)
tab2

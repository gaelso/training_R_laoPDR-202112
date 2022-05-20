
## Getting data from cloud if missing in the repo (requires google drive access permission)

library(googledrive)
library(tidyverse)

drive_download(file = as_id("https://drive.google.com/drive/folders/1jIr-_w9ll0evvHP0mVCCxh4SQe3GJyXq"),)

gg_path <- drive_get("github-repos-data/training_R_laoPDR-202112/data")

drive_ls(gg_path, recursive = T)

gg_csv <- drive_ls(gg_path, recursive = T, type = "csv")

gg_img <- drive_ls(gg_path, recursive = T, type = c("jpeg","png"))

dir.create(gg_path$name, showWarnings = F)
gg_csv %>% 
  split(.$id) %>% 
  walk(~drive_download(.$id, path = file.path("data", .$name), overwrite = TRUE))

dir.create("data/images", showWarnings = FALSE)
gg_img %>% 
  split(.$id) %>% 
  walk(~drive_download(.$id, path = file.path("data/images", .$name), overwrite = TRUE))




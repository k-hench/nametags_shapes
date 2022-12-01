library(tidyverse)
library(randomNames)
set.seed(42)

# tibble(full_name = randomNames(n = 8,ethnicity = sample(1:6, size = 8, replace = TRUE)),
#        institute = sample(c("University A", "University B", "Institute with a long Name"),
#                           size = 8, replace = TRUE)) |> 
#   separate(full_name, into = c("family_name", "first_name" ), sep = ", ") |> 
#   write_tsv("participants.tsv")


data <-  read_tsv("participants.tsv") |> 
  mutate(group = (row_number()-1) %%4 + 1,
         shape = c("ellipse", "blotch", "star", "seal")[group],
         name_label = str_c(first_name, "\\linebreak{}",family_name),
         # name_label = str_c(first_name, " ",family_name),
         x_shift = c(0,0,0,1)[group]) |> 
  dplyr::select(name_label,institute, shape, x_shift)

data |> write_delim("names_formatted.csv", col_names = FALSE, delim = ";")

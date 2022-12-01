setwd("~/work/software/latex/readarray/")
library(tidyverse)

data <- readxl::read_xlsx("~/work/hoffman_lab/arcgaz_SPP/2022_09_SPP_workshop/orga/name_tags/3._Teilnehmerliste_Meeting_September_202_08_29.xlsx",skip = 1)

data |> 
  filter(!is.na(Name)) |> 
  mutate(full_name = str_c(Vorname, "\\linebreak{}", Name)) |> 
  arrange(Name) |> 
  dplyr::select(full_name, `Uni / Institut`, `Research Area`) |>
  filter(!grepl("^\\?", full_name)) |>
  write_delim(file = "data_names.txt", delim = ";", col_names = FALSE)
  
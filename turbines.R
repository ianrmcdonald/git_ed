
#https://juliasilge.com/blog/wind-turbine/
library(tidyverse)
library(tidymodels)

turbines <- read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-10-27/wind-turbine.csv")


turbines_df <- turbines %>%
     transmute(
          turbine_capacity = turbine_rated_capacity_k_w,
          rotor_diameter_m,
          hub_height_m,
          commissioning_date = parse_number(commissioning_date),
          province_territory = fct_lump_n(province_territory, 10),
          model = fct_lump_n(model, 10)
     ) %>%
     filter(!is.na(turbine_capacity)) %>%
     mutate_if(is.character, factor)
     
#a
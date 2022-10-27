# make sure that dates are formatted correctly
df <- 
  df %>% 
  mutate(date = as.character(date))

# aggregate by region
df_agg <- 
  df %>%
  group_by(regionName) %>%
  summarise(total_first_dose_vaccinated = sum(cumPeopleVaccinatedFirstDoseByVaccinationDate))


# add disclosure controls (automatically remove areas with counts < 10)

pre_dc <- nrow(df_agg) # count rows before and after DC
df_agg <- 
  df_agg %>%
  filter(total_first_dose_vaccinated >= 10)
post_dc <- nrow(df_agg)
cat("Rows removed by disclosure control:", post_dc - pre_dc)

df_agg

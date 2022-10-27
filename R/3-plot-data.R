#install.packages("ggplot2")

library(ggplot2)
library(govstyle)

# BAD PLOT
bad_plot <- 
  df_agg %>%
  ggplot() +
  geom_col(aes(x = reorder(regionName, 
                           total_first_dose_vaccinated,
                           decreasing = TRUE), 
               y = total_first_dose_vaccinated
               )
           ) +
  theme(text = element_text(size = 8))
bad_plot
#ggsave("outputs/bad_plot.png", 
#       plot=bad_plot) # save as image to keep record of outputs and make easier to put into ppt

# BAD PLOT with text 
bad_plot_text <- 
  df_agg %>%
  ggplot() +
  geom_col(aes(x = reorder(regionName, 
                           total_first_dose_vaccinated,
                           decreasing = TRUE), 
               y = total_first_dose_vaccinated)
  ) +
  geom_text(aes(x = reorder(regionName, 
                            total_first_dose_vaccinated,
                            decreasing = TRUE), 
                y = total_first_dose_vaccinated,
                label = comma(total_first_dose_vaccinated)
                
                ),
            size = 2.75,
            nudge_y = 200000
            ) +
  theme(text = element_text(size = 8))
bad_plot_text
#ggsave("outputs/bad_plot_text.png", 
#       plot=bad_plot_text) # save as image to keep record of outputs and make easier to put into ppt
  
# GOOD PLOT: BAD PLOT with formatting
good_plot <- 
  df_agg %>%
  ggplot() +
  geom_col(aes(x = reorder(regionName, 
                           total_first_dose_vaccinated,
                           decreasing = TRUE), 
               y = total_first_dose_vaccinated),
           fill = "#007c91"
  ) +
  geom_text(aes(x = reorder(regionName, 
                            total_first_dose_vaccinated,
                            decreasing = TRUE), 
                y = total_first_dose_vaccinated,
                label = comma(total_first_dose_vaccinated)
                ),
            size = 2.75,
            nudge_y = 200000
            )  +
  theme_void() +
  theme(axis.text.x = element_text(angle = 45),
        plot.title = element_text(hjust = 0.5),
        text = element_text(size = 8)) + 
  ggtitle("Counts of First Dose Vaccinated")
good_plot
#ggsave("outputs/good_plot.png", 
#       plot=good_plot) # save as image to keep record of outputs and make easier to put into ppt


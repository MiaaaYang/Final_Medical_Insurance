here::i_am(
  "code/01_make_output.R"
)

#load the data
absolute_path_data_final <- here::here("raw_data", "insurance.csv")
final_data <- read.csv(absolute_path_data_final, header = TRUE)

#Table 1
library(gtsummary)
library(dplyr)
library(gt)


final_data_c <- final_data %>%
  mutate(charge_group = ifelse(charges > median(charges), "High", "Low"))

table_one_1 <- final_data_c %>%
  select(age, sex, bmi, children, region, smoker, charge_group) %>%
  tbl_summary(
    by = charge_group,
    statistic = list(
      all_continuous() ~ "{median} ({p25}, {p75})",
      all_categorical() ~ "{n} ({p}%)"
    ),
    missing = "no"
  ) %>%
  add_overall() %>%
  add_p() %>%
  modify_spanning_header(all_stat_cols() ~ "**By Insurance Charges (High vs Low)**") %>%
  bold_labels()

table_one_1

gtsave(
  as_gt(table_one_1),
  filename = here::here("output/table_one.png")
)
saveRDS(
  table_one_1,
  file = here::here("output/table_one.rds")
)
# table 2

library(ggplot2)
library(dplyr)
library(gridExtra)


charges_by_region <- final_data %>%
  group_by(region) %>%
  summarise(
    mean_charges = mean(charges, na.rm = TRUE),
    median_charges = median(charges, na.rm = TRUE),
    sd_charges = sd(charges, na.rm = TRUE),
    min_charges = min(charges, na.rm = TRUE),
    max_charges = max(charges, na.rm = TRUE),
    n = n()
  ) %>%
  arrange(desc(mean_charges))


charges_by_region <- charges_by_region %>%
  mutate(across(where(is.numeric), round, 2))


table_plot <- tableGrob(
  charges_by_region,
  rows = NULL,
  theme = ttheme_default(
    core = list(fg_params = list(cex = 0.8)),
    colhead = list(fg_params = list(cex = 0.9, fontface = "bold", col = "white"),
                   bg_params = list(fill = "#4B9CD3", col = NA))
  )
)





table_final <- gridExtra::grid.arrange(title, table_plot, nrow = 2, heights = c(0.2, 1))



ggsave(
  filename = here::here("output", "charges_by_region.png"),
  plot = table_final,
  width = 8,
  height = 4,
  dpi = 300
)

# visualization 1
library(ggplot2)

boxplot_reg <- ggplot(final_data, aes(x = region, y = charges)) +
  geom_boxplot(fill = "lightblue", alpha = 0.7) +
  labs(
    title = "Distribution of Insurance Charges by Region",
    x = "Region",
    y = "Insurance Charges (USD)"
  ) +
  scale_y_continuous(labels = scales::dollar_format())

ggsave(
  filename = here::here("output", "boxplot_reg.png"),
  plot = boxplot_reg,
  width = 8,      # width in inches
  height = 6,     # height in inches
  dpi = 300,      # image resolution
  device = "png"
)

boxplot_reg


#visuliazation 2:
scatter <- ggplot(final_data, aes(x = bmi, y = charges, color = smoker)) +
  geom_point(alpha = 0.6) +
  geom_smooth(method = "lm", se = FALSE) +
  labs(
    title = "BMI and Insurance Charges by Smoking Status",
    x = "Body Mass Index (BMI)",
    y = "Insurance Charges ($)",
    color = "Smoker"
  ) +
  theme_minimal()

ggsave(
  filename = here::here("output", "scatter.png"),
  plot = scatter,
  width = 8,      # width in inches
  height = 6,     # height in inches
  dpi = 300,      # image resolution
  device = "png"
)

scatter


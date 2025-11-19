# Final Project: Modeling Medical Insurance Charges Using Demographic and Lifestyle Factors


**Author:** Mia Yang  
**Date:** November 3, 2025  

---

## Overview
This project analyzes the **Health Insurance Costs** dataset to examine how demographic and lifestyle characteristics influence medical expenses.  
Variables such as **age, sex, body mass index (BMI), smoking status, number of children, and geographic region** are used to understand their relationship with individual insurance charges.  

The final report presents **one table** and **two figures** summarizing key insights into the drivers of health insurance costs.


---

## Contents of the Report

### Tables
- **Table 1:** Summary of participant characteristics by insurance charge group (High vs Low)

### Figures
- **Figure 1:** Distribution of Insurance Charges by Region (Boxplot)
- **Figures 2** Relationship between BMI and Insurance Charges by Smoking Status (Scatter plot with trend lines)

---

## Synchronize your package repository

- Clone the repository
- Install all required R packages with: `make install` in Git bash -If you add or update packages, run: `renv::snapshot()`

## How to Generate the Final Report

- After synchronize the packages, now run `make output/tables` in Git bash to get the tables and graphs.
- Run `make output/reports` to get the pdf/html final report

## Which pieces of code create the tables and figures?

1. `code/01_make_output.R`

Creates Table 1: Uses gtsummary and gt to summarize participant characteristics across High vs Low charge groups.

Creates Figure 1: Boxplot showing the distribution of charges by region.

Creates Figure 2: Scatter plot showing the relationship between BMI and insurance charges by smoking status.


2. `code/Data550_Final_Project.Rmd`

Creates the Final pdf/HTML report

3. `output` 

Includes all the tables and figures that saved to png/.rds and the final report.
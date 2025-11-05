# Final Project: Modeling Medical Insurance Charges Using Demographic and Lifestyle Factors


**Author:** Mia Yang  
**Date:** November 3, 2025  

---

## Overview
This project analyzes the **Health Insurance Costs** dataset to examine how demographic and lifestyle characteristics influence medical expenses.  
Variables such as **age, sex, body mass index (BMI), smoking status, number of children, and geographic region** are used to understand their relationship with individual insurance charges.  

The final report presents **two table** and **two figures** summarizing key insights into the drivers of health insurance costs.


---

## Contents of the Report

### Tables
- **Table 1:** Summary of participant characteristics by insurance charge group (High vs Low)
- **Table 2**  Summary of average insurance charges by region

### Figures
- **Figure 1:** Distribution of Insurance Charges by Region (Boxplot)
- **Figures 2** Relationship between BMI and Insurance Charges by Smoking Status (Scatter plot with trend lines)

---

## How to Generate the Final Report

To reproduce the final report, first clone this repository and open it in R or RStudio. 
Make sure your working directory is set to the project’s code/ folder.

Then run `make` in **Git Bash** to build the full HTML/pdf report from the Makefile.

## Which pieces of code create the tables and figures?

1. `code/01_make_output.R`

Creates Table 1: Uses gtsummary and gt to summarize participant characteristics across High vs Low charge groups.

Creates Table 2: Uses dplyr and gridExtra to compute summary statistics of insurance charges by region.

Creates Figure 1: Boxplot showing the distribution of charges by region.

Creates Figure 2: Scatter plot showing the relationship between BMI and insurance charges by smoking status.


2. `code/Data550_Final_Project.Rmd`

Creates the Final HTML report

3. `output` 

Includes all the tables and figures that saved to png/.rds 

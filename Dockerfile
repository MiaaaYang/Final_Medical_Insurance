###############################################################################
# STAGE 1 — Install packages with renv 
###############################################################################
FROM rocker/tidyverse:4.5.1 AS base

# Create project directory
RUN mkdir -p /home/rstudio/project
WORKDIR /home/rstudio/project

# Copy renv files
RUN mkdir -p renv
COPY renv.lock renv.lock
COPY .Rprofile .Rprofile
COPY renv/activate.R renv/activate.R
COPY renv/settings.json renv/settings.json

# Local renv cache inside project
RUN mkdir -p renv/.cache
ENV RENV_PATHS_CACHE=renv/.cache

# Install renv and restore packages
RUN R -e "install.packages('renv'); renv::restore(prompt = FALSE)"

###### DO NOT EDIT STAGE 1 ABOVE ######

###############################################################################
# STAGE 2 — Copy project + build tools
###############################################################################
FROM rocker/tidyverse:4.5.1 AS intermediate

RUN mkdir -p /home/rstudio/project
WORKDIR /home/rstudio/project

# Copy renv-populated project from stage 1
COPY --from=base /home/rstudio/project .

# Copy remaining project files
COPY makefile makefile
COPY Data550_Final_Project.Rmd Data550_Final_Project.Rmd

# Ensure needed directories exist
RUN mkdir -p code output raw_data report

# Copy raw data
COPY raw_data/insurance.csv raw_data/insurance.csv

# Copy all code files
COPY code/ code/

# Install tinytex so HTML/PDF builds do not fail
RUN R -e "install.packages('tinytex'); tinytex::install_tinytex()"
ENV PATH="${PATH}:/root/bin"

# Default command:
# Run your Makefile AND move final HTML into /home/rstudio/project/report/
CMD make && mv Data550_Final_Project.html report/




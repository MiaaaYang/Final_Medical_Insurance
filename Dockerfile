###############################################################################
# STAGE 1 — Install packages with renv 
###############################################################################
FROM rocker/tidyverse:4.5.1 AS base


RUN mkdir -p /home/rstudio/project
WORKDIR /home/rstudio/project


RUN mkdir -p renv
COPY renv.lock renv.lock
COPY .Rprofile .Rprofile
COPY renv/activate.R renv/activate.R
COPY renv/settings.json renv/settings.json


RUN mkdir -p renv/.cache
ENV RENV_PATHS_CACHE=renv/.cache


RUN R -e "install.packages('renv'); renv::restore(prompt = FALSE)"



###############################################################################
# STAGE 2 — Copy project + build tools
###############################################################################
FROM rocker/tidyverse:4.5.1 AS intermediate

RUN mkdir -p /home/rstudio/project
WORKDIR /home/rstudio/project


COPY --from=base /home/rstudio/project .


COPY makefile makefile
COPY Data550_Final_Project.Rmd Data550_Final_Project.Rmd


RUN mkdir -p code output raw_data report


COPY raw_data/insurance.csv raw_data/insurance.csv


COPY code/ code/


RUN R -e "install.packages('tinytex'); tinytex::install_tinytex()"
ENV PATH="${PATH}:/root/bin"


CMD make && mv Data550_Final_Project.html report/




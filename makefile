# ============================
# Final Project Makefile
# Mia Yang
# ============================

# --------------------------------------
# Output files created by 01_make_output.R
# --------------------------------------
OUTPUT_FILES := \
    output/table_one.png \
    output/table_one.rds \
    output/boxplot_reg.png \
    output/boxplot_reg.rds \
    output/scatter.png \
    output/scatter.rds

# --------------------------------------
# Default rule: build the HTML report
# --------------------------------------
all: Data550_Final_Project.html

# --------------------------------------
# Install R environment (renv)
# --------------------------------------
.PHONY: install
install:
	Rscript -e "renv::restore()"

# --------------------------------------
# Generate all plot/table outputs
# --------------------------------------
$(OUTPUT_FILES): code/01_make_output.R raw_data/insurance.csv
	Rscript code/01_make_output.R

# --------------------------------------
# Render HTML report AFTER outputs exist
# --------------------------------------
Data550_Final_Project.html: Data550_Final_Project.Rmd $(OUTPUT_FILES)
	Rscript -e "rmarkdown::render('Data550_Final_Project.Rmd', output_format = 'html_document')"
	
# --------------------------------------
# Docker rule 
# --------------------------------------

.PHONY: docker_report
docker_report:
	mkdir -p report
	docker run --rm \
		-v "$(PWD)/report:/home/rstudio/project/report" \
		miayang28/data550final:latest

# --------------------------------------
# Clean output folder
# --------------------------------------
.PHONY: clean
clean:
	rm -f output/*.png
	rm -f output/*.rds
	rm -f *.html



# --- 1. Generate all output files (tables + figures) ---
output_files:
	Rscript code/01_make_output.R

# --- 2. Create HTML report ---
output/Data550_Final_Project.html: code/Data550_Final_Project.Rmd code/02_render_report.R output_files
	Rscript -e "rmarkdown::render('code/Data550_Final_Project.Rmd', output_format = 'html_document', output_file = '../output/Data550_Final_Project.html')"

# --- 3. Create PDF report ---
output/Data550_Final_Project.pdf: code/Data550_Final_Project.Rmd code/02_render_report.R output_files
	Rscript -e "rmarkdown::render('code/Data550_Final_Project.Rmd', output_format = 'pdf_document', output_file = '../output/Data550_Final_Project.pdf')"

# --- 4. Default rule: build both HTML + PDF reports ---
all: output/Data550_Final_Project.html output/Data550_Final_Project.pdf

# --- 5. Clean up generated files ---
.PHONY: clean
clean:
	rm -f output/*.png output/*.html output/*.pdf output/*.rds
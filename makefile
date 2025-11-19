
install:
	Rscript -e "renv::restore()"


output/tables: code/01_make_output.R
	Rscript code/01_make_output.R



output/reports: code/02_render_report.R output/tables
	Rscript code/02_render_report.R


.PHONY: clean
clean:
	rm -f output/*.html output/*.pdf output/*.png output/*.rds output/tables output/reports

here::i_am(
  "code/02_render_report.R"
)

library(here)
library(rmarkdown)

# HTML version
rmarkdown::render(
  input         = here("code", "Data550_Final_Project.Rmd"),
  output_format = "html_document",
  output_file   = here("output", "Data550_Final_Project.html"),
  envir         = new.env()
)

# PDF version
rmarkdown::render(
  input         = here("code", "Data550_Final_Project.Rmd"),
  output_format = "pdf_document",
  output_file   = here("output", "Data550_Final_Project.pdf"),
  envir         = new.env()
)
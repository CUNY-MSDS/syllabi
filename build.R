library(knitr)
library(rmarkdown)

semester <- 'Spring'
year <- 2021

courses <- list.files(pattern = 'DATA*')
for(i in courses) {
	rmd <- paste0(i, '/', i, '.Rmd')
	rmarkdown::render(
		input = rmd,
		output_format = 'html_document',
		output_file = paste0(i, '-', year, '-', semester),
		output_dir = i,
		params = list(semester = semester,
					  year = year))

	rmarkdown::render(
		input = rmd,
		output_format = 'pdf_document',
		output_file = paste0(i, '-', year, '-', semester),
		output_dir = i,
		params = list(semester = semester,
					  year = year))

}

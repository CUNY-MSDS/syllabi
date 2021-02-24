library(knitr)
library(rmarkdown)

build_syllabi <- function(courses, semester, year,
						  out_dir = paste0('docs/', year, semester, '/')) {
	dir.create(out_dir, recursive = TRUE, showWarnings = FALSE)
	for(i in courses) {
		cat(paste0('Building ', i, '...\n'))
		rmd <- paste0(i, '/', i, '.Rmd')
		rmarkdown::render(
			input = rmd,
			output_format = 'html_document',
			output_file = paste0(i, '-', year, '-', semester),
			output_dir = out_dir,
			params = list(semester = semester,
						  year = year),
			quiet = quiet)

		rmarkdown::render(
			input = rmd,
			output_format = 'html_fragment',
			output_file = paste0(i, '-', year, '-', semester, '_partial', '.html'),
			output_dir = out_dir,
			params = list(semester = semester,
						  year = year),
			quiet = quiet)

		rmarkdown::render(
			input = rmd,
			output_format = 'pdf_document',
			output_file = paste0(i, '-', year, '-', semester),
			output_dir = out_dir,
			params = list(semester = semester,
						  year = year),
			quiet = quiet)
	}
}

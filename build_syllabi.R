library(knitr)
library(rmarkdown)

#' Build syllabi
#'
#' @param courses a vector of courses to build. This should correspond to
#'        \code{FOLDER/FOLDER.Rmd}.
#' @param semester the semester, either Spring or Fall.
#' @param year the year.
#' @param out_dir the directory build the syllabi to.
#' @param the formats to build.
#' @param quiet whether to build quietly, see \code{\link{rmarkdown::render}}.
build_syllabi <- function(courses, semester, year,
						  out_dir = paste0('docs/', year, semester, '/'),
						  formats = c('html_document', 'html_fragment', 'pdf_document'),
						  quiet = TRUE) {
	dir.create(out_dir, recursive = TRUE, showWarnings = FALSE)
	for(i in courses) {
		cat(paste0('Building ', i, '...\n'))
		rmd <- paste0(i, '/', i, '.Rmd')
		if('html_document' %in% formats) {
			rmarkdown::render(
				input = rmd,
				output_format = 'html_document',
				output_file = paste0(i, '-', year, '-', semester),
				output_dir = out_dir,
				params = list(semester = semester,
							  year = year),
				quiet = quiet)
		}

		if('html_fragment' %in% formats) {
			rmarkdown::render(
				input = rmd,
				output_format = 'html_fragment',
				output_file = paste0(i, '-', year, '-', semester, '_partial', '.html'),
				output_dir = out_dir,
				params = list(semester = semester,
							  year = year),
				quiet = quiet)
		}

		if('pdf_document' %in% formats) {
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
}

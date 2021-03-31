library(kableExtra)
library(tidyverse)
library(readxl)
library(xtable)

#' Build the schedule (as a table) in either HTML or PDF.
#'
build_schedule <- function(infile, year, semester,
						   cols = c('Dates', 'Topic')) {
	tab <- NULL

	# TODO: Print a warning if there are overlapping modules
	if(tolower(tools::file_ext(infile)) == 'csv') {
		course_schedule <- read.csv(infile)
	} else {
		course_schedule <- readxl::read_excel(infile)
	}

	if(!all(c('Week', 'Duration', 'Topic') %in% names(course_schedule))) {
		stop(paste0(infile, ' must contain the following columns: Week, Duration, and Topic'))
	}

	schedule <- readxl::read_excel(paste0('../Schedules/', year, '-', semester, '.xlsx'))
	course_schedule$End_Week <- course_schedule$Week + (course_schedule$Duration - 1)
	course_schedule <- merge(course_schedule, schedule[,c('Week', 'Start')],
							 by = 'Week', all.x = TRUE)
	course_schedule <- merge(course_schedule, schedule[,c('Week', 'End')],
							 by.x = 'End_Week', by.y = 'Week', all.x = TRUE)
	# course_schedule$Dates <- paste0(format(course_schedule$Start, '%b %d, %Y'), ' to ',
	# 								format(course_schedule$End, '%b %d, %Y'))
	course_schedule <- course_schedule %>%
		mutate(Start = format(Start, '%b-%d'),
			   End = format(End, '%b-%d')) %>%
		replace_na(list(Start = '', End = '')) %>%
		mutate(Dates = ifelse(Start != '', paste0(Start, ' to ', End), ''))
	# course_schedule$Dates <- paste0(format(course_schedule$Start, '%b-%d'), ' to ',
	# 								format(course_schedule$End, '%b-%d'))

	if(knitr::is_html_output()) {
		# return('HTML')
		# tab <- knitr::kable(course_schedule[,c('Topic', 'Dates')],
		# 					row.names = FALSE)
		tab <- course_schedule %>%
			select(all_of(cols)) %>%
			kbl %>%
			kable_styling(bootstrap_options = c("striped", "hover"))
	} else if(knitr::is_latex_output()) {
		# return('PDF')
		tab <- knitr::kable(course_schedule[,cols],
							row.names = FALSE,
							format = 'latex') %>%
			kableExtra::column_spec(1, width = "1.1in") %>%
			kableExtra::column_spec(2:length(cols),
									width = paste0(5 / (length(cols)-1), "in"))
		# tab <- course_schedule %>%
		# 	select(Topic, Dates) %>%
		# 	xtable() %>%
		# 	print(print.results = FALSE,
		# 		  include.rownames = FALSE)
	} else {
		stop('Unknown format')
	}

	return(tab)
}

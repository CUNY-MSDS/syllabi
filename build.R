source('build_syllabi.R')

core_courses <- c('DATA606', 'DATA607', 'DATA608', 'DATA602', 'DATA605', 'DATA621', 'DATA698')

# Spring 2021
# 622, 624, 609, 620
build_syllabi(c(core_courses),
			  semester = 'Spring', year = 2021)

# Fall 2021
build_syllabi(c(core_courses),
			  semester = 'Fall', year = 2021)


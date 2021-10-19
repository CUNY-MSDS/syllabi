source('build_syllabi.R')

core_courses <- c('DATA602-01', 'DATA602-02', 
				  'DATA605', 'DATA606', 'DATA607', 'DATA608', 'DATA621', 
				  'DATA698-01')

# Spring 2021
# 622, 624, 609, 620
build_syllabi(c(core_courses, 'DATA622', 'DATA624'),
			  semester = 'Spring', year = 2021)

# Summer 2021
build_syllabi(c('DATA624', 'DATA612', 'DATA620', 'DATA604'),
			  semester = 'Summer', year = 2021)

# Fall 2021
build_syllabi(c(core_courses, 'DATA609', 'DATA620', 'DATA622', 'DATA624'),
			  semester = 'Fall', year = 2021)

# build_syllabi('DATA698-01', semester = 'Fall', year = 2021)

# Spring 2022
build_syllabi(c(core_courses, 'DATA609', 'DATA620', 'DATA622', 'DATA624'),
			  semester = 'Spring', year = 2022)

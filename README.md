Syllabi for courses in the CUNY SPS Master’s of Data Science program
================

[CUNY SPS MSDS
Website](https://sps.cuny.edu/academics/graduate/master-science-data-science-ms)

## Syllabi by Semester

### Spring 2021

-   [DATA 606 Statistics & Probability for Data
    Analytics](docs/2021Spring/DATA606-2021-Spring.pdf)
-   [DATA 607 Data Acquisition and
    Management](docs/2021Spring/DATA607-2021-Spring.pdf)

## Notes for Instructors

## Notes for Adminstrators

The `Schedules` folder should contain an Excel file for each semester.
The file should use the following naming convention:
`YYYY-SEMESTER.xlsx`. This fill will be used by the `build_schedule`
function in the `build_schedule.R` R script. The Excel file should have
one sheet with the following three columns:

-   `Week` - The week number (i.e. 1 through 15). Note that some
    semesters will only have 14 weeks. Any syllabi that specify a 15th
    week will not have a date associate with that week but the content
    will still be included in the syllabus. Going forward, courses
    whould be designed to fit within a 14-week schedule.
-   `Start` - The first day of the week (typically Monday except for the
    first week of the semester). Be sure to use a date format for the
    column in Excel.
-   `End` - The last day of the week (typically Sunday execpt for the
    last week of the semester). Be sure to use a date format for the
    column in Excel.

The `build_syllabi.R` R script contains one function `build_sullabi`
which has three parameters:

-   `courses` - This is a character vector of all the courses that
    should be built for a given semester (i.e. courses that are being
    offered).
-   `semester` - The semester to build, should either be `Spring` or
    `Fall`.
-   `year` - The year of the semester.

``` r
source('build_syllabi.R')
build_syllabi(courses = c('DATA606', 'DATA607'),
              semester = 'Spring', year = 2021)
```

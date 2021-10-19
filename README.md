Syllabi for courses in the CUNY SPS Master’s of Data Science program
================

[CUNY SPS MSDS
Website](https://sps.cuny.edu/academics/graduate/master-science-data-science-ms)
\* [Spring
2021](https://sps.cuny.edu/academics/academic-calendar/2020-2021-calendar/spring-2021)
\* [Fall
2021](https://sps.cuny.edu/academics/academic-calendar/2021-2022-calendar/fall-2021)

## Syllabi by Semester

### Fall 2021

-   [DATA 602 Advanced Programming
    Techniques](docs/2021Fall/DATA602-2021-Fall.pdf)
-   [DATA 605 COURSE TITLE](docs/2021Fall/DATA605-2021-Fall.pdf)
-   [DATA 606 Statistics & Probability for Data
    Analytics](docs/2021Fall/DATA606-2021-Fall.pdf)
-   [DATA 607 Data Acquisition and
    Management](docs/2021Fall/DATA607-2021-Fall.pdf)
-   [DATA XXX COURSE TITLE](docs/2021Fall/DATA608-2021-Fall.pdf)
-   [DATA 609 COURSE TITLE](docs/2021Fall/DATA609-2021-Fall.pdf)
-   [DATA XXX COURSE TITLE](docs/2021Fall/DATA620-2021-Fall.pdf)
-   [DATA 621 Business Analytics and Data
    Mining](docs/2021Fall/DATA621-2021-Fall.pdf)
-   [DATA XXX COURSE TITLE](docs/2021Fall/DATA622-2021-Fall.pdf)
-   [DATA 624 Predictive Analytics](docs/2021Fall/DATA624-2021-Fall.pdf)
-   [DATA XXX COURSE TITLE](docs/2021Fall/DATA698-2021-Fall.pdf)

### Spring 2021

-   [DATA 606 Statistics & Probability for Data
    Analytics](docs/2021Spring/DATA606-2021-Spring.pdf)
-   [DATA 607 Data Acquisition and
    Management](docs/2021Spring/DATA607-2021-Spring.pdf)
-   [DATA 621 Business Analytics and Data
    Mining](docs/2021Spring/DATA621-2021-Spring.pdf)
-   [DATA 624 Predictive
    Analytics](docs/2021Spring/DATA624-2021-Spring.pdf)

## Notes for Instructors

Each course, located in a folder `DATAXXX` where `XXX` is the course
number, should have at minimum two files:

-   `DATAXXX.Rmd` - the main document for the syllabus. I recommend
    starting with the provided [Template.Rmd](Template.Rmd) file.
-   `DATAXXX.xlsx` - an Excel file with at least three columns:
    -   `Week` - the week number (1 through 14)
    -   `Duration` - the number of weeks that unit extends. For example,
        if each unit is two weeks, then `Week`s should be set to 1, 3,
        5, etc. and `Duration` would be 2.
    -   `Topic` - a description of that unit.
    -   You can include additional columns (e.g. readings) as
        appropriate. See the *Including the Schedule* details below on
        how to include those columns in the syllabus.

[R Markdown](https://rmarkdown.rstudio.com) is a special version of
[Markdown](https://daringfireball.net/projects/markdown/) that allows
the combination of R code and text.

##### Common Sections

There are a number of files in the `includes` directory for parts of the
syllabus that are common for all syllabi.

-   `academic_integrity.md`
-   `accessibility.md`
-   `grade_distribution.md`
-   `online_etiquette.md`
-   `support_services.md`

These can be included into your syllabus using the following syntax
(replacing the filename with one of the files listed above):

```` markdown
```{r, child='../includes/accessibility.md'}
```
````

##### Including the Schedule

The R chunk below will build the schedule table for the Excel file
specified. This function merges the course schedule, specified with
weeks, to the master schedule which has date ranges for the given
semester. This function will also build an appropriate for the output
format (i.e. HTML or PDF).

```` markdown
```{r}
source('../build_schedule.R')
build_schedule('DATAXXX.xlsx', year = params$year, semester = params$semester)
```
````

##### Building Your Syllabus

The easiest way to build your syllabus to check for formatting issues is
to use the `build_syllabi` function. The following commands will build
the syllabus for the Spring 2021 semester (you may build for any
semester that has a schedule in the `Schedules` folder).

``` r
source('build_syllabi.R')
build_syllabi('DATAXXX', semester = 'Spring', year = 2021)
```

By default, the syllabus will be built into the `docs/2021Spring/`
folder, however you can override this by specifying the `out_dir`
parameter. This function will be build four versions of the sylabus:

-   A plain markdown version (`.md`).
-   An HTML version (`.html`).
-   A partial HTML version (`_partial.html`) which does not include
    header of footer information that is appropriate to embed in another
    website.
-   A PDF version (`.pdf`)

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

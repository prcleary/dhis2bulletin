---
title: "`dhis2bulletin`"
author: "Paul Cleary"
output: 
  html_document:
    keep_md: true
---



<!-- # TODO plot by ISO week in ggplot2... ? ordered factor -->
<!-- # TODO Fix missing time periods and formatting -->
<!-- # ? use highcharter -->

Draft R code for extracting data from DHIS 2 and populating a bulletin template.

## Getting Started

Make sure that your computer is connected to the Internet and that you have previously followed the **Prerequisites** and **Installing** steps below to install everything required.

Create a new folder where you want the surveillance bulletin and associated outputs to be created. Then create a new project with this folder using the RStudio menu: File -> New Project -> Existing Directory -> Browse to the new folder just created.[^openproject]

[^openproject]: Next time you run the bulletin, open the project folder and double-click the .Rproj file to start RStudio.

You can then create the weekly surveillance bulletin charts with the following four lines of code in RStudio:

```
library(govstyle)
library(dhis2bulletin)
create_charts()
```

You will be asked for your DHIS 2 user name and password. Two folders will be created in the project folder: `figs` (contains the charts generated) and `data` (contains the raw data files for reference).

Then open a new Markdown template using the menu: File -> New File -> R Markdown. In the dialogue box that opens select "From Template" then "federal" then click "OK". Save this file in the project folder you created earlier (File -> Save As).

Then click "Knit" at the top of the Markdown template. When running this the first time you will be asked where to save the resulting draft bulletin. The draft bulletin will then open as a Word document for your modifications.

## Prerequisites

You first need to install [R](https://cran.r-project.org/bin/windows/base/release.htm) and [RStudio](https://rstudio.com/products/rstudio/download/#download).

Then run RStudio. To prepare for installation of the `dhis2bulletin` package you need to run the following three lines of code:

```
update.packages(ask = FALSE)
install.packages(c('data.table', 'httr', 'ggplot2', 'knitr', 'rmarkdown', 'stringr', 'ISOweek', 'devtools', 'askpass'), dependencies = TRUE)
devtools::install_github('ukgovdatascience/govstyle')
```

## Installing

To install the package from GitHub use the R command:

```
devtools::install_github('prcleary/dhis2bulletin')
```

To update to the latest versions of packages in future you can use the following three lines of code:

```
update.packages(ask = FALSE)
devtools::install_github('ukgovdatascience/govstyle')
devtools::install_github('prcleary/dhis2bulletin')
```

## Authors

Paul Cleary: [email me])(mailto:paul.cleary@phe.gov.uk?Subject=dhis2bulletin) with any queries.

## License

This project is licensed under the MIT License.

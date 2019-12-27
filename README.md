---
title: "`dhis2bulletin"
author: "Paul Cleary"
output: 
  html_document:
    keep_md: true
---



<!-- # TODO plot by ISO week in ggplot2... ? ordered factor -->
<!-- # TODO Fix missing time periods and formatting -->
<!-- # ? use highcharter -->

## `dhis2bulletin

Simple functions for extracting data from a DHIS 2 instance and populating a bulletin template.

## Getting Started

The following assumes you are using RStudio.

Load the required libraries using:

```
library(govstyle)
library(dhis2bulletin)
```

In DHIS 2, create the Pivot Table you would like to download and save it as a Favourite. 

In the Pivot Tables app, click on Download > Plain data source > JSON > Name and press Enter.

A page containing JSON will open. Copy the URL from the address bar to another document and edit "....json?dimension..." part to "....csv?dimension...". 

Then run the following commands to get the data and create the charts:

```
create_charts()
```

You will need to enter your DHIS 2 user name and password.

Then compile the bulletin:

```
compile_bulletin()
```
## Prerequisites

You can make sure you have all the R packages needed and load them with:

```
install.packages(c('data.table', 'httr', 'ggplot2', 'knitr', 'rmarkdown', 'stringr', 'ISOweek'), dependencies = TRUE)
devtools::install_github('ukgovdatascience/govstyle')
...
```

## Installing

To install the package from GitHub use the R command:

```
...
```

## Authors

Paul Cleary

## License

This project is licensed under the MIT License.

## Acknowledgments

...

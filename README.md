<!-- # TODO plot by ISO week in ggplot2... ? ordered factor -->
<!-- # TODO Fix missing time periods and formatting -->
<!-- # ? use highcharter -->
Draft R code for extracting data from DHIS 2 and populating a bulletin template.

Getting Started
---------------

Make sure that your computer is connected to the Internet and that you have previously followed the **Prerequisites** and **Installing** steps below to install everything required.

Create a new folder where you want the surveillance bulletin and associated outputs to be created. Then create a new project with this folder using the RStudio menu: File -&gt; New Project -&gt; Existing Directory -&gt; Browse to the new folder just created.

You can then create the weekly surveillance bulletin charts with the following four lines of code in RStudio:

    library(govstyle)
    library(dhis2bulletin)
    create_charts()

You will be asked for your DHIS 2 user name and password. Two folders will be created in the project folder: `figs` (contains the charts generated) and `data` (contains the raw data files for reference).

Then open a new Markdown template using the menu: File -&gt; New File -&gt; R Markdown. In the dialogue box that opens select "From Template" then "federal" then click "OK". Save this file in the project folder you created earlier (File -&gt; Save As).

Then click "Knit" at the top of the Markdown template. When running this the first time you will be asked where to save the resulting draft bulletin. The draft bulletin will then open as a Word document which can then be updated. Optionally you can amend the template file if you know Markdown.

Routine use
-----------

Once the above steps have been done once, then to re-run the bulletin requires only the following steps.

Open the project folder and double-click the `.Rproj` file to open RStudio. Run the following four lines of code:

    library(govstyle)
    library(dhis2bulletin)
    create_charts()

Open the template file created previously and click "Knit" at the top. The updated bulletin Word document will open.

Prerequisites
-------------

You first need to install [R](https://cran.r-project.org/bin/windows/base/release.htm) and [RStudio](https://rstudio.com/products/rstudio/download/#download).

Then run RStudio. To prepare for installation of the `dhis2bulletin` package you need to run the following three lines of code:

    update.packages(ask = FALSE)
    install.packages(c('data.table', 'httr', 'ggplot2', 'knitr', 'rmarkdown', 'stringr', 'ISOweek', 'devtools', 'askpass'), dependencies = TRUE)
    devtools::install_github('ukgovdatascience/govstyle')

Installing
----------

To install the package from GitHub use the commands:

    update.packages(ask = FALSE)
    devtools::install_github('prcleary/dhis2bulletin')

To update to the latest versions of packages in future you can use the following three lines of code:

    update.packages(ask = FALSE)
    devtools::install_github('ukgovdatascience/govstyle')
    devtools::install_github('prcleary/dhis2bulletin')

Authors
-------

Paul Cleary: [email me](mailto:paul.cleary@phe.gov.uk?subject=dhis2bulletin%20query) with any queries.

License
-------

This project is licensed under the MIT License.

Draft R code for extracting data from DHIS 2 and populating a bulletin template.

Getting Started
---------------

Make sure that your computer is connected to the Internet and that you have previously followed the **Prerequisites** and **Installing** steps below to install everything required.

Create a new folder in a location of your choice. Then open RStudio and create a new RStudio Project in this folder using the RStudio menu: File -&gt; New Project -&gt; Existing Directory -&gt; Browse to the new folder just created.

You can then create the weekly surveillance bulletin Markdown document with the following steps in RStudio:

    library(dhis2bulletin)
    draft_bulletin()

Make any necessary amendments to the Markdown template (`DHIS 2 federal bulletin.Rmd`) that opens.

Click "Knit with Parameters" at the top of the Markdown template. You will be asked for your DHIS 2 user name and password. These are used to extract data from DHIS 2 for the charts and tables but are not saved anywhere.

The draft bulletin will then open as a Word document (DHIS 2 federal bulletin.docx by default). Make any necessary amendments to the text *and footer* of the Word document. Note that there is a Style called "Table" which will need to be applied manually to each table. Save the Word file with a file name of your choice.

Note that two folders will have been created in the project folder: `figs` (containing the charts generated) and `data` (containing the raw data files for reference).

Routine use
-----------

Once the above steps have been done once, then to re-run the bulletin requires only the following steps.

Open the project folder and double-click the `.Rproj` file to open RStudio.

Open the Markdown template and make any necessary amendments.

Click "Knit with Parameters" and enter your DHIS 2 user name and password.

Make the necessary amendments to the Word document that opens.

Prerequisites
-------------

You first need to install [R](https://cran.r-project.org/bin/windows/base/release.htm) and [RStudio](https://rstudio.com/products/rstudio/download/#download).

Then run RStudio. To prepare for installation of the `dhis2bulletin` package you need to run the following lines of code:

    update.packages(ask = FALSE)
    install.packages('devtools', dep = TRUE)
    devtools::install_github('ukgovdatascience/govstyle')

Installing the `dhis2bulletin` package
--------------------------------------

To install the package from GitHub use the command:

    devtools::install_github('prcleary/dhis2bulletin')

To update to the latest versions of packages in future you can use the following lines of code:

    update.packages(ask = FALSE)
    devtools::install_github('ukgovdatascience/govstyle')
    devtools::install_github('prcleary/dhis2bulletin')

One final step: as the script obtains data by using your user name and password, this code will not work if you are using 2-Factor Authentication to log into DHIS 2. You should temporarily disable this in your Settings before running this code.

Authors
-------

Paul Cleary: [email me](mailto:paul.cleary@phe.gov.uk?subject=dhis2bulletin%20query) with any queries.

License
-------

This project is licensed under the MIT License.

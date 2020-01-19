.onLoad <- function(libname, pkgname) {
  # see https://cran.r-project.org/web/packages/data.table/vignettes/datatable-importing.html
  requireNamespace('data.table')
  .datatable.aware = TRUE
  requireNamespace('govstyle')
  options(editor = 'rstudio')
  options(knitr.kable.NA = '')
}

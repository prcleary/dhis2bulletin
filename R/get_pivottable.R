#' Get Data from DHIS 2 Pivot Table (And Optionally Save It)
#'
#' @param url URL for DHIS 2 pivot table
#' @param params Parameters for username and password entered at knitting
#' @param basepath Name of data file to be saved
#'
#' @return A data.table
#' @import data.table httr
#' @export
#'
get_pivottable <- function(url, params, basepath = NULL) {
  response <- GET(url, authenticate(params$username, params$password))
  output <- fread(content(response, 'text'))
  if (!is.null(basepath))
    basepath <- file.path(dirname(basepath), paste0(Sys.Date(), basename(basepath)))
  fwrite(output, file = basepath)
  output
}

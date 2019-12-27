# functions.R

.datatable.aware = TRUE  # see https://cran.r-project.org/web/packages/data.table/vignettes/datatable-importing.html

#' Enter DHIS 2 Login Details
#'
#' @return NULL
#' @export
#'
#' @examples
#' # Not run
#' # get_logindetails()
#' # Then use "get_pivottable" function
#' # Use username=admin password=district if using demo DHIS 2
get_logindetails <- function() {
  username <-
    rstudioapi::askForPassword('Please enter your DHIS 2 user name')
  password <-
    rstudioapi::askForPassword('Please enter your DHIS 2 password')
  assign('logindetails',
         list(username = username, password = password),
         '.GlobalEnv')
  return(NULL)
}

#' Get Data from DHIS 2 Pivot Table (And Optionally Save It)
#'
#' @param url URL for DHIS 2 pivot table
#' @param filename Name of data file to be saved
#'
#' @return A data.table
#' @export
#'
#' @examples
#' # Not run
#' # get_logindetails()
#' # Use username=admin password=district if using demo DHIS 2
#' # get_pivottable('https://play.dhis2.org/2.33.1/api/29/analytics.csv?dimension=pe:THIS_YEAR&dimension=lv8UXn17ZOm:weRMUzBs8T7&dimension=jp826jAJHUc:KUSvwZQsMSN;UmyRWILcoed;xNrDrDbJgnm;U0uJG4kydwE;kE8lP5t0b5R;yhg8oYU9ekY;oGktdmYkRNo;VCoSeRRVS1n;lLKpwhjd1dM;LzDaTmQYWcj;HDdnX6XqxIn;jWgEsdH87Jk;JZ3usxLEcc9;LqG1FnAUhyb;ZPtRFVLY40u;zmWJAEjfv59;Euvh58hLl61;RSFc8ADyKTw;SriP0jBXMr6;mcjC3qZgIkO;qk2KOBMX4Mf;HKU7L73im5r;TzwKbcw1nUK;lnLbEej0gwe;UAEhIWpoQFN;IUZ0GidX0jh;LgtuBcNaMB3;yHtsPZqpAxm;dUK38PhdUdV;HAraPb0v7ex;M2cth8EmrlT;GBHN1a1Jddh;KmwPVkjp7yl;oDkJh5Ddh7d&displayProperty=NAME&outputIdScheme=NAME')
get_pivottable <- function(url, filename = NULL) {
  if (!exists('logindetails'))
    stop('Use get_logindetails function before using this function')
  response <- httr::GET(url, httr::authenticate(logindetails$username, logindetails$password))
  output <- data.table::fread(httr::content(response, 'text'))
  if (!is.null(filename))
    data.table::fwrite(output, file = filename)
  output
}

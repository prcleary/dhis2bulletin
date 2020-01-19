#' Create Draft DHIS 2 Federal Bulletin
#'
#' @param title File name of draft bulletin (default: "DHIS 2 federal bulletin")
#' @param template Template to use (default: "federal")
#' @param package Package that template is included in (default: "dhis2bulletin")
#'
#' @return NULL
#' @export
#'
draft_bulletin <- function(title = 'DHIS 2 federal bulletin', template = 'federal', package = 'dhis2bulletin') {
  rmarkdown::draft(title, template = template, package = package)
  message('Draft bulletin created in ', getwd())
  invisible()
}

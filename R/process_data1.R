#' Extract and Process Data from DHIS 2
#'
#' @param url placeholder
#' @param params Parameters for username and password entered at knitting
#' @param basepath placeholder
#' @param data_elements placeholder
#' @param wrap_length placeholder
#'
#' @return
#' @import data.table ISOweek stringr
#' @export
#'
process_data1 <-
  function(url,
           params,
           basepath = NULL,
           data_elements = NULL,
           wrap_length = 10) {
    # Query DHIS 2 API
    dat <-
      get_pivottable(url, params = params, basepath = basepath)
    # Check data has > 1 row
    if (nrow(dat) %in% 0) stop('No data obtained')
    # Check data in expected format
    expected_names <-
      c('Data', 'Period', 'Organisation unit', 'Value')
    if (length(setdiff(names(dat), expected_names) > 1))
      stop(
        'Expected variable names ',
        paste0(expected_names, collapse = ', '),
        ' but got variable names ',
        paste0(names(dat), collapse = ', ')
      )
    # Convert DHIS 2 ISO weeks to dates of corresponding Sundays (end of weekly period)
    # Define the bits of the pattern wanted (in brackets)
    isoweek_pattern <- '^W([0-9]{1,2}) ([0-9]{4})'
    # Get those bits
    dat[, c('isowk', 'isoyr') := data.frame(str_match(Period, isoweek_pattern))[, 2:3]]
    # Then add "-7" for Sunday
    dat[, isoyrwk := paste(isoyr, '-W', str_pad(isowk, 2, pad = '0'), '-7', sep = '')]
    # Then convert to date
    dat[, weekdate := ISOweek2date(isoyrwk)]
    # Remove OUs with no data
    ous_with_data <-
      dat[, .(N = sum(Value)), `Organisation unit`][N > 0, `Organisation unit`]
    dat <- dat[`Organisation unit` %in% ous_with_data]
    # Remove data elements with no data
    data_with_data <-
      dat[, .(N = sum(Value)), Data][N > 0, Data]
    dat <- dat[Data %in% data_with_data]
    # Filter to data elements specified
    if (!is.null(data_elements)) dat <- dat[Data %in% data_elements]
    dat[]
  }

# TODO roxygen2
process_data1 <-
  function(url,
           logindetails,
           basepath = NULL,
           data_elements = NULL,
           wrap_length = 10) {
    # Query DHIS 2 API
    dat <-
      get_pivottable(url, logindetails = logindetails, basepath = basepath)
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
    dat[, c('isowk', 'isoyr') := data.frame(stringr::str_match(Period, isoweek_pattern))[, 2:3]]
    # Then add "-7" for Sunday
    dat[, isoyrwk := paste(isoyr, '-W', stringr::str_pad(isowk, 2, pad = '0'), '-7', sep = '')]
    # Then convert to date
    dat[, weekdate := ISOweek::ISOweek2date(isoyrwk)]
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
url <-
  'https://dhis2.nih.org.pk/api/29/analytics.csv?dimension=pe:LAST_4_WEEKS&dimension=ou:aNFYpBa4WHm;nycwQzwWMkn;XNcCColNA3b;azXbd1uyOAe;OUFhfLUy6G0;PHALbI20Q2O;Tp3C39D6usb;lZa2TfjWIsg;zKcf7GD7NQB;KZRaPaMTb9s&dimension=dx:FL15gcN6YoB;ce7JjhufQPQ;sYmVwOJUs6O;S53icWaOGG5;ii4RFfN5s7Z;fQnNTPgzfQz;DUrKtO4mCAj;ucDvEck5jrr;FrLe8mTAhfu;RPyh0Sfsiau;mENubu3dA1e;srVRHmgOlsf;Sxjv6S6oOol;SVrDgM4Fr0u;Z8UBXMJrzvV;UJBegcM4Zx3;mpcKhKlzDa1;ft6Jux3u5dR;HABiN9Fw4Md;mIF6pa2Wx4f;XqswUKgvotn;d7tz2cz17eS;kwT80lFlH86;cdodgrLVGuo;XXLBqVgvmGf;NaLgX8cUHhC&displayProperty=NAME&outputIdScheme=NAME'
data_elements <- c(
  'Measles (new case)',
  'Influenza-Like Illness (new case)',
  'Acute Haemorrhagic Fever (new case)',
  'Acute Respiratory Infection (new case)',
  'Acute Watery Diarrhoea < 5 years (new case)',
  'Acute Watery Diarrhoea > 5 years (new case)',
  'Diphtheria (new case)',
  'Severe Acute Respiratory Infection (new case)'
)
basepath <- 'ajk.csv'
process_data1(
  url = url,
  logindetails = logindetails,
  basepath = basepath,
  data_elements = data_elements
)

# TODO roxygen: import ggplot2
create_chart1 <-
  function(plotfilename,
           plotwidth = 11,
           plotnrow = 2,
           plotheight = 5,
           plotxlabel = 'x',
           plotylabel  = 'y',
           plottitle = '',
           plotsubtitle = '',
           plottag = '',
           wraplength = 35,
           datatable = NULL,
           datafilename = NULL) {
    # Use data.table object or read in file
    if (is.null(datatable)) {
      datatable <- data.table::fread(datafilename)
    }
    # Check variable names as expected
    expected_names <-
      c(
        'Data',
        'Period',
        'Organisation unit',
        'Value',
        'isowk',
        'isoyr',
        'isoyrwk',
        'weekdate',
        'Data_wrap'
      )
    if (length(setdiff(names(datatable), expected_names) > 1))
      stop(
        'Expected variable names ',
        paste0(expected_names, collapse = ', '),
        ' but got variable names ',
        paste0(names(datatable), collapse = ', ')
      )
    # Aggregate data
    figdata <- datatable[, .(N = sum(Value)), .(Data, weekdate, isoyr, isowk)]
    # Wrap long strings for axes
    figdata[, Data_wrap := stringr::str_wrap(Data, width = wraplength)]
    # Create chart
    figplot <-
      ggplot(data = figdata, aes(
        x = weekdate,
        y = N
      )) +
      geom_bar(position = 'dodge', stat = 'identity', fill = '#006600') +
      facet_wrap(~Data_wrap, nrow = plotnrow) +
      geom_text(
        data = figdata,
        aes(label = N),
        size = 3,
        position = position_dodge(width = 0.9),
        vjust = -0.2
      ) +
      govstyle::theme_gov() +
      scale_color_viridis_d() +
      scale_x_date(breaks = figdata$weekdate, labels = paste0('W', figdata$isowk)) +
      scale_y_continuous(expand = c(0.1, 0)) +
      theme(axis.text.x = element_text(vjust = 0.5), strip.text = element_text(size = 8)) +
      labs(
        x = plotxlabel,
        y = plotylabel,
        title = plottitle,
        subtitle = plotsubtitle,
        tag = plottag
      )
    # Save chart
    ggsave(plot = figplot,
           plotfilename,
           width = plotwidth,
           height = plotheight)
    invisible(figplot)
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
data <-
  process_data1(
    url = url,
    logindetails = logindetails,
    basepath = basepath,
    data_elements = data_elements
  )
data <- ajk
plotfilename <- 'test.png'

p1 <- create_chart1(datatable = data, plotfilename = plotfilename, plotxlabel = 'Priority diseases', plotylabel = 'Notifications')
p1

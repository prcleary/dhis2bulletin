#' Create One Type Of Chart for Bulletin
#'
#' @param datatable placeholder
#' @param plotfilename placeholder
#' @param plotwidth placeholder
#' @param plotnrow placeholder
#' @param plotheight placeholder
#' @param plotxlabel placeholder
#' @param plotylabel placeholder
#' @param plottitle placeholder
#' @param plotsubtitle placeholder
#' @param plottag placeholder
#' @param wraplength placeholder
#'
#' @return
#' @import data.table ggplot2 govstyle stringr
#' @export
#'
#' @examples
#' # Not run:
#' # placeholder
create_chart1 <-
  function(datatable,
           plotfilename,
           plotwidth = 11,
           plotnrow = 2,
           plotheight = 5,
           plotxlabel = 'x',
           plotylabel  = 'y',
           plottitle = '',
           plotsubtitle = '',
           plottag = '',
           wraplength = 35) {
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
    figdata[, Data_wrap := str_wrap(Data, width = wraplength)]
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
      theme_gov() +
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

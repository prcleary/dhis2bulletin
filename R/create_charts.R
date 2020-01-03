# create_charts.R
#' (Get Data From DHIS 2 And) Create Charts
#'
#' @return NULL
#' @import ggplot2
#' @export
#'
#' @examples
#' # Not run
#' # create_charts()

create_charts <- function() {
  # Create directories for figures and data
  if (!dir.exists('figs')) dir.create('figs')
  if (!dir.exists('data')) dir.create('data')
  # Get user login details
  get_logindetails()
  # Figure 1. Distribution of IDSR Priority Diseases Reported during last 4 weeks from Reporting Districts of Pakistan
  url1 <-
    'https://dhis2.nih.org.pk/api/29/analytics.csv?dimension=ou:osCztkmFYud&dimension=pe:LAST_4_WEEKS&dimension=dx:FL15gcN6YoB;sYmVwOJUs6O;ii4RFfN5s7Z;DUrKtO4mCAj;Sxjv6S6oOol;Z8UBXMJrzvV;HABiN9Fw4Md;XXLBqVgvmGf&displayProperty=NAME&outputIdScheme=NAME'
  data1 <- process_data1(url = url1,
                         logindetails = logindetails,
                         basepath = 'data/fig1data.csv')
  create_chart1(datatable = data1, plotfilename = 'figs/fig1plot.png', plotxlabel = 'ISO week', plotylabel = 'Notifications', plotsubtitle = 'Distribution of IDSR Priority Diseases Reported during last 4 weeks from Reporting Districts of Pakistan')
  # Figure 2. Weekly Distribution of IDSR Priority Diseases Reported during Epi Week 41 - 52, December 2019, from Reporting Districts of Pakistan
  # TODO
  # Figure 3. Frequency of IDSR Priority Diseases Reported from Azad Jammu & Kashmir (Mirpur), Epi Week 42- 45, October & November, 2019
  url2 <-
    'https://dhis2.nih.org.pk/api/29/analytics.csv?dimension=pe:LAST_4_WEEKS&dimension=ou:lZa2TfjWIsg;nycwQzwWMkn;PHALbI20Q2O;aNFYpBa4WHm;Tp3C39D6usb;XNcCColNA3b;azXbd1uyOAe;OUFhfLUy6G0;KZRaPaMTb9s;zKcf7GD7NQB&dimension=dx:FL15gcN6YoB;sYmVwOJUs6O;ii4RFfN5s7Z;DUrKtO4mCAj;mENubu3dA1e;Sxjv6S6oOol;Z8UBXMJrzvV;mpcKhKlzDa1;HABiN9Fw4Md;XqswUKgvotn;kwT80lFlH86;XXLBqVgvmGf&displayProperty=SHORTNAME&outputIdScheme=NAME'
  data2 <- process_data1(url = url2,
                         logindetails = logindetails,
                         basepath = 'data/fig2data.csv')
  create_chart1(datatable = data2, plotfilename = 'figs/fig2plot.png', plotxlabel = 'ISO week', plotylabel = 'Notifications', plotsubtitle = 'Frequency of IDSR Priority Diseases Reported during last 4 weeks from Azad Jammu & Kashmir (Mirpur)')
  # Figure 4: Frequency of IDSR Priority Diseases Reported from Baluchistan (Gwadar, Kech, & Killa Abdullah), Epi Week 42- 45, October & November, 2019
  url3 <-
    'https://dhis2.nih.org.pk/api/29/analytics.csv?dimension=pe:LAST_4_WEEKS&dimension=ou:IFBIAbz3Lzq;vc5lfFdiEfD;lqIm0xpt2ac;oWK2oNPlokn;wXgDboKFlwC;F4ibhsZG8oO;N4LWclX4u9T;Oxi2cEvthTe;VsFxszeTGEz;nvZlgtE3wuI;fWd1LGPYm2u;eQolzG92f2g;oxgMciUgZAg;kxypyt24E17;K4xz6gAnu39;vK0NDai4kN5;uZbnTb1cV5x;IzGJGI78vzf;lmHLpSX3OAm;KhvDi1epJB4;QCI7DuNfEbC;YyGYxV0Vfpj;XAsjICxTN2s;CnBh25K9xFT;Qf1G64E4GlS;IIJ1OhKJfzy;j9Bgm0Ym8pH;sFowPKSR11n;JGnIubLygc9;S25VwAv3Eap;pB7EBHQVigo;PsIhDGNoVL9;kT8fivn3w22&dimension=dx:FL15gcN6YoB;sYmVwOJUs6O;ii4RFfN5s7Z;DUrKtO4mCAj;Sxjv6S6oOol;Z8UBXMJrzvV;HABiN9Fw4Md;XXLBqVgvmGf&displayProperty=SHORTNAME&outputIdScheme=NAME'
  data3 <- process_data1(url = url3,
                         logindetails = logindetails,
                         basepath = 'data/fig3data.csv')
  create_chart1(datatable = data3, plotfilename = 'figs/fig3plot.png', plotxlabel = 'ISO week', plotylabel = 'Notifications', plotsubtitle = 'Frequency of IDSR Priority Diseases Reported during last 4 weeks from Baluchistan (Gwader, Kech & Killa Abdullah)')
  # Figure 5: Frequency of IDSR Priority Diseases Reported from Khyber Pakhtunkhwa (Haripur & Lakki Marwat), during Epi Week 42- 45, October & November, 2019
  # Figure 6: Frequency of IDSR Priority Diseases Reported from Gilgit Baltistan (Hunza) during Epi Week 49-52, December, 2019
  # Figure 7: Frequency of IDSR Priority Diseases Reported from Islamabad (ICT HF) during Epi Week 30 & 43-45, October & November, 2019

  # ? charts not tables for rest

  message('Figures and data refreshed\n')
  invisible(NULL)
}

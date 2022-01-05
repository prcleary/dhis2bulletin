#' (Get Data From DHIS 2 And) Create Charts
#'
#' @param params Parameters for username and password entered at knitting
#'
#' @return NULL
#' @export
#'
#' @examples
#' # Not run
#' # create_charts()
create_charts <- function(params) {
  # Create directories for figures and data
  if (!dir.exists('figs'))
    dir.create('figs')
  if (!dir.exists('data'))
    dir.create('data')
  # Figure 1. Distribution of IDSR Priority Diseases Reported
  url1 <-
    'https://dhis2.nih.org.pk/api/29/analytics.csv?dimension=ou:osCztkmFYud&dimension=pe:LAST_4_WEEKS&dimension=dx:FL15gcN6YoB;sYmVwOJUs6O;ii4RFfN5s7Z;DUrKtO4mCAj;Sxjv6S6oOol;Z8UBXMJrzvV;HABiN9Fw4Md;XXLBqVgvmGf&displayProperty=NAME&outputIdScheme=NAME'
  data1 <- process_data1(url = url1,
                         params = params,
                         basepath = 'data/fig1data.csv')
  create_chart1(
    data1,
    plotfilename = 'figs/fig1plot.png',
    plotxlabel = 'ISO week',
    plotylabel = 'Notifications',
    plotsubtitle = 'Distribution of IDSR Priority Diseases Reported during last 4 weeks from Reporting Districts of Pakistan'
  )
  # Figure 2. Weekly Distribution of IDSR Priority Diseases Reported
  # TODO
  # Figure 3. Frequency of IDSR Priority Diseases Reported from Azad Jammu & Kashmir (Mirpur)
  url2 <-
    'https://dhis2.nih.org.pk/api/29/analytics.csv?dimension=ou:nycwQzwWMkn;PHALbI20Q2O;aNFYpBa4WHm;Tp3C39D6usb;XNcCColNA3b;azXbd1uyOAe;OUFhfLUy6G0;KZRaPaMTb9s;zKcf7GD7NQB;lZa2TfjWIsg&dimension=pe:LAST_4_WEEKS&dimension=dx:FL15gcN6YoB;sYmVwOJUs6O;ii4RFfN5s7Z;DUrKtO4mCAj;mENubu3dA1e;Sxjv6S6oOol;Z8UBXMJrzvV;mpcKhKlzDa1;HABiN9Fw4Md;XqswUKgvotn;kwT80lFlH86;XXLBqVgvmGf;FrLe8mTAhfu&displayProperty=NAME&outputIdScheme=NAME'
  data2 <- process_data1(url = url2,
                         params = params,
                         basepath = 'data/fig2data.csv')
  create_chart1(
    data2,
    plotfilename = 'figs/fig2plot.png',
    plotxlabel = 'ISO week',
    plotylabel = 'Notifications',
    plotsubtitle = 'Frequency of IDSR Priority Diseases Reported during last 4 weeks from Azad Jammu & Kashmir (Mirpur)'
  )
  # Figure 4: Frequency of IDSR Priority Diseases Reported from Baluchistan (Gwadar, Kech, & Killa Abdullah)
  url3 <-
    'https://dhis2.nih.org.pk/api/29/analytics.csv?dimension=ou:vc5lfFdiEfD;lqIm0xpt2ac;oWK2oNPlokn;wXgDboKFlwC;F4ibhsZG8oO;N4LWclX4u9T;Oxi2cEvthTe;VsFxszeTGEz;nvZlgtE3wuI;fWd1LGPYm2u;eQolzG92f2g;oxgMciUgZAg;kxypyt24E17;K4xz6gAnu39;vK0NDai4kN5;uZbnTb1cV5x;IzGJGI78vzf;lmHLpSX3OAm;KhvDi1epJB4;QCI7DuNfEbC;YyGYxV0Vfpj;XAsjICxTN2s;CnBh25K9xFT;Qf1G64E4GlS;IIJ1OhKJfzy;j9Bgm0Ym8pH;sFowPKSR11n;JGnIubLygc9;S25VwAv3Eap;pB7EBHQVigo;PsIhDGNoVL9;kT8fivn3w22;IFBIAbz3Lzq&dimension=pe:LAST_4_WEEKS&dimension=dx:FL15gcN6YoB;sYmVwOJUs6O;ii4RFfN5s7Z;DUrKtO4mCAj;Sxjv6S6oOol;Z8UBXMJrzvV;HABiN9Fw4Md;XXLBqVgvmGf&displayProperty=NAME&outputIdScheme=NAME'
  data3 <- process_data1(url = url3,
                         params = params,
                         basepath = 'data/fig3data.csv')
  create_chart1(
    data3,
    plotfilename = 'figs/fig3plot.png',
    plotxlabel = 'ISO week',
    plotylabel = 'Notifications',
    plotsubtitle = 'Frequency of IDSR Priority Diseases Reported during last 4 weeks from Baluchistan (Gwader, Kech & Killa Abdullah)'
  )
  # Figure 5: Frequency of IDSR Priority Diseases Reported from Khyber Pakhtunkhwa (Haripur & Lakki Marwat)
  url4 <-
    'https://dhis2.nih.org.pk/api/29/analytics.csv?dimension=ou:IyYYluQegCK;OYfCChzZ1wx;DyZNKffgbe4;YkkfBV9xq0Q;I3ZT4uJ9PJU;kPFD098DsEz;fJXVXLVith1;ipLDZhTwf0V;MqTfVgJxJI2;VBo8pb4nnHe;BKn3CJMJdp8;ahZbtTji8RD;wrL8atyPhqJ;qqd9zDhY7AM;AElxCTWl3yY;w47I7gLAO92;xWr4WHkad9h;a5NijYWq3So;WRKimPKcbWQ;t5ewPIhl9yf;Ed0fC1gz73m;a4sLZu7NtqZ;mPc4vrUo77B;NXdmPYnzknS;UJRHpidvr1n&dimension=pe:LAST_4_WEEKS&dimension=dx:FL15gcN6YoB;sYmVwOJUs6O;ii4RFfN5s7Z;DUrKtO4mCAj;Sxjv6S6oOol;Z8UBXMJrzvV;HABiN9Fw4Md;XXLBqVgvmGf&displayProperty=NAME&outputIdScheme=NAME'
  data4 <- process_data1(url = url4,
                         params = params,
                         basepath = 'data/fig4data.csv')
  create_chart1(
    data4,
    plotfilename = 'figs/fig4plot.png',
    plotxlabel = 'ISO week',
    plotylabel = 'Notifications',
    plotsubtitle = 'Frequency of IDSR Priority Diseases Reported during last 4 weeks from Khyber Pakhtunkhwa (Haripur & Lakki Marwat)'
  )
  # Figure 6: Frequency of IDSR Priority Diseases Reported from Gilgit Baltistan (Hunza)
  url5 <-
    'https://dhis2.nih.org.pk/api/29/analytics.csv?dimension=ou:WVplieB2oyL;R8DaPzdc7jO;MNOhDtA5uTa;f9AQKimmMlw;Ya0VghCBsXF;stJhQ308lnu;H7faykOb7dX;IoBHJ7c1LQC;ERs2kFEQBPv;UO9WSz3vDpS&dimension=pe:LAST_4_WEEKS&dimension=dx:FL15gcN6YoB;sYmVwOJUs6O;ii4RFfN5s7Z;DUrKtO4mCAj;Sxjv6S6oOol;Z8UBXMJrzvV;HABiN9Fw4Md;XXLBqVgvmGf&displayProperty=NAME&outputIdScheme=NAME'
  data5 <- process_data1(url = url5,
                         params = params,
                         basepath = 'data/fig5data.csv')
  create_chart1(
    data5,
    plotfilename = 'figs/fig5plot.png',
    plotxlabel = 'ISO week',
    plotylabel = 'Notifications',
    plotsubtitle = 'Frequency of IDSR Priority Diseases Reported during last 4 weeks from Gilgit Baltistan (Hunza)'
  )
  # Figure 7: Frequency of IDSR Priority Diseases Reported from Islamabad (ICT HF)
  url6 <-
    'https://dhis2.nih.org.pk/api/29/analytics.csv?dimension=ou:IMFzIBVExEJ;lwDRbQAndm7;mBpGcb3Ml0E;DRrCn73DZGH&dimension=pe:LAST_4_WEEKS&dimension=dx:FL15gcN6YoB;sYmVwOJUs6O;ii4RFfN5s7Z;DUrKtO4mCAj;Sxjv6S6oOol;Z8UBXMJrzvV;HABiN9Fw4Md;XXLBqVgvmGf&displayProperty=NAME&outputIdScheme=NAME'
  data6 <- process_data1(url = url6,
                         params = params,
                         basepath = 'data/fig6data.csv')
  create_chart1(
    data6,
    plotfilename = 'figs/fig6plot.png',
    plotxlabel = 'ISO week',
    plotylabel = 'Notifications',
    plotsubtitle = 'Frequency of IDSR Priority Diseases Reported during last 4 weeks from Islamabad (ICT HF)'
  )
  # ? charts not tables for rest

  message('Done: data refreshed and charts updated\n')
  invisible(NULL)
}

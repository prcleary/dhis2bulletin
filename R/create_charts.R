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
  # Create directory for figures and data
  dir.create('figs')
  dir.create('data')

  get_logindetails()
  # URLs for last 4 and 12 weeks in AJK, KP, Balochistan, ICT
  ajk_url_4weeks <-
    'https://dhis2.nih.org.pk/api/29/analytics.csv?dimension=pe:LAST_4_WEEKS&dimension=ou:aNFYpBa4WHm;nycwQzwWMkn;XNcCColNA3b;azXbd1uyOAe;OUFhfLUy6G0;PHALbI20Q2O;Tp3C39D6usb;lZa2TfjWIsg;zKcf7GD7NQB;KZRaPaMTb9s&dimension=dx:FL15gcN6YoB;ce7JjhufQPQ;sYmVwOJUs6O;S53icWaOGG5;ii4RFfN5s7Z;fQnNTPgzfQz;DUrKtO4mCAj;ucDvEck5jrr;FrLe8mTAhfu;RPyh0Sfsiau;mENubu3dA1e;srVRHmgOlsf;Sxjv6S6oOol;SVrDgM4Fr0u;Z8UBXMJrzvV;UJBegcM4Zx3;mpcKhKlzDa1;ft6Jux3u5dR;HABiN9Fw4Md;mIF6pa2Wx4f;XqswUKgvotn;d7tz2cz17eS;kwT80lFlH86;cdodgrLVGuo;XXLBqVgvmGf;NaLgX8cUHhC&displayProperty=NAME&outputIdScheme=NAME'
  ajk_url_12weeks <-
    'https://dhis2.nih.org.pk/api/29/analytics.csv?dimension=pe:LAST_12_WEEKS&dimension=ou:aNFYpBa4WHm;nycwQzwWMkn;XNcCColNA3b;azXbd1uyOAe;OUFhfLUy6G0;PHALbI20Q2O;Tp3C39D6usb;lZa2TfjWIsg;zKcf7GD7NQB;KZRaPaMTb9s&dimension=dx:FL15gcN6YoB;ce7JjhufQPQ;sYmVwOJUs6O;S53icWaOGG5;ii4RFfN5s7Z;fQnNTPgzfQz;DUrKtO4mCAj;ucDvEck5jrr;FrLe8mTAhfu;RPyh0Sfsiau;mENubu3dA1e;srVRHmgOlsf;Sxjv6S6oOol;SVrDgM4Fr0u;Z8UBXMJrzvV;UJBegcM4Zx3;mpcKhKlzDa1;ft6Jux3u5dR;HABiN9Fw4Md;mIF6pa2Wx4f;XqswUKgvotn;d7tz2cz17eS;kwT80lFlH86;cdodgrLVGuo;XXLBqVgvmGf;NaLgX8cUHhC&displayProperty=NAME&outputIdScheme=NAME'
  bal_url_4weeks <-
    'https://dhis2.nih.org.pk/api/29/analytics.csv?dimension=pe:LAST_4_WEEKS&dimension=ou:VsFxszeTGEz;QCI7DuNfEbC;kxypyt24E17;XAsjICxTN2s;vK0NDai4kN5;j9Bgm0Ym8pH;K4xz6gAnu39;lmHLpSX3OAm;fWd1LGPYm2u;JGnIubLygc9;PsIhDGNoVL9;eQolzG92f2g;oWK2oNPlokn;Qf1G64E4GlS;kT8fivn3w22;nvZlgtE3wuI;oxgMciUgZAg;Oxi2cEvthTe;sFowPKSR11n;S25VwAv3Eap;IIJ1OhKJfzy;KhvDi1epJB4;IFBIAbz3Lzq;N4LWclX4u9T;wXgDboKFlwC;CnBh25K9xFT;uZbnTb1cV5x;pB7EBHQVigo;IzGJGI78vzf;vc5lfFdiEfD;F4ibhsZG8oO;YyGYxV0Vfpj;lqIm0xpt2ac&dimension=dx:FL15gcN6YoB;ce7JjhufQPQ;sYmVwOJUs6O;S53icWaOGG5;ii4RFfN5s7Z;fQnNTPgzfQz;DUrKtO4mCAj;ucDvEck5jrr;FrLe8mTAhfu;RPyh0Sfsiau;mENubu3dA1e;srVRHmgOlsf;Sxjv6S6oOol;SVrDgM4Fr0u;Z8UBXMJrzvV;UJBegcM4Zx3;mpcKhKlzDa1;ft6Jux3u5dR;HABiN9Fw4Md;mIF6pa2Wx4f;XqswUKgvotn;d7tz2cz17eS;kwT80lFlH86;cdodgrLVGuo;XXLBqVgvmGf;NaLgX8cUHhC&displayProperty=NAME&outputIdScheme=NAME'
  bal_url_12weeks <-
    'https://dhis2.nih.org.pk/api/29/analytics.csv?dimension=pe:LAST_12_WEEKS&dimension=ou:VsFxszeTGEz;QCI7DuNfEbC;kxypyt24E17;XAsjICxTN2s;vK0NDai4kN5;j9Bgm0Ym8pH;K4xz6gAnu39;lmHLpSX3OAm;fWd1LGPYm2u;JGnIubLygc9;PsIhDGNoVL9;eQolzG92f2g;oWK2oNPlokn;Qf1G64E4GlS;kT8fivn3w22;nvZlgtE3wuI;oxgMciUgZAg;Oxi2cEvthTe;sFowPKSR11n;S25VwAv3Eap;IIJ1OhKJfzy;KhvDi1epJB4;IFBIAbz3Lzq;N4LWclX4u9T;wXgDboKFlwC;CnBh25K9xFT;uZbnTb1cV5x;pB7EBHQVigo;IzGJGI78vzf;vc5lfFdiEfD;F4ibhsZG8oO;YyGYxV0Vfpj;lqIm0xpt2ac&dimension=dx:FL15gcN6YoB;ce7JjhufQPQ;sYmVwOJUs6O;S53icWaOGG5;ii4RFfN5s7Z;fQnNTPgzfQz;DUrKtO4mCAj;ucDvEck5jrr;FrLe8mTAhfu;RPyh0Sfsiau;mENubu3dA1e;srVRHmgOlsf;Sxjv6S6oOol;SVrDgM4Fr0u;Z8UBXMJrzvV;UJBegcM4Zx3;mpcKhKlzDa1;ft6Jux3u5dR;HABiN9Fw4Md;mIF6pa2Wx4f;XqswUKgvotn;d7tz2cz17eS;kwT80lFlH86;cdodgrLVGuo;XXLBqVgvmGf;NaLgX8cUHhC&displayProperty=NAME&outputIdScheme=NAME'
  ict_url_4weeks <-
    'https://dhis2.nih.org.pk/api/29/analytics.csv?dimension=pe:LAST_4_WEEKS&dimension=ou:Psp6mbx9U8M;ieUfKzE8d6o;IMFzIBVExEJ;lwDRbQAndm7;mBpGcb3Ml0E;F26OeDMFBA3;xE27eB7KoEt;NiKvQ1OLIff;DRrCn73DZGH;KavHCV7iPUO;n0ynaw72yaE&dimension=dx:FL15gcN6YoB;ce7JjhufQPQ;sYmVwOJUs6O;S53icWaOGG5;ii4RFfN5s7Z;fQnNTPgzfQz;DUrKtO4mCAj;ucDvEck5jrr;FrLe8mTAhfu;RPyh0Sfsiau;mENubu3dA1e;srVRHmgOlsf;Sxjv6S6oOol;SVrDgM4Fr0u;Z8UBXMJrzvV;UJBegcM4Zx3;mpcKhKlzDa1;ft6Jux3u5dR;HABiN9Fw4Md;mIF6pa2Wx4f;XqswUKgvotn;d7tz2cz17eS;kwT80lFlH86;cdodgrLVGuo;XXLBqVgvmGf;NaLgX8cUHhC&displayProperty=NAME&outputIdScheme=NAME'
  ict_url_12weeks <-
    'https://dhis2.nih.org.pk/api/29/analytics.csv?dimension=pe:LAST_12_WEEKS&dimension=ou:Psp6mbx9U8M;ieUfKzE8d6o;IMFzIBVExEJ;lwDRbQAndm7;mBpGcb3Ml0E;F26OeDMFBA3;xE27eB7KoEt;NiKvQ1OLIff;DRrCn73DZGH;KavHCV7iPUO;n0ynaw72yaE&dimension=dx:FL15gcN6YoB;ce7JjhufQPQ;sYmVwOJUs6O;S53icWaOGG5;ii4RFfN5s7Z;fQnNTPgzfQz;DUrKtO4mCAj;ucDvEck5jrr;FrLe8mTAhfu;RPyh0Sfsiau;mENubu3dA1e;srVRHmgOlsf;Sxjv6S6oOol;SVrDgM4Fr0u;Z8UBXMJrzvV;UJBegcM4Zx3;mpcKhKlzDa1;ft6Jux3u5dR;HABiN9Fw4Md;mIF6pa2Wx4f;XqswUKgvotn;d7tz2cz17eS;kwT80lFlH86;cdodgrLVGuo;XXLBqVgvmGf;NaLgX8cUHhC&displayProperty=NAME&outputIdScheme=NAME'
  kp_url_4weeks <-
    'https://dhis2.nih.org.pk/api/29/analytics.csv?dimension=pe:LAST_4_WEEKS&dimension=ou:IyYYluQegCK;OYfCChzZ1wx;DyZNKffgbe4;YkkfBV9xq0Q;I3ZT4uJ9PJU;kPFD098DsEz;fJXVXLVith1;ipLDZhTwf0V;MqTfVgJxJI2;VBo8pb4nnHe;BKn3CJMJdp8;ahZbtTji8RD;wrL8atyPhqJ;qqd9zDhY7AM;AElxCTWl3yY;w47I7gLAO92;xWr4WHkad9h;a5NijYWq3So;WRKimPKcbWQ;t5ewPIhl9yf;Ed0fC1gz73m;a4sLZu7NtqZ;mPc4vrUo77B;NXdmPYnzknS;UJRHpidvr1n&dimension=dx:FL15gcN6YoB;ce7JjhufQPQ;sYmVwOJUs6O;S53icWaOGG5;ii4RFfN5s7Z;fQnNTPgzfQz;DUrKtO4mCAj;ucDvEck5jrr;FrLe8mTAhfu;RPyh0Sfsiau;mENubu3dA1e;srVRHmgOlsf;Sxjv6S6oOol;SVrDgM4Fr0u;Z8UBXMJrzvV;UJBegcM4Zx3;mpcKhKlzDa1;ft6Jux3u5dR;HABiN9Fw4Md;mIF6pa2Wx4f;XqswUKgvotn;d7tz2cz17eS;kwT80lFlH86;cdodgrLVGuo;XXLBqVgvmGf;NaLgX8cUHhC&displayProperty=NAME&outputIdScheme=NAME'
  kp_url_12weeks <-
    'https://dhis2.nih.org.pk/api/29/analytics.csv?dimension=pe:LAST_12_WEEKS&dimension=ou:IyYYluQegCK;OYfCChzZ1wx;DyZNKffgbe4;YkkfBV9xq0Q;I3ZT4uJ9PJU;kPFD098DsEz;fJXVXLVith1;ipLDZhTwf0V;MqTfVgJxJI2;VBo8pb4nnHe;BKn3CJMJdp8;ahZbtTji8RD;wrL8atyPhqJ;qqd9zDhY7AM;AElxCTWl3yY;w47I7gLAO92;xWr4WHkad9h;a5NijYWq3So;WRKimPKcbWQ;t5ewPIhl9yf;Ed0fC1gz73m;a4sLZu7NtqZ;mPc4vrUo77B;NXdmPYnzknS;UJRHpidvr1n&dimension=dx:FL15gcN6YoB;ce7JjhufQPQ;sYmVwOJUs6O;S53icWaOGG5;ii4RFfN5s7Z;fQnNTPgzfQz;DUrKtO4mCAj;ucDvEck5jrr;FrLe8mTAhfu;RPyh0Sfsiau;mENubu3dA1e;srVRHmgOlsf;Sxjv6S6oOol;SVrDgM4Fr0u;Z8UBXMJrzvV;UJBegcM4Zx3;mpcKhKlzDa1;ft6Jux3u5dR;HABiN9Fw4Md;mIF6pa2Wx4f;XqswUKgvotn;d7tz2cz17eS;kwT80lFlH86;cdodgrLVGuo;XXLBqVgvmGf;NaLgX8cUHhC&displayProperty=NAME&outputIdScheme=NAME'

  # Download and combine data
  ajk_4weeks <-
    get_pivottable(ajk_url_4weeks, filename = 'data/ajk_4weeks.csv')
  ajk_4weeks[, Province := 'Azad Jamu and Kashmir']
  bal_4weeks <-
    get_pivottable(bal_url_4weeks, filename = 'data/bal_4weeks.csv')
  bal_4weeks[, Province := 'Balochistan']
  ict_4weeks <-
    get_pivottable(ict_url_4weeks, filename = 'data/ict_4weeks.csv')
  ict_4weeks[, Province := 'ICT']
  kp_4weeks <-
    get_pivottable(kp_url_4weeks, filename = 'data/kp_4weeks.csv')
  kp_4weeks[, Province := 'Khyber Pakhtunkhwa']
  all_4weeks <-
    data.table::rbindlist(list(ajk_4weeks, bal_4weeks, ict_4weeks, kp_4weeks))
  ajk_12weeks <-
    get_pivottable(ajk_url_12weeks, filename = 'data/ajk_12weeks.csv')
  ajk_12weeks[, Province := 'Azad Jamu and Kashmir']
  bal_12weeks <-
    get_pivottable(bal_url_12weeks, filename = 'data/bal_12weeks.csv')
  bal_12weeks[, Province := 'Balochistan']
  ict_12weeks <-
    get_pivottable(ict_url_12weeks, filename = 'data/ict_12weeks.csv')
  ict_12weeks[, Province := 'ICT']
  kp_12weeks <-
    get_pivottable(kp_url_12weeks, filename = 'data/kp_12weeks.csv')
  kp_12weeks[, Province := 'Khyber Pakhtunkhwa']
  all_12weeks <-
    data.table::rbindlist(list(ajk_12weeks, bal_12weeks, ict_12weeks, kp_12weeks))

  # Convert DHIS 2 ISO weeks to dates of corresponding Mondays
  isoweek_pattern <- '^W([0-9]{1,2}) ([0-9]{4})'
  all_4weeks[, c('isowk', 'isoyr') := data.frame(stringr::str_match(Period, isoweek_pattern))[, 2:3]]
  all_4weeks <-
    data.table::data.table(all_4weeks,
                           isoyrwk = paste(
                             all_4weeks$isoyr,
                             '-W',
                             stringr::str_pad(all_4weeks$isowk, 2, pad = '0'),
                             '-1',
                             sep = ''
                           ))
  all_4weeks[, weekdate := ISOweek::ISOweek2date(isoyrwk)]
  all_12weeks[, c('isowk', 'isoyr') := data.frame(stringr::str_match(Period, isoweek_pattern))[, 2:3]]
  all_12weeks <-
    data.table::data.table(all_12weeks,
                           isoyrwk = paste(
                             all_12weeks$isoyr,
                             '-W',
                             stringr::str_pad(all_12weeks$isowk, 2, pad = '0'),
                             '-1',
                             sep = ''
                           ))
  all_12weeks[, weekdate := ISOweek::ISOweek2date(isoyrwk)]

  # Remove uninformative data
  ous_with_data_4weeks <-
    all_4weeks[, .(N = sum(Value)), `Organisation unit`][N > 0, `Organisation unit`]
  all_4weeks <-
    all_4weeks[`Organisation unit` %in% ous_with_data_4weeks]
  data_with_data_4weeks <-
    all_4weeks[, .(N = sum(Value)), Data][N > 0, Data]
  all_4weeks <- all_4weeks[Data %in% data_with_data_4weeks]

  # Wrap long strings for axes
  all_4weeks[, Data_wrap := stringr::str_wrap(Data, width = 10)]


  # Figure 1. Distribution of IDSR Priority Diseases Reported during last 4 weeks from Reporting Districts of Pakistan

  fig1data <- all_4weeks[, .(N = sum(Value)), .(Data, weekdate)]

  # Filter to IDSR priority diseases
  priority <-
    c(
      'Measles (new case)',
      'Influenza-Like Illness (new case)',
      'Acute Haemorrhagic Fever (new case)',
      'Acute Respiratory Infection (new case)',
      'Acute Watery Diarrhoea < 5 years (new case)',
      'Acute Watery Diarrhoea > 5 years (new case)',
      'Diphtheria (new case)',
      'Severe Acute Respiratory Infection (new case)'
    )
  fig1data <- fig1data[Data %in% priority]

  # Wrap long strings
  fig1data[, Data_wrap := stringr::str_wrap(Data, width = 10)]

  fig1plot <-
    ggplot(data = fig1data, aes(
      x = Data_wrap,
      y = N,
      fill = factor(weekdate)
    )) +
    geom_bar(position = 'dodge', stat = 'identity') +
    geom_text(
      data = fig1data,
      aes(label = N),
      position = position_dodge(width = 0.9),
      vjust = -0.5
    ) +
    theme_gov() +
    scale_color_viridis_d() +
    theme(axis.text.x = element_text(vjust = 0.5)) +
    labs(x = 'Priority diseases', y = 'Notifications')

  ggsave(
    plot = fig1plot,
    'figs/fig1plot.png',
    width = 11,
    height = 5
  )

  # Figure 3. Frequency of IDSR Priority Diseases Reported from Azad Jammu & Kashmir (Mirpur), Epi Week 42- 45, October & November, 2019

  fig3data <-
    all_4weeks[Province %in% 'Azad Jamu and Kashmir' &
                 Data %in% priority, .(N = sum(Value)), .(Data, weekdate)]

  # Wrap long strings
  fig3data[, Data_wrap := stringr::str_wrap(Data, width = 10)]

  fig3plot <-
    ggplot(data = fig3data, aes(
      x = Data_wrap,
      y = N,
      fill = factor(weekdate)
    )) +
    geom_bar(position = 'dodge', stat = 'identity') +
    geom_text(
      data = fig3data,
      aes(label = N),
      position = position_dodge(width = 0.9),
      vjust = -0.5
    ) +
    theme_gov() +
    scale_color_viridis_d() +
    theme(axis.text.x = element_text(vjust = 0.5)) +
    labs(x = 'Priority diseases', y = 'Notifications')

  ggsave(
    plot = fig3plot,
    'figs/fig3plot.png',
    width = 11,
    height = 5
  )

  # Figure 4: Frequency of IDSR Priority Diseases Reported from Baluchistan (Gwadar, Kech, & Killa Abdullah), Epi Week 42- 45, October & November, 2019

  fig4data <-
    all_4weeks[Province %in% 'Balochistan' &
                 Data %in% priority, .(N = sum(Value)), .(Data, weekdate)]

  # Wrap long strings
  fig4data[, Data_wrap := stringr::str_wrap(Data, width = 10)]

  fig4plot <-
    ggplot(data = fig4data, aes(
      x = Data_wrap,
      y = N,
      fill = factor(weekdate)
    )) +
    geom_bar(position = 'dodge', stat = 'identity') +
    geom_text(
      data = fig4data,
      aes(label = N),
      position = position_dodge(width = 0.9),
      vjust = -0.5
    ) +
    theme_gov() +
    scale_color_viridis_d() +
    theme(axis.text.x = element_text(vjust = 0.5)) +
    labs(x = 'Priority diseases', y = 'Notifications')

  ggsave(
    plot = fig4plot,
    'figs/fig4plot.png',
    width = 11,
    height = 5
  )

  # Figure 5: Frequency of IDSR Priority Diseases Reported from Khyber Pakhtunkhwa (Haripur & Lakki Marwat), during Epi Week 42- 45, October & November, 2019

  fig5data <-
    all_4weeks[Province %in% 'Khyber Pakhtunkhwa' &
                 Data %in% priority, .(N = sum(Value)), .(Data, weekdate)]

  # Wrap long strings
  fig5data[, Data_wrap := stringr::str_wrap(Data, width = 10)]

  fig5plot <-
    ggplot(data = fig5data, aes(
      x = Data_wrap,
      y = N,
      fill = factor(weekdate)
    )) +
    geom_bar(position = 'dodge', stat = 'identity') +
    geom_text(
      data = fig5data,
      aes(label = N),
      position = position_dodge(width = 0.9),
      vjust = -0.5
    ) +
    theme_gov() +
    scale_color_viridis_d() +
    theme(axis.text.x = element_text(vjust = 0.5)) +
    labs(x = 'Priority diseases', y = 'Notifications')

  ggsave(
    plot = fig5plot,
    'figs/fig5plot.png',
    width = 11,
    height = 5
  )

  # Figure 6: Frequency of IDSR Priority Diseases Reported from Islamabad (ICT HF) during Epi Week 30 & 43-45, October & November, 2019

  fig6data <-
    all_4weeks[Province %in% 'ICT' &
                 Data %in% priority, .(N = sum(Value)), .(Data, weekdate)]

  fig6data <- fig6data[Data %in% priority]

  # Wrap long strings
  fig6data[, Data_wrap := stringr::str_wrap(Data, width = 10)]

  fig6plot <-
    ggplot(data = fig6data, aes(
      x = Data_wrap,
      y = N,
      fill = factor(weekdate)
    )) +
    geom_bar(position = 'dodge', stat = 'identity') +
    geom_text(
      data = fig6data,
      aes(label = N),
      position = position_dodge(width = 0.9),
      vjust = -0.5
    ) +
    theme_gov() +
    scale_color_viridis_d() +
    theme(axis.text.x = element_text(vjust = 0.5)) +
    labs(x = 'Priority diseases', y = 'Notifications')

  ggsave(
    plot = fig6plot,
    'figs/fig6plot.png',
    width = 11,
    height = 5
  )

  # ? charts not tables for rest

  # AJK
  fig7data <-
    all_4weeks[Province %in% 'Azad Jamu and Kashmir' &
                 !(Data %in% priority), .(N = sum(Value)), .(Data, weekdate, `Organisation unit`)]

  # Wrap long strings
  fig7data[, Data_wrap := stringr::str_wrap(Data, width = 10)]

  fig7plot <-
    ggplot(data = fig7data, aes(
      x = Data_wrap,
      y = N,
      fill = factor(weekdate)
    )) +
    geom_bar(position = 'dodge', stat = 'identity') +
    geom_text(
      data = fig7data,
      aes(label = N),
      position = position_dodge(width = 0.9),
      vjust = 0
    ) +
    facet_wrap( ~ `Organisation unit`, ncol = 1) +
    theme_gov() +
    scale_color_viridis_d() +
    theme(axis.text.x = element_text(vjust = 0.5)) +
    labs(x = 'Other diseases', y = 'Notifications')

  ggsave(
    plot = fig7plot,
    'figs/fig7plot.png',
    width = 11,
    height = 5
  )

  # Balochistan
  fig8data <-
    all_4weeks[Province %in% 'Balochistan' &
                 !(Data %in% priority), .(N = sum(Value)), .(Data, weekdate, `Organisation unit`)]

  # Wrap long strings
  fig8data[, Data_wrap := stringr::str_wrap(Data, width = 10)]

  fig8plot <-
    ggplot(data = fig8data, aes(
      x = Data_wrap,
      y = N,
      fill = factor(weekdate)
    )) +
    geom_bar(position = 'dodge', stat = 'identity') +
    geom_text(
      data = fig8data,
      aes(label = N),
      position = position_dodge(width = 0.9),
      vjust = 0
    ) +
    facet_grid(`Organisation unit` ~ ., space = 'free') +
    theme_gov() +
    scale_color_viridis_d() +
    theme(axis.text.x = element_text(vjust = 0.5)) +
    labs(x = 'Other diseases', y = 'Notifications')

  ggsave(
    plot = fig8plot,
    'figs/fig8plot.png',
    width = 11,
    height = 9
  )

  # KP
  fig9data <-
    all_4weeks[Province %in% 'Khyber Pakhtunkhwa' &
                 !(Data %in% priority), .(N = sum(Value)), .(Data, weekdate, `Organisation unit`)]

  # Wrap long strings
  fig9data[, Data_wrap := stringr::str_wrap(Data, width = 10)]

  fig9plot <-
    ggplot(data = fig9data, aes(
      x = Data_wrap,
      y = N,
      fill = factor(weekdate)
    )) +
    geom_bar(position = 'dodge', stat = 'identity') +
    geom_text(
      data = fig9data,
      aes(label = N),
      position = position_dodge(width = 0.9),
      vjust = 0
    ) +
    facet_wrap( ~ `Organisation unit`) +
    theme_gov() +
    scale_color_viridis_d() +
    theme(axis.text.x = element_text(vjust = 0.5)) +
    labs(x = 'Other diseases', y = 'Notifications')

  ggsave(
    plot = fig9plot,
    'figs/fig9plot.png',
    width = 15,
    height = 9
  )
  message('Figures and data refreshed\n')
  invisible(NULL)
}

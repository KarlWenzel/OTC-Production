library(RODBC)
library(lubridate)

setwd("e:/git/OTC-Production/data")

sql_dsn = "OTC"
conn = odbcConnect(sql_dsn)

load.exp_gpexempt.dat = FALSE
load.exp_gpoper.dat = FALSE
load.exp_gpqtrat.dat = FALSE
load.exp_gplease.dat = FALSE
load.exp_gph_reports_12.dat = TRUE
load.exp_gph_reports_36.dat = TRUE

if (load.exp_gpexempt.dat) {
  sqlQuery(conn, "DELETE FROM exp_gpexempt")
  dat.file = file("exp_gpexempt.dat", "r")
  while ( TRUE ) {
    lines = readLines(dat.file, n = 1000)
    if ( length(lines) == 0 ) {
      break
    }
    exp_gpexempt = data.frame(
      pun_county_num = substr(lines,1, 3),
      pun_lease_num = substr(lines,4, 9),
      pun_sub_num = substr(lines,10, 10),
      pun_merge_num = substr(lines,11, 14),
      exemption_type = sub("\\s+$", "", substr(lines,15, 64)),
      code = substr(lines,65, 69),
      exemption_percentage = as.numeric(substr(lines,70, 93))
    )
    sqlSave(conn, exp_gpexempt, append=TRUE, rownames=FALSE)
  }
  close(dat.file)
}

if (load.exp_gpoper.dat) {
  sqlQuery(conn, "DELETE FROM exp_gpoper")
  dat.file = file("exp_gpoper.dat", "r")
  while ( TRUE ) {
    lines = readLines(dat.file, n = 1000)
    if ( length(lines) == 0 ) {
      break
    }
    exp_gpoper = data.frame(
      pun_county_num = substr(lines,1, 3),
      pun_lease_num = substr(lines,4, 9),
      pun_sub_num = substr(lines,10, 10),
      pun_merge_num = substr(lines,11, 14),
      company_number = substr(lines,15, 21),
      company_name = sub("\\s+$", "", substr(lines,22, 276))
    )
    sqlSave(conn, exp_gpoper, append=TRUE, rownames=FALSE)
  }
  close(dat.file)
}

if (load.exp_gpqtrat.dat) {
  sqlQuery(conn, "DELETE FROM exp_gpqtrat")
  dat.file = file("exp_gpqtrat.dat", "r")
  while ( TRUE ) {
    lines = readLines(dat.file, n = 1000)
    if ( length(lines) == 0 ) {
      break
    }
    exp_gpqtrat = data.frame(
      pun_county_num = substr(lines,1, 3),
      pun_lease_num = substr(lines,4, 9),
      pun_sub_num = substr(lines,10, 10),
      pun_merge_num = substr(lines,11, 14),
      lease_name = sub("\\s+$", "", substr(lines,15, 74)),
      well_name = sub("\\s+$", "", substr(lines,75, 134)),
      period_start_date_text = as.Date(paste0("01-", sub("\\s+$", "", substr(lines, 135, 145))), "%d-%b-%Y"),
      period_end_date_text = as.Date(paste0("01-", sub("\\s+$", "", substr(lines,146, 156))), "%d-%b-%Y"),
      period_start_date = NA,
      period_end_date = NA,
      rate  = as.numeric(substr(lines,157, 166))
    )
    exp_gpqtrat$period_start_date_text = as.character(exp_gpqtrat$period_start_date_text)
    exp_gpqtrat$period_end_date_text = as.character((exp_gpqtrat$period_end_date_text %m+% months(1) ) - 1)
    sqlSave(conn, exp_gpqtrat, append=TRUE, rownames=FALSE)
  }
  close(dat.file)
}

if (load.exp_gplease.dat) {
  sqlQuery(conn, "DELETE FROM exp_gplease")
  dat.file = file("exp_gplease.dat", "r")
  while ( TRUE ) {
    lines = readLines(dat.file, n = 1000)
    if ( length(lines) == 0 ) {
      break
    }
    exp_gplease = data.frame(
      name = sub("\\s+$", "", substr(lines,1, 50)),
      pun_county_num = substr(lines,51, 53),
      pun_lease_num = substr(lines,54, 59),
      pun_sub_num = substr(lines,60, 60),
      pun_merge_num = substr(lines,61, 64),
      legal_description_type = sub("\\s+$", "", substr(lines,65, 104)),
      quarter2p5 = sub("\\s+$", "", substr(lines,105, 106)),
      quarter10 = sub("\\s+$", "", substr(lines,107, 108)),
      quarter40 = sub("\\s+$", "", substr(lines,109, 110)),
      quarter160 = sub("\\s+$", "", substr(lines,111, 112)),
      section = sub("\\s+$", "", substr(lines,113, 114)),
      township = sub("\\s+$", "", substr(lines,115, 117)),
      range = sub("\\s+$", "", substr(lines,118, 122)),
      well_classification = substr(lines,123, 132),
      well_name = sub("\\s+$", "", substr(lines,133, 192)),
      formation_names = sub("\\s+$", "", substr(lines,193, 447))
    )
    sqlSave(conn, exp_gplease, append=TRUE, rownames=FALSE)
  }
  close(dat.file)
}

if (load.exp_gph_reports_12.dat) {
  sqlQuery(conn, "DELETE FROM exp_gph_reports_12")
  dat.file = file("exp_gph_reports_12.dat", "r")
  while ( TRUE ) {
    lines = readLines(dat.file, n = 1000)
    if ( length(lines) == 0 ) {
      break
    }
    exp_gph_reports_12 = data.frame(
      company_name = sub("\\s+$", "", substr(lines,1, 255)),
      company_number = substr(lines,256, 275),
      reporting_month = substr(lines,276, 277),
      reporting_year = substr(lines,278, 281),
      tax_type_code = substr(lines,282, 283),
      product_code = substr(lines,284, 285),
      report_type_code = substr(lines,286, 287),
      pun_county_num = substr(lines,288, 290),
      pun_lease_num = substr(lines,291, 296),
      pun_sub_num = substr(lines,297, 297),
      pun_merge_num = substr(lines,298, 301),
      company_name2 = sub("\\s+$", "", substr(lines,302, 556)),
      producer_purchaser = substr(lines,557, 576),
      gross_volume = as.numeric(substr(lines,577, 597)),
      exempt_code = substr(lines,598, 599),
      decimal_equiv = as.numeric(substr(lines,600, 619)),
      exempt_volume       = as.numeric(substr(lines,620, 640)),
      taxable_volume = as.numeric(substr(lines,641, 661))
    )
    sqlSave(conn, exp_gph_reports_12, append=TRUE, rownames=FALSE)
  }
  close(dat.file)
}

if (load.exp_gph_reports_36.dat) {
  sqlQuery(conn, "DELETE FROM exp_gph_reports_36")
  dat.file = file("exp_gph_reports_36.dat", "r")
  while ( TRUE ) {
    lines = readLines(dat.file, n = 1000)
    if ( length(lines) == 0 ) {
      break
    }
    exp_gph_reports_36 = data.frame(
      company_name = sub("\\s+$", "", substr(lines,1, 255)),
      company_number = substr(lines,256, 275),
      reporting_month = substr(lines,276, 277),
      reporting_year = substr(lines,278, 281),
      tax_type_code = substr(lines,282, 283),
      product_code = substr(lines,284, 285),
      report_type_code = substr(lines,286, 287),
      pun_county_num = substr(lines,288, 290),
      pun_lease_num = substr(lines,291, 296),
      pun_sub_num = substr(lines,297, 297),
      pun_merge_num = substr(lines,298, 301),
      company_name2 = sub("\\s+$", "", substr(lines,302, 556)),
      producer_purchaser = substr(lines,557, 576),
      gross_volume = as.numeric(substr(lines,577, 597)),
      exempt_code = substr(lines,598, 599),
      decimal_equiv = as.numeric(substr(lines,600, 619)),
      exempt_volume       = as.numeric(substr(lines,620, 640)),
      taxable_volume = as.numeric(substr(lines,641, 661))
    )
    sqlSave(conn, exp_gph_reports_36, append=TRUE, rownames=FALSE)
  }
  close(dat.file)
}

odbcClose(conn)




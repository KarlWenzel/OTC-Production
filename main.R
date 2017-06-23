library(RODBC)
library(lubridate)
library(reshape2)
library(ggplot2)

#################
# CONFIGURATION #
#################

data_folder = "e:/git/OTC-Production/data"
reports_folder = "e:/git/OTC-Production/reports"
sql_dsn = "OTC"
first_time_run = FALSE

# If this isn't the first time to run this program, you may select individual processes to 
# be executed below.

load.exp_gpexempt.dat = FALSE
load.exp_gpoper.dat = FALSE
load.exp_gpqtrat.dat = FALSE
load.exp_gplease.dat = FALSE
load.exp_gph_reports_12.dat = FALSE
load.exp_gph_reports_36.dat = FALSE
process.raw.data = FALSE 
build.hyperbolic.model = TRUE
build.reports = TRUE

# Apply configuration, get connection to database

setwd(data_folder)
conn = odbcConnect(sql_dsn)

if (first_time_run) {
  load.exp_gpexempt.dat = TRUE
  load.exp_gpoper.dat = TRUE
  load.exp_gpqtrat.dat = TRUE
  load.exp_gplease.dat = TRUE
  load.exp_gph_reports_12.dat = TRUE
  load.exp_gph_reports_36.dat = TRUE
  process.raw.data = TRUE
  build.hyperbolic.model = TRUE
  build.reports = TRUE
}

#################
# Load Raw Data #
#################

if (load.exp_gpexempt.dat) {
  print("Loading exp_gpexempt.dat");
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
  print("Loading exp_gpoper.dat");
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
  print("Loading exp_gpqtrat.dat");
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
  print("Loading exp_gplease.dat");
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
  print("Loading exp_gph_reports.dat");
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
  print("Loading exp_gph_reports_36.dat");
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

######################
# Build Tidy Dataset #
######################

if (process.raw.data) {
  print("Processing raw data")
  sqlQuery(conn, "EXEC ProcessFromDTOs") 
  # Please refer to the ProcessFromDTOs stored procedure for documentation
}

###############
# Build Model #
###############

hyperbolic.curve = function(qi, Di, b, t) {
  return( qi / (1 + b * Di * t) ^ (1 / b) )
}

get.Di.estimate = function(q) {
  return(-1 * min( (q[2+1:5] - q[2]) / 1:5 ) )
}

get.hyperbolic.error = function(p, q) {
  qi = q[2]
  Di = get.Di.estimate(q)
  b = p[1]
  t = 1:length(q)-2
  curve = hyperbolic.curve(qi, Di, b, t)
  return( sum((curve - q[t+2])^2) )
}

get.model = function(data, product) {
  
  #skip first 2 cols and take p0 thru p35 and melt it into a vector
  q = melt(data[data$Product==product, 2+(1:36)])$value  
  q0 = q[1]
  qi = q[2]
  Di = get.Di.estimate(q)
  
  #estimate the best fit b values 
  result = nlm(get.hyperbolic.error, p=c(1), q=q)
  b = result$estimate[1]
  
  print(paste("Product:", product, ";  Di:", Di, ";  b:", b))
  
  t = 1:((12*20) - 2) # 20 years worth of months, minus two months (q0 and qi)
  curve = c(q0, qi, hyperbolic.curve(qi, Di, b, t))
  write.csv(curve, paste0(reports_folder, "/estimated-", product, "-curve.csv"))
  
  cumulative = rep(0, length(curve))
  for (i in 1:length(curve)) {
    if (i > 1) {
      cumulative[i] = curve[i] + cumulative[i - 1]
    }
    else {
      cumulative[i] = curve[i]
    }
  }
  cumulative = cumulative / max(cumulative)
  write.csv(cumulative, paste0(reports_folder, "/estimated-", product, "-cumulative.csv"))
  
  # save plot 1 as pdf
  pdf(file=paste0(reports_folder, "/", product, "-decline-curve.pdf"))
  plot(t[1:48], curve[1:48], type="l", col="red", xlab="Month", ylab="Normalized Production", ylim=c(0,1))
  points(1:length(q), q)
  title(paste0("Normalized ", product, " Production in Horizontal Wells Since Feb 2014"))
  print(dev.cur())
  dev.off()

  return(curve)
}

get.interval.percents = function(data, product){
  total.production = sum(data)
  return(data.frame(
    product = product,
    first18mo = sum(data[1:18]) / total.production,
    first2yrs = sum(data[1:24]) / total.production,
    first3yrs = sum(data[1:36]) / total.production,
    first4yrs = sum(data[1:48]) / total.production,
    first5yrs = sum(data[1:60]) / total.production,
    last10of20yrs = sum(data[121:240]) / total.production
  ));
}

if (build.hyperbolic.model) {
  print("Saving production curves")
  data = sqlQuery(conn, "EXEC SelectAllCurves")
  
  # The data obtained from SelectAllCurves is an averaage of normalized well data.  It makes sense
  # to rescale the data again to a new normalized data set to ensure that data ranges from (0,1]
  
  for (i in 1:nrow(data)) {
    data[i,2+1:36] = data[i,2+1:36] / max(data[i,2+1:36])
  }
  write.csv(data, paste0(reports_folder, "/empirical-production-curves.csv"))
  
  gas.curve = get.model(data, "Gas")
  oil.curve = get.model(data, "Oil")
  
  gas.interval.percents = get.interval.percents(gas.curve, "Gas")
  oil.interval.percents = get.interval.percents(oil.curve, "Oil")
  write.csv(rbind(gas.interval.percents, oil.interval.percents), paste0(reports_folder, "/estimated-production-intervals.csv"))
  
}

if (build.reports) {
  
}

odbcClose(conn)




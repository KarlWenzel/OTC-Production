# OTC-Production
Decline curve analysis of horizontal oil and gas wells in Oklahoma

### Goals

Determine the statewide average percentage decline in gross production volume from all recent horizontal oil wells combined and horizontal gas wells combined during the wells' first year, 18 months, 2 years, 3 years, 4 years and 5 years.

### Method

This software use built using Microsoft SQL Server and RStudio, and uses data from the [Oklahoma Tax Commission](https://www.ok.gov/tax/).  The steps provided herein assume that you are using a Windows system, however the RODBC driver is used for database connectivity, so with minor changes to setting up the database, these steps should work on other systems and database as well.

1.  Obtain the OTC data set for well production (you will need to request permission to download).  Store the data files in a subfolder called /data.

2.  Create a new SQL database named "OTC", and run the [build-db.sql](build-db.sql) script to build the tables and stored procedures.

3.  [Create a DSN](https://support.microsoft.com/en-us/help/965049/how-to-set-up-a-microsoft-sql-server-odbc-data-source) for the new database, and call it "OTC".

4.  Edit the settings at the top of the [main.R](main.R) file:
    - data_folder (the path to the folder that has your data from step 1)
    - reports_folder (the path to the folder that you want your report data to be saved in)
    - sql_dsn (the name of the ODBC DSN that you created in step 3)
    - first_time_run (set this to TRUE)

5.  Execute the main.R script (this takes a while).  This script does three things:
    - Loads the raw OTC data into the SQL database
    - Executes some stored procedures to process the data
    - Saves report
    
### Assumptions

The goal is to observe production rates of recently drilled horizontal wells.  To build a tidy data set and perform analysis, the following assumptions were made:

1. A Production Unit Number (PUN) is unique for each well, and may be created by concatenating pun_county_num, pun_lease_num, pun_sub_num, and pun_merge_num.

2. The wells which are horizontal wells may be determined by selecting the distinct PUNs from the exp_gplease.dat file where legal_description_type contains "horizontal" (i.e. "Horizontal Well Surface Hole" or "Horizontal Well Bottom Hole")

3. The earliest date of production for each well may be found be selecting the earliest month/year from the exp_gpqtrat.dat file for each PUN.

4. To describe all recently drilled horizontal wells in Oklahoma, the data in exp_gph_reports_36.dat was used for all wells that were drilled not later than Feb 2014.  Only non-negative production values were used, and when amended reports were found, they were used to replace the corresponding values for normal reports (i.e. where report_type_code == '03', it was used to replace records where report_type_code == '01').  The non-negative production values were aggregated for each month, for each PUN, for each product_code.  Then for each well the data was normalized to fall within the range of (0,1].  After normalizing, the wells were averaged together to create a single, representative well for analysis, which was then normalized again to fall in the range of (0,1].

5.  A hyperbolic curve was used to extrapolate production into the future, so that the lifetime production of our average well could be estimated.  Some explanation for use of the hyperbolic curve may be found [here](http://www.petrocenter.com/reservoir/DCA_theory.htm) and [here](http://fekete.com/SAN/WebHelp/FeketeHarmony/Harmony_WebHelp/Content/HTML_Files/Reference_Material/Analysis_Method_Theory/Traditional_Decline_Theory.htm) Since the second month of production was the maximum flow rate for both oil and gas wells, this value was used for qi, and the difference between the second and third month was used for Di.  The value of 0.5 was used for b, and the curve fit very nicely to our observed values.


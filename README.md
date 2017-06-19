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
    - sql_dsn (the name of the ODBC DSN that you created in step 3)
    - first_time_run (set this to TRUE)

5.  Execute the main.R script (this takes a while).  This script does three things:
    - Loads the raw OTC data into the SQL database
    - Executes some stored procedures to process the data
    - Saves report

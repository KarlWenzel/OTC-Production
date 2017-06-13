USE [OTC]
GO
/****** Object:  Table [dbo].[exp_gpexempt]    Script Date: 6/13/2017 6:06:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[exp_gpexempt](
	[pun_county_num] [char](3) NULL,
	[pun_lease_num] [char](6) NULL,
	[pun_sub_num] [char](1) NULL,
	[pun_merge_num] [char](4) NULL,
	[exemption_type] [varchar](50) NULL,
	[code] [char](5) NULL,
	[exemption_percentage] [float] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[exp_gph_reports_12]    Script Date: 6/13/2017 6:06:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[exp_gph_reports_12](
	[company_name] [varchar](255) NULL,
	[company_number] [char](20) NULL,
	[reporting_month] [char](2) NULL,
	[reporting_year] [char](4) NULL,
	[tax_type_code] [char](2) NULL,
	[product_code] [char](2) NULL,
	[report_type_code] [char](2) NULL,
	[pun_county_num] [char](3) NULL,
	[pun_lease_num] [char](6) NULL,
	[pun_sub_num] [char](1) NULL,
	[pun_merge_num] [char](4) NULL,
	[company_name2] [varchar](255) NULL,
	[producer_purchaser] [char](20) NULL,
	[gross_volume] [float] NULL,
	[exempt_code] [char](2) NULL,
	[decimal_equiv] [float] NULL,
	[exempt_volume] [float] NULL,
	[taxable_volume] [float] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[exp_gph_reports_36]    Script Date: 6/13/2017 6:06:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[exp_gph_reports_36](
	[company_name] [varchar](255) NULL,
	[company_number] [char](20) NULL,
	[reporting_month] [char](2) NULL,
	[reporting_year] [char](4) NULL,
	[tax_type_code] [char](2) NULL,
	[product_code] [char](2) NULL,
	[report_type_code] [char](2) NULL,
	[pun_county_num] [char](3) NULL,
	[pun_lease_num] [char](6) NULL,
	[pun_sub_num] [char](1) NULL,
	[pun_merge_num] [char](4) NULL,
	[company_name2] [varchar](255) NULL,
	[producer_purchaser] [char](20) NULL,
	[gross_volume] [float] NULL,
	[exempt_code] [char](2) NULL,
	[decimal_equiv] [float] NULL,
	[exempt_volume] [float] NULL,
	[taxable_volume] [float] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[exp_gplease]    Script Date: 6/13/2017 6:06:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[exp_gplease](
	[name] [varchar](50) NULL,
	[pun_county_num] [char](3) NULL,
	[pun_lease_num] [char](6) NULL,
	[pun_sub_num] [char](1) NULL,
	[pun_merge_num] [char](4) NULL,
	[legal_description_type] [varchar](40) NULL,
	[quarter2p5] [char](2) NULL,
	[quarter10] [char](2) NULL,
	[quarter40] [char](2) NULL,
	[quarter160] [char](2) NULL,
	[section] [char](2) NULL,
	[township] [char](3) NULL,
	[range] [char](5) NULL,
	[well_classification] [char](10) NULL,
	[well_name] [varchar](60) NULL,
	[formation_names] [varchar](255) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[exp_gpoper]    Script Date: 6/13/2017 6:06:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[exp_gpoper](
	[pun_county_num] [varchar](255) NULL,
	[pun_lease_num] [varchar](255) NULL,
	[pun_sub_num] [varchar](255) NULL,
	[pun_merge_num] [varchar](255) NULL,
	[company_number] [varchar](255) NULL,
	[company_name] [varchar](255) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[exp_gpqtrat]    Script Date: 6/13/2017 6:06:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[exp_gpqtrat](
	[pun_county_num] [char](3) NULL,
	[pun_lease_num] [char](6) NULL,
	[pun_sub_num] [char](1) NULL,
	[pun_merge_num] [char](4) NULL,
	[lease_name] [varchar](60) NULL,
	[well_name] [varchar](60) NULL,
	[period_start_date_text] [char](10) NULL,
	[period_end_date_text] [char](10) NULL,
	[period_start_date] [datetime] NULL,
	[period_end_date] [datetime] NULL,
	[rate] [float] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MonthlyProduction]    Script Date: 6/13/2017 6:06:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MonthlyProduction](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ReportingMonth] [int] NULL,
	[ReportingYear] [int] NULL,
	[ReportingDateHash] [int] NULL,
	[product_code] [char](2) NULL,
	[report_type_code] [char](2) NULL,
	[PUN] [char](17) NULL,
	[SumVolume] [float] NULL,
 CONSTRAINT [PK_MonthlyProduction] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MonthlyProductionSummary]    Script Date: 6/13/2017 6:06:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MonthlyProductionSummary](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PUN] [char](17) NULL,
	[product_code] [char](2) NULL,
	[MaxVolume] [float] NULL,
	[FirstDateHash] [int] NULL,
	[LastDateHash] [int] NULL,
 CONSTRAINT [PK_MonthlyProductionSummary] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[ProcessFromDTOs]    Script Date: 6/13/2017 6:06:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ProcessFromDTOs]
AS
BEGIN

TRUNCATE TABLE MonthlyProduction

-- aggregate all monthly production by PUN, date, product, and report type
-- do not care about potentially double counting companies b/c we will normalize the final data set anyways

INSERT INTO MonthlyProduction 
(
	ReportingMonth ,ReportingYear ,ReportingDateHash ,product_code ,report_type_code ,PUN ,SumVolume
)
SELECT
	 CAST(reporting_month AS INT) AS ReportingMonth
    ,CAST(reporting_year AS INT) AS ReportingYear
	,CAST(reporting_month AS INT) + 100*CAST(reporting_year AS INT) AS ReportingDateHash
    ,product_code
    ,report_type_code
    ,pun_county_num + '-' + pun_lease_num + '-' + pun_sub_num + '-' + pun_merge_num AS PUN
    ,SUM(gross_volume) AS SumGrossVolume
FROM exp_gph_reports_12
WHERE pun_county_num + '-' + pun_lease_num + '-' + pun_sub_num + '-' + pun_merge_num IN
(
	SELECT pun_county_num + '-' + pun_lease_num + '-' + pun_sub_num + '-' + pun_merge_num 
	FROM exp_gplease WHERE legal_description_type LIKE 'horizontal%'
)
GROUP BY 
	reporting_month
	,reporting_year
	,product_code
	,report_type_code
	,pun_county_num + '-' + pun_lease_num + '-' + pun_sub_num + '-' + pun_merge_num

-- Now remove the normal reports (report_type_code == '01') where they are superceeded by an amended report

DELETE FROM MonthlyProduction WHERE ID IN
(
	SELECT MP2.ID
	FROM MonthlyProduction MP 
	INNER JOIN MonthlyProduction MP2 
	ON
	(
		MP.PUN = MP2.PUN
		AND MP.ReportingDateHash = MP2.ReportingDateHash
		AND MP.product_code = MP2.product_code
	)
	WHERE 
	MP.report_type_code = '03'
	AND MP2.report_type_code = '01'
)

TRUNCATE TABLE MonthlyProductionSummary

-- For each (PUN, product_code) combination, determine starting and ending points
-- NOTE that we'll use the Max Production value for each well as the starting point to produce our normalized data set
-- for the purpose of creating the curve, and then we'll do a separate calculation to determine how many months into production
-- will the normal curve be achieved (possibly? or we'll skip that and use the max as the initial.. TBD)

INSERT INTO MonthlyProductionSummary
( 
	PUN, product_code, MaxVolume, FirstDateHash, LastDateHash
)
SELECT FirstMP.PUN, FirstMP.product_code, FirstMP.MaxVolume, FirstMP.MinDateHash, LastMP.MaxDateHash
FROM 
(
	SELECT MP2.PUN, MP2.product_code, MP2.SumVolume AS MaxVolume, Min(MP2.ReportingDateHash) AS MinDateHash
	FROM MonthlyProduction MP2
	INNER JOIN
	(
		SELECT PUN, product_code, Max(SumVolume) AS MaxSumVolume FROM MonthlyProduction InnerT GROUP BY PUN, product_code
	) AS MaxVolMP ON MP2.PUN = MaxVolMP.PUN AND MP2.SumVolume = MaxVolMP.MaxSumVolume AND MP2.product_code = MaxVolMP.product_code
	GROUP BY MP2.PUN, MP2.product_code, MP2.SumVolume
) AS FirstMP
INNER JOIN
(
	SELECT PUN, product_code, Max(ReportingDateHash) AS MaxDateHash FROM MonthlyProduction GROUP BY PUN, product_code
) AS LastMP ON FirstMP.PUN = LastMP.PUN AND LastMP.product_code = FirstMP.product_code
ORDER BY FirstMP.PUN


END
GO
/****** Object:  StoredProcedure [dbo].[Set_exp_gpqtrat_Dates]    Script Date: 6/13/2017 6:06:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Set_exp_gpqtrat_Dates]
AS
BEGIN

	UPDATE exp_gpqtrat
	SET
	period_start_date = Convert(DATETIME, period_start_date_text),
	period_end_date = Convert(DATETIME, period_end_date_text)

END

GO

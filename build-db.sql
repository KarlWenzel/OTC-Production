USE [OTC]
GO
/****** Object:  Table [dbo].[exp_gpexempt]    Script Date: 6/21/2017 11:50:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[exp_gph_reports_12]    Script Date: 6/21/2017 11:50:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[exp_gph_reports_36]    Script Date: 6/21/2017 11:50:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[exp_gplease]    Script Date: 6/21/2017 11:50:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[exp_gpoper]    Script Date: 6/21/2017 11:50:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[exp_gpqtrat]    Script Date: 6/21/2017 11:50:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[MonthlyProduction]    Script Date: 6/21/2017 11:50:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[MonthlyProductionSummary]    Script Date: 6/21/2017 11:50:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[NormalProduction]    Script Date: 6/21/2017 11:50:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NormalProduction](
	[PUN] [char](17) NULL,
	[ProductCode] [char](2) NULL,
	[PeriodStartHash] [int] NULL,
	[MaxProdDateHash] [int] NULL,
	[LastDateHash] [int] NULL,
	[MaxVolume] [float] NULL,
	[P0] [float] NULL,
	[P1] [float] NULL,
	[P2] [float] NULL,
	[P3] [float] NULL,
	[P4] [float] NULL,
	[P5] [float] NULL,
	[P6] [float] NULL,
	[P7] [float] NULL,
	[P8] [float] NULL,
	[P9] [float] NULL,
	[P10] [float] NULL,
	[P11] [float] NULL,
	[P12] [float] NULL,
	[P13] [float] NULL,
	[P14] [float] NULL,
	[P15] [float] NULL,
	[P16] [float] NULL,
	[P17] [float] NULL,
	[P18] [float] NULL,
	[P19] [float] NULL,
	[P20] [float] NULL,
	[P21] [float] NULL,
	[P22] [float] NULL,
	[P23] [float] NULL,
	[P24] [float] NULL,
	[P25] [float] NULL,
	[P26] [float] NULL,
	[P27] [float] NULL,
	[P28] [float] NULL,
	[P29] [float] NULL,
	[P30] [float] NULL,
	[P31] [float] NULL,
	[P32] [float] NULL,
	[P33] [float] NULL,
	[P34] [float] NULL,
	[P35] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductionStarts]    Script Date: 6/21/2017 11:50:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductionStarts](
	[PUN] [char](17) NULL,
	[PeriodStartHash] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  StoredProcedure [dbo].[LoadNormalProduction]    Script Date: 6/21/2017 11:50:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[LoadNormalProduction]
	@ProductCode CHAR(2)
AS
BEGIN

INSERT INTO NormalProduction
SELECT
	PS.PUN,
	MPS.product_code,
	PS.PeriodStartHash,
	MPS.FirstDateHash AS MaxProdDateHash,
	MPS.LastDateHash,
	MPS.MaxVolume,
	(SELECT TOP 1 SumVolume/MPS.MaxVolume FROM MonthlyProduction WHERE PUN=PS.PUN AND ReportingDateHash=PS.PeriodStartHash AND product_code=MPS.product_code ) AS P0,
	(SELECT TOP 1 SumVolume/MPS.MaxVolume FROM MonthlyProduction WHERE PUN=PS.PUN AND ReportingDateHash=PS.PeriodStartHash + 1 AND product_code=MPS.product_code ) AS P1,
	(SELECT TOP 1 SumVolume/MPS.MaxVolume FROM MonthlyProduction WHERE PUN=PS.PUN AND ReportingDateHash=PS.PeriodStartHash + 2 AND product_code=MPS.product_code ) AS P2,
	(SELECT TOP 1 SumVolume/MPS.MaxVolume FROM MonthlyProduction WHERE PUN=PS.PUN AND ReportingDateHash=PS.PeriodStartHash + 3 AND product_code=MPS.product_code ) AS P3,
	(SELECT TOP 1 SumVolume/MPS.MaxVolume FROM MonthlyProduction WHERE PUN=PS.PUN AND ReportingDateHash=PS.PeriodStartHash + 4 AND product_code=MPS.product_code ) AS P4,
	(SELECT TOP 1 SumVolume/MPS.MaxVolume FROM MonthlyProduction WHERE PUN=PS.PUN AND ReportingDateHash=PS.PeriodStartHash + 5 AND product_code=MPS.product_code ) AS P5,
	(SELECT TOP 1 SumVolume/MPS.MaxVolume FROM MonthlyProduction WHERE PUN=PS.PUN AND ReportingDateHash=PS.PeriodStartHash + 6 AND product_code=MPS.product_code ) AS P6,
	(SELECT TOP 1 SumVolume/MPS.MaxVolume FROM MonthlyProduction WHERE PUN=PS.PUN AND ReportingDateHash=PS.PeriodStartHash + 7 AND product_code=MPS.product_code ) AS P7,
	(SELECT TOP 1 SumVolume/MPS.MaxVolume FROM MonthlyProduction WHERE PUN=PS.PUN AND ReportingDateHash=PS.PeriodStartHash + 8 AND product_code=MPS.product_code ) AS P8,
	(SELECT TOP 1 SumVolume/MPS.MaxVolume FROM MonthlyProduction WHERE PUN=PS.PUN AND ReportingDateHash=PS.PeriodStartHash + 9 AND product_code=MPS.product_code ) AS P9,
	(SELECT TOP 1 SumVolume/MPS.MaxVolume FROM MonthlyProduction WHERE PUN=PS.PUN AND ReportingDateHash=PS.PeriodStartHash + 10 AND product_code=MPS.product_code ) AS P10,
	(SELECT TOP 1 SumVolume/MPS.MaxVolume FROM MonthlyProduction WHERE PUN=PS.PUN AND ReportingDateHash=PS.PeriodStartHash + 11 AND product_code=MPS.product_code ) AS P11,
	(SELECT TOP 1 SumVolume/MPS.MaxVolume FROM MonthlyProduction WHERE PUN=PS.PUN AND ReportingDateHash=PS.PeriodStartHash + 12 AND product_code=MPS.product_code ) AS P12,
	(SELECT TOP 1 SumVolume/MPS.MaxVolume FROM MonthlyProduction WHERE PUN=PS.PUN AND ReportingDateHash=PS.PeriodStartHash + 13 AND product_code=MPS.product_code ) AS P13,
	(SELECT TOP 1 SumVolume/MPS.MaxVolume FROM MonthlyProduction WHERE PUN=PS.PUN AND ReportingDateHash=PS.PeriodStartHash + 14 AND product_code=MPS.product_code ) AS P14,
	(SELECT TOP 1 SumVolume/MPS.MaxVolume FROM MonthlyProduction WHERE PUN=PS.PUN AND ReportingDateHash=PS.PeriodStartHash + 15 AND product_code=MPS.product_code ) AS P15,
	(SELECT TOP 1 SumVolume/MPS.MaxVolume FROM MonthlyProduction WHERE PUN=PS.PUN AND ReportingDateHash=PS.PeriodStartHash + 16 AND product_code=MPS.product_code ) AS P16,
	(SELECT TOP 1 SumVolume/MPS.MaxVolume FROM MonthlyProduction WHERE PUN=PS.PUN AND ReportingDateHash=PS.PeriodStartHash + 17 AND product_code=MPS.product_code ) AS P17,
	(SELECT TOP 1 SumVolume/MPS.MaxVolume FROM MonthlyProduction WHERE PUN=PS.PUN AND ReportingDateHash=PS.PeriodStartHash + 18 AND product_code=MPS.product_code ) AS P18,
	(SELECT TOP 1 SumVolume/MPS.MaxVolume FROM MonthlyProduction WHERE PUN=PS.PUN AND ReportingDateHash=PS.PeriodStartHash + 19 AND product_code=MPS.product_code ) AS P19,
	(SELECT TOP 1 SumVolume/MPS.MaxVolume FROM MonthlyProduction WHERE PUN=PS.PUN AND ReportingDateHash=PS.PeriodStartHash + 20 AND product_code=MPS.product_code ) AS P20,
	(SELECT TOP 1 SumVolume/MPS.MaxVolume FROM MonthlyProduction WHERE PUN=PS.PUN AND ReportingDateHash=PS.PeriodStartHash + 21 AND product_code=MPS.product_code ) AS P21,
	(SELECT TOP 1 SumVolume/MPS.MaxVolume FROM MonthlyProduction WHERE PUN=PS.PUN AND ReportingDateHash=PS.PeriodStartHash + 22 AND product_code=MPS.product_code ) AS P22,
	(SELECT TOP 1 SumVolume/MPS.MaxVolume FROM MonthlyProduction WHERE PUN=PS.PUN AND ReportingDateHash=PS.PeriodStartHash + 23 AND product_code=MPS.product_code ) AS P23,
	(SELECT TOP 1 SumVolume/MPS.MaxVolume FROM MonthlyProduction WHERE PUN=PS.PUN AND ReportingDateHash=PS.PeriodStartHash + 24 AND product_code=MPS.product_code ) AS P24,
	(SELECT TOP 1 SumVolume/MPS.MaxVolume FROM MonthlyProduction WHERE PUN=PS.PUN AND ReportingDateHash=PS.PeriodStartHash + 25 AND product_code=MPS.product_code ) AS P25,
	(SELECT TOP 1 SumVolume/MPS.MaxVolume FROM MonthlyProduction WHERE PUN=PS.PUN AND ReportingDateHash=PS.PeriodStartHash + 26 AND product_code=MPS.product_code ) AS P26,
	(SELECT TOP 1 SumVolume/MPS.MaxVolume FROM MonthlyProduction WHERE PUN=PS.PUN AND ReportingDateHash=PS.PeriodStartHash + 27 AND product_code=MPS.product_code ) AS P27,
	(SELECT TOP 1 SumVolume/MPS.MaxVolume FROM MonthlyProduction WHERE PUN=PS.PUN AND ReportingDateHash=PS.PeriodStartHash + 28 AND product_code=MPS.product_code ) AS P28,
	(SELECT TOP 1 SumVolume/MPS.MaxVolume FROM MonthlyProduction WHERE PUN=PS.PUN AND ReportingDateHash=PS.PeriodStartHash + 29 AND product_code=MPS.product_code ) AS P29,
	(SELECT TOP 1 SumVolume/MPS.MaxVolume FROM MonthlyProduction WHERE PUN=PS.PUN AND ReportingDateHash=PS.PeriodStartHash + 30 AND product_code=MPS.product_code ) AS P30,
	(SELECT TOP 1 SumVolume/MPS.MaxVolume FROM MonthlyProduction WHERE PUN=PS.PUN AND ReportingDateHash=PS.PeriodStartHash + 31 AND product_code=MPS.product_code ) AS P31,
	(SELECT TOP 1 SumVolume/MPS.MaxVolume FROM MonthlyProduction WHERE PUN=PS.PUN AND ReportingDateHash=PS.PeriodStartHash + 32 AND product_code=MPS.product_code ) AS P32,
	(SELECT TOP 1 SumVolume/MPS.MaxVolume FROM MonthlyProduction WHERE PUN=PS.PUN AND ReportingDateHash=PS.PeriodStartHash + 33 AND product_code=MPS.product_code ) AS P33,
	(SELECT TOP 1 SumVolume/MPS.MaxVolume FROM MonthlyProduction WHERE PUN=PS.PUN AND ReportingDateHash=PS.PeriodStartHash + 34 AND product_code=MPS.product_code ) AS P34,
	(SELECT TOP 1 SumVolume/MPS.MaxVolume FROM MonthlyProduction WHERE PUN=PS.PUN AND ReportingDateHash=PS.PeriodStartHash + 35 AND product_code=MPS.product_code ) AS P35
FROM
	ProductionStarts PS INNER JOIN MonthlyProductionSummary MPS ON (PS.PUN=MPS.PUN)
WHERE 
	PS.PeriodStartHash >= 2014*12 + 1
	AND MPS.product_code=@ProductCode
	AND MPS.MaxVolume > 0

END

GO
/****** Object:  StoredProcedure [dbo].[ProcessFromDTOs]    Script Date: 6/21/2017 11:50:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ProcessFromDTOs]
AS
BEGIN

-- aggregate all monthly production by PUN, date, product, and report type
-- do not care about potentially double counting companies b/c we will normalize the final data set anyways

TRUNCATE TABLE MonthlyProduction

INSERT INTO MonthlyProduction 
(
	ReportingMonth ,ReportingYear ,ReportingDateHash ,product_code ,report_type_code ,PUN ,SumVolume
)
SELECT
	 CAST(reporting_month AS INT) AS ReportingMonth
    ,CAST(reporting_year AS INT) AS ReportingYear
	,CAST(reporting_month AS INT) - 1 + 12*CAST(reporting_year AS INT) AS ReportingDateHash
    ,product_code
    ,report_type_code
    ,pun_county_num + '-' + pun_lease_num + '-' + pun_sub_num + '-' + pun_merge_num AS PUN
    ,SUM(CASE WHEN gross_volume < 0 THEN 0 ELSE gross_volume END) AS SumGrossVolume
FROM exp_gph_reports_36
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


INSERT INTO MonthlyProduction 
(
	ReportingMonth ,ReportingYear ,ReportingDateHash ,product_code ,report_type_code ,PUN ,SumVolume
)
SELECT
	 CAST(reporting_month AS INT) AS ReportingMonth
    ,CAST(reporting_year AS INT) AS ReportingYear
	,CAST(reporting_month AS INT) - 1 + 12*CAST(reporting_year AS INT) AS ReportingDateHash
    ,product_code
    ,report_type_code
    ,pun_county_num + '-' + pun_lease_num + '-' + pun_sub_num + '-' + pun_merge_num AS PUN
    ,SUM(CASE WHEN gross_volume < 0 THEN 0 ELSE gross_volume END) AS SumGrossVolume
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

-- Store some metadata to make analysis easiers.  For each (PUN, product_code) combination, determine starting and ending points

TRUNCATE TABLE MonthlyProductionSummary

INSERT INTO MonthlyProductionSummary
( 
	PUN, product_code, MaxVolume, FirstDateHash, LastDateHash
)
SELECT DISTINCT FirstMP.PUN, FirstMP.product_code, FirstMP.MaxVolume, FirstMP.MinDateHash, LastMP.MaxDateHash
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

-- Determine the earliest date of production for each well from exp_gpqtrat

TRUNCATE TABLE ProductionStarts

INSERT INTO ProductionStarts (PUN, PeriodStartHash)
SELECT PUN, Min(PeriodStartHash) AS MinPeriodStartHash
FROM
(
	SELECT
		pun_county_num + '-' + pun_lease_num + '-' + pun_sub_num + '-' + pun_merge_num AS PUN,
		CAST(RIGHT(LEFT(period_start_date_text,7), 2) AS INT) - 1 + 12*CAST(LEFT(period_start_date_text,4) AS INT) AS PeriodStartHash
	FROM [OTC].[dbo].[exp_gpqtrat]
	WHERE period_start_date_text IS NOT NULL
) AS T
GROUP BY PUN

-- Load normalized well production data for horizontal wells started on or later than Feb 2014 into the NormalProduction table

TRUNCATE TABLE NormalProduction

EXEC LoadNormalProduction @ProductCode = '01'
EXEC LoadNormalProduction @ProductCode = '05'
EXEC LoadNormalProduction @ProductCode = '06'

END

GO
/****** Object:  StoredProcedure [dbo].[SelectAllCurves]    Script Date: 6/21/2017 11:50:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SelectAllCurves]
AS
BEGIN

SELECT 
	ProductCode,
	CASE ProductCode
		WHEN '01' THEN 'Oil'
		WHEN '05' THEN 'Gas'
		WHEN '06' THEN 'Liquids'
		ELSE 'Other'
	END AS Product,
	AVG([P0]) AS Month_0,
	AVG([P1]) AS Month_1,
	AVG([P2]) AS Month_2,
	AVG([P3]) AS Month_3,
	AVG([P4]) AS Month_4,
	AVG([P5]) AS Month_5,
	AVG([P6]) AS Month_6,
	AVG([P7]) AS Month_7,
	AVG([P8]) AS Month_8,
	AVG([P9]) AS Month_9,
	AVG([P10]) AS Month_10,
	AVG([P11]) AS Month_11,
	AVG([P12]) AS Month_12,
	AVG([P13]) AS Month_13,
	AVG([P14]) AS Month_14,
	AVG([P15]) AS Month_15,
	AVG([P16]) AS Month_16,
	AVG([P17]) AS Month_17,
	AVG([P18]) AS Month_18,
	AVG([P19]) AS Month_19,
	AVG([P20]) AS Month_20,
	AVG([P21]) AS Month_21,
	AVG([P22]) AS Month_22,
	AVG([P23]) AS Month_23,
	AVG([P24]) AS Month_24,
	AVG([P25]) AS Month_25,
	AVG([P26]) AS Month_26,
	AVG([P27]) AS Month_27,
	AVG([P28]) AS Month_28,
	AVG([P29]) AS Month_29,
	AVG([P30]) AS Month_30,
	AVG([P31]) AS Month_31,
	AVG([P32]) AS Month_32,
	AVG([P33]) AS Month_33,
	AVG([P34]) AS Month_34,
	AVG([P35]) AS Month_35
FROM 
	NormalProduction
GROUP BY
	ProductCode

END

GO
/****** Object:  StoredProcedure [dbo].[SelectCurve]    Script Date: 6/21/2017 11:50:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SelectCurve]
	@ProductCode CHAR(2)
AS
BEGIN

SELECT 
	ProductCode,
	AVG([P0]) AS Month_0,
	AVG([P1]) AS Month_1,
	AVG([P2]) AS Month_2,
	AVG([P3]) AS Month_3,
	AVG([P4]) AS Month_4,
	AVG([P5]) AS Month_5,
	AVG([P6]) AS Month_6,
	AVG([P7]) AS Month_7,
	AVG([P8]) AS Month_8,
	AVG([P9]) AS Month_9,
	AVG([P10]) AS Month_10,
	AVG([P11]) AS Month_11,
	AVG([P12]) AS Month_12,
	AVG([P13]) AS Month_13,
	AVG([P14]) AS Month_14,
	AVG([P15]) AS Month_15,
	AVG([P16]) AS Month_16,
	AVG([P17]) AS Month_17,
	AVG([P18]) AS Month_18,
	AVG([P19]) AS Month_19,
	AVG([P20]) AS Month_20,
	AVG([P21]) AS Month_21,
	AVG([P22]) AS Month_22,
	AVG([P23]) AS Month_23
FROM 
	NormalProduction
WHERE
	ProductCode=@ProductCode
GROUP BY
	ProductCode

END

GO
/****** Object:  StoredProcedure [dbo].[Set_exp_gpqtrat_Dates]    Script Date: 6/21/2017 11:50:33 PM ******/
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

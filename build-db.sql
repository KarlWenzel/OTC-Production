USE [OTC]
GO
/****** Object:  Table [dbo].[exp_gpexempt]    Script Date: 6/12/2017 8:29:58 AM ******/
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
/****** Object:  Table [dbo].[exp_gph_reports_12]    Script Date: 6/12/2017 8:29:58 AM ******/
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
/****** Object:  Table [dbo].[exp_gph_reports_36]    Script Date: 6/12/2017 8:29:58 AM ******/
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
/****** Object:  Table [dbo].[exp_gplease]    Script Date: 6/12/2017 8:29:58 AM ******/
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
/****** Object:  Table [dbo].[exp_gpoper]    Script Date: 6/12/2017 8:29:58 AM ******/
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
/****** Object:  Table [dbo].[exp_gpqtrat]    Script Date: 6/12/2017 8:29:58 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Set_exp_gpqtrat_Dates]    Script Date: 6/12/2017 8:29:58 AM ******/
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

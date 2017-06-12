SELECT TOP 1000 
	 company_name
	,company_number
    ,reporting_month
    ,reporting_year
    ,tax_type_code
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
	 company_name
	,company_number
	,reporting_month
	,reporting_year
	,tax_type_code
	,product_code
	,report_type_code
	,pun_county_num + '-' + pun_lease_num + '-' + pun_sub_num + '-' + pun_merge_num


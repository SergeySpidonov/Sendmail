select
	trunc(target_date, 'mon') as MONTH,
	SUM(price_zone_code) as price_zone_code,
	SUM(hour) as hour,
	SUM(source_type) as source_type,
	SUM(fact) as fact,
	count(*) as count_rows
from
	dm_vslg.import_sdd sdd
GROUP BY 1
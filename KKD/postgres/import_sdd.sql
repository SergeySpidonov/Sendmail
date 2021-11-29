select
	date_trunc('mon', target_date)::DATE as MONTH,
	SUM(price_zone_code) as price_zone_code,
	SUM(hour) as hour,
	SUM(source_type) as source_type,
	SUM(fact) as fact,
	count(*) as count_rows
from
	graph.import_sdd sdd
GROUP BY 1
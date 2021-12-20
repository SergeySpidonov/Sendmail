select
	date_trunc('mon', target_date)::DATE as MONTH,
	SUM(hour) as hour,
	SUM(value) as value,
	count(*) as count_rows
from
	graph.wh_dlh_region_price_hourly_tr wdrpht
group by 1
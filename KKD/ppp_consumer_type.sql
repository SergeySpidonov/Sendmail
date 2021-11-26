select
	DATE_TRUNC('mon', target_date) as month,
	SUM(price_zone_code) as price_zone_code,
	SUM(hour) as hour,
	SUM(is_gs) as is_gs,
	SUM(ppp) as ppp,
	count(*) as count_rows
from
	graph.ppp_consumer_type pct
group by 1

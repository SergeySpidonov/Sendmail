select
	trunc(target_date, 'mon') as month,
	SUM(price_zone_code) as price_zone_code,
	SUM(hour) as hour,
	SUM(is_gs) as is_gs,
	SUM(ppp) as ppp,
	count(*) as count_rows
from
	dm_vslg.ppp_consumer_type pct
group by 1

select
	date_trunc('mon', target_date) as MONTH,
	SUM(pz) as pz,
	SUM(hour) as hour,
	SUM(direction) as direction,
	SUM(id) as id,
	SUM(volume) as volume,
	count(*) as count_rows
from
	graph.pz_date_hour_bids pdhb
group by 1
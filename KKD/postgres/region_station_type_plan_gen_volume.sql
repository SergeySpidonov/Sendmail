select
	date_trunc('mon', target_date) as MONTH,
	SUM(hour) as hour,
	SUM(station_type) as station_type,
	SUM(vg_ppp) as vg_ppp,
	count(*) as count_rows
from
	graph.region_station_type_plan_gen_volume rstpgv
group by 1
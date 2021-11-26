select
	date_trunc('mon', target_date) as MONTH,
	SUM(price_zone_mask) AS price_zone_mask,
	SUM(hour) AS hour,
	SUM(station_type) AS station_type,
	SUM(vg_ppp) AS vg_ppp,
	count(*) as count_rows
from
	graph.pz_station_type_plan_gen_volume pstpgv
group by 1
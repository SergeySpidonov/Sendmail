select
	DATE_TRUNC('mon', target_date)::DATE AS MONTH,
	SUM(hour) as hour,
	SUM(station_type) as station_type,
	SUM(vg_ppp) as vg_ppp,
	count(*) as count_rows
from
	zsp_station_type_plan_gen_volume zstpgv
group by 1
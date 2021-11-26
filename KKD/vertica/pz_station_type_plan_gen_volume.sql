select
	trunc(target_date, 'mon') as MONTH,
	SUM(price_zone_mask) AS price_zone_mask,
	SUM(hour) AS hour,
	SUM(station_type) AS station_type,
	SUM(vg_ppp) AS vg_ppp,
	count(*) as count_rows
from
	dm_vslg.pz_station_type_plan_gen_volume pstpgv
group by 1
select
	date_trunc('mon', target_date)::DATE as month,
	STRING_AGG(region_pk_fk, ',') as region_pk_fk,
	SUM(hour) as hour,
	SUM(is_peak_hour) as is_peak_hour,
	SUM(vol_con_power) as vol_con_power,
	count(*) as count_rows
from
	(select * from graph.region_date_hour rd order by 1,2)a
group by 1
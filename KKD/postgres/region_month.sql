select
	target_month as MONTH,
	STRING_AGG(region_pk_fk, ',') as region_pk_fk,
	SUM(vol_power_peak_unreg) AS vol_power_peak_unreg,
	SUM(vol_power_peak_full) AS vol_power_peak_full,
	count(*) as count_rows
from
	(select * from graph.REGION_MONTH rd order by 2,1)a
group by 1
select
	DATE_TRUNC('mon', target_date)::DATE AS MONTH,
	SUM(ips_pk_fk) as ips_pk_fk,
	SUM(hour) as hour,
	SUM(value) as value,
	count(*) as count_rows
from
	graph.wh_dlh_oes_stats_hourly_tr wdosht
group by 1
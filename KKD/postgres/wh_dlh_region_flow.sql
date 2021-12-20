select
	date_trunc('mon', target_date)::DATE as MONTH,
	SUM(hour) as hour,
	SUM(power_flow) as power_flow,
	count(*) as count_rows
from
	graph.wh_dlh_region_flow wdrf
group by 1
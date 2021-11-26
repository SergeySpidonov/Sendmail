select
	date_trunc('mon', target_date) AS MONTH,
	SUM(COALESCE(pz_pk,0)) as pz_pk,
	SUM(COALESCE(prc_con_plan,0)) as prc_con_plan,
	SUM(COALESCE(prc_con_plan_min,0)) as prc_con_plan_min,
	SUM(COALESCE(prc_con_plan_max,0)) as prc_con_plan_max,
	SUM(COALESCE(prc_3days_avg,0)) as prc_3days_avg,
	SUM(COALESCE(prc_7days_avg,0)) as prc_7days_avg,
	SUM(COALESCE(max_growth_rate_3days,0)) as max_growth_rate_3days,
	SUM(COALESCE(max_growth_rate_7days,0)) as max_growth_rate_7days,
	SUM(COALESCE(vol_dr,0)) as vol_dr,
	SUM(COALESCE(vol_dr_aggregator,0)) as vol_dr_aggregator,
	SUM(COALESCE(growth_rate_3days,0)) as growth_rate_3days,
	SUM(COALESCE(growth_rate_7days,0)) as growth_rate_7days,
	SUM(COALESCE(max_hour_dr,0)) as max_hour_dr,
	SUM(COALESCE(vol_dr_aggregator_2hours,0)) as vol_dr_aggregator_2hours,
	SUM(COALESCE(vol_dr_aggregator_4hours,0)) as vol_dr_aggregator_4hours,
	SUM(COALESCE(prc_con_plan_month,0)) as prc_con_plan_month,
	SUM(COALESCE(prc_con_plan_prev_month,0)) as prc_con_plan_prev_month,
	SUM(COALESCE(prc_con_plan_year,0)) as prc_con_plan_year,
	SUM(COALESCE(prc_con_plan_prev_year,0)) as prc_con_plan_prev_year,
	count(*) as count_rows
from
	graph.pz_date pd
group by 1
order by 1
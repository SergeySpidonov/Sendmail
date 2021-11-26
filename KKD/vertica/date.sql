select
	trunc(target_date, 'mon') as MONTH,
	SUM(amt_dr_effect) as amt_dr_effect,
	SUM(amt_dr_effect_limit) as amt_dr_effect_limit,
	SUM(is_dr_applied) as is_dr_applied,
	SUM(k_dr_effect) as k_dr_effect,
	SUM(workdays_dr_count) as workdays_dr_count,
	count(*) as count_rows
from
	dm_vslg."date" d
group by 1
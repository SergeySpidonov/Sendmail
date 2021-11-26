select
	trunc(target_date, 'mon') as MONTH,
	STRING_AGG(region_pk_fk, '|') as region_pk_fk,
	SUM(max_cons_hour_fact) as max_cons_hour_fact,
	count(*) as count_rows
from
	(select * from dm_vslg.region_date rd order by 1,2)a
group by 1
select
	trunc(target_date, 'mon') as MONTH,
	STRING_AGG(region_pk_fk, '|') as region_pk_fk,
	SUM(price_con_plan) AS price_con_plan,
	count(*) as count_rows
from
	(select * from dm_vslg.region_date_price rd order by 1,2)a
group by 1

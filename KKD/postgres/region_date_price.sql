select
	date_trunc('mon', target_date)::DATE as month,
	STRING_AGG(region_pk_fk, ',') as region_pk_fk,
	SUM(price_con_plan) AS price_con_plan,
	count(*) as count_rows
from
	(select * from graph.region_date_price rd order by 1,2)a
group by 1

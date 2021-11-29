select
	date_trunc('mon', target_date)::DATE as month,
	STRING_AGG(region_pk_fk, '|') as region_pk_fk,
	SUM(max_cons_hour_fact) as max_cons_hour_fact,
	count(*) as count_rows
from
	(select * from graph.region_date rd order by 1,2)a
group by 1
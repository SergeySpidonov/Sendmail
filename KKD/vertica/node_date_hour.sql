select
	trunc(target_date, 'mon') as MONTH,
	SUM(node_pk_fk) as node_pk_fk,
	SUM("hour") as hour,
	sum(opf_v_nominal) as opf_v_nominal,
	SUM(opf_dam_lmp_final) as opf_dam_lmp_final,
	count(*) as count_rows
from
	dm_vslg.node_date_hour ndh
group by 1
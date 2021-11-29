select
	date_trunc('mon', target_date)::DATE as month,
	SUM(node_pk_fk) as node_pk_fk,
	SUM("hour") as hour,
	sum(opf_v_nominal) as opf_v_nominal,
	SUM(opf_dam_lmp_final) as opf_dam_lmp_final,
	count(*) as count_rows
from
	graph.node_date_hour ndh
group by 1
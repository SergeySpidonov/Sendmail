select
	DATE_TRUNC('mon', target_date)::DATE AS MONTH,
	SUM(section_pk_fk) as section_pk_fk,
	SUM(node1_pk_fk) as node1_pk_fk,
	SUM(node2_pk_fk) as node2_pk_fk,
	SUM(hour) as hour,
	SUM(psmin_dam) as psmin_dam,
	SUM(psmax_dam) as psmax_dam,
	SUM(ps_dam) as ps_dam,
	count(*) as count_rows
from
	graph.section_node1_node2_date_hour snndh
group by 1
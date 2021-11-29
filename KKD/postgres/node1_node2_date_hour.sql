select
	date_trunc('mon', target_date)::DATE as month,
	SUM(node1_pk_fk) as node1_pk_fk,
	SUM(node2_pk_fk) as node2_pk_fk,
	SUM(hour) as hour,
	SUM(pflow_from_n1) as pflow_from_n1,
	count(*) as count_rows
from
	graph.node1_node2_date_hour nndh
GROUP BY 1
select
	DATE_TRUNC('mon', target_date),
	SUM(node1_pk_fk) as node1_pk_fk,
	SUM(node2_pk_fk) as node2_pk_fk,
	SUM(hour) as hour,
	SUM(pflow_from_n1) as pflow_from_n1,
	count(*) as count_rows
from
	node1_node2_date_hour nndh
GROUP BY 1
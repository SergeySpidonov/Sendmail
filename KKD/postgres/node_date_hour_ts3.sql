SELECT
	date_trunc('mon', target_date )::DATE AS MONTH,
	SUM(HOUR) as hour,
	SUM(NODE_PK) as node_pk_fk,
	SUM(OPF_DAM_LMP_FINAL) as opf_dam_lmp_final,
	count(*) as count_rows
FROM
	graph.node_date_hour_ts3 ndh
where
	target_date >= '2017-01-01'
	and OPF_DAM_LMP_FINAL is not null
GROUP BY 1
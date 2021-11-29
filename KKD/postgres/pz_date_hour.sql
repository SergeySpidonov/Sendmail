select
	date_trunc('mon', target_date)::DATE as month,
	SUM(pz) as pz,
	SUM(hour) as hour,
	SUM(vol_pbr) as vol_pbr,
	SUM(vol_iv1_plus) as vol_iv1_plus,
	SUM(vol_iv1_minus) as vol_iv1_minus,
	SUM(vol_iv0_plus) as vol_iv0_plus,
	SUM(vol_iv0_minus) as vol_iv0_minus,
	SUM(vol_iva_plus) as vol_iva_plus,
	SUM(vol_iva_minus) as vol_iva_minus,
	SUM(vol_ivr) as vol_ivr,
	SUM(tg) as tg,
	SUM(price_rsv) as price_rsv,
	SUM(pbr) as pbr,
	SUM(price_br) as price_br,
	count(*) as count_rows
from
	graph.pz_date_hour pdha
group by 1
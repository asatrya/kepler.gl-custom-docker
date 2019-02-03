SELECT row_to_json(fc)
FROM 
(
	SELECT 
		'FeatureCollection' AS TYPE, 
		array_to_json(array_agg(f)) AS features
	FROM 
	(
		(
			SELECT 
				'Feature' AS TYPE, 
				ST_AsGeoJSON(lg.kelurahan_polygon, 4):: JSON AS geometry,
				row_to_json
				(
					(
						SELECT l
						FROM 
						(
							select
							prov_bps_nama,
							kokab_bps_nama,
							kecamatan_bps_nama,
							kelurahan_bps_kode, 
							kelurahan_bps_nama
						) AS l
					)
				) AS properties
			FROM v_wiladm_consolidated as lg
--			where lg.kelurahan_bps_nama like '%ANTAPANI%' 
		)
	) AS f
) AS fc;
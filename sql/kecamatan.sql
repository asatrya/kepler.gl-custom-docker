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
				ST_AsGeoJSON(lg.polygon, 4):: JSON AS geometry,
				row_to_json
				(
					(
						SELECT l
						FROM 
						(
							select distinct
							provinsi.bps_nama as prov_bps_nama,
							kokab.bps_nama as kokab_bps_nama,
							lg.bps_kode as kecamatan_bps_kode,
							lg.bps_nama as kecamatan_bps_nama
						) AS l
					)
				) AS properties
			FROM kecamatan as lg
			left join kokab on kokab.id = lg.id_kokab
			left join provinsi on provinsi.id = kokab.id_provinsi
		)
	) AS f
) AS fc;
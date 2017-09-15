 select (select 'chromosomes' from dual) as entity, (select '40' from dual) as totalTeoricoRecomendado, r.usuarioID as usuario, count(*) as totalResposta, sum(r.votosPositivos) as somaUp, sum(r.votosNegativos) as somaDown from resposta r where r.perguntaID in ( 	 	select p.id from pergunta p  		inner join anotacoes a on p.id = a.id_text 		inner join entidades e on e.id = a.id_entidade 	where  (a.tipo = 'titulo_pergunta' or a.tipo = 'texto_pergunta') 		and lower(e.surface) = lower('chromosomes') 		and p.id like '1_%' 	 	)  and r.usuarioID in ( 		'1_1590','1_307','1_86','1_3615','1_3776','1_4108','1_806','1_740','1_3059','1_3632','1_3340','1_4101','1_112','1_4168','1_444','1_115','1_5144','1_231','1_5148','1_4579','1_3971','1_1320','1_1306','1_5754','1_5694','1_1757','1_69','1_430','1_1231','1_1122','1_28','1_166','1_560','1_2938','1_43','1_535','1_948','1_3053','1_1441','1_4177' 	 	) group by r.usuarioID order by 2 desc
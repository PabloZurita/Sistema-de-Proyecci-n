namespace :calcular_indicador do
  desc "TODO"
  task consultar_task: :environment do
  	#puts "Exito"

	#### Calculando indicadores ####
	## aqui get fecha de lo que se desea actualizar en relacion a los indicadores
	#fecha = '2016/10/06';
	fechas = ['2016/10/01','2016/10/02','2016/10/03','2016/10/04','2016/10/05','2016/10/06','2016/10/07','2016/10/08'];
	mes_completo = ['2016/10/01','2016/10/02','2016/10/03','2016/10/04','2016/10/05','2016/10/06','2016/10/07','2016/10/08',
	 	'2016/10/09','2016/10/10','2016/10/11','2016/10/12','2016/10/13','2016/10/14','2016/10/15','2016/10/16',
	 	'2016/10/17','2016/10/18','2016/10/19','2016/10/20','2016/10/21','2016/10/22','2016/10/23','2016/10/24',
	 	'2016/10/25','2016/10/26','2016/10/27','2016/10/28','2016/10/29','2016/10/30','2016/10/31',
	 	'2016/11/01','2016/11/02','2016/11/03','2016/11/04','2016/11/05','2016/11/06','2016/11/07','2016/11/08',
	 	'2016/11/09','2016/11/10','2016/11/11','2016/11/12','2016/11/13','2016/11/14','2016/11/15','2016/11/16',
	 	'2016/11/17','2016/11/18','2016/11/19','2016/11/20','2016/11/21','2016/11/22','2016/11/23','2016/11/24',
	 	'2016/11/25','2016/11/26','2016/11/27','2016/11/28','2016/11/29','2016/11/30',
	 	'2016/08/01','2016/08/02','2016/08/03','2016/08/04','2016/08/05','2016/08/06','2016/08/07','2016/08/08',
	 	'2016/08/09','2016/08/10','2016/08/11','2016/08/12','2016/08/13','2016/08/14','2016/08/15','2016/08/16',
	 	'2016/08/17','2016/08/18','2016/08/19','2016/08/20','2016/08/21','2016/08/22','2016/08/23','2016/08/24',
	 	'2016/08/25','2016/08/26','2016/08/27','2016/08/28','2016/08/29','2016/08/30','2016/08/31',
	 	'2016/09/01','2016/09/02','2016/09/03','2016/09/04','2016/09/05','2016/09/06','2016/09/07','2016/09/08',
	 	'2016/09/09','2016/09/10','2016/09/11','2016/09/12','2016/09/13','2016/09/14','2016/09/15','2016/09/16',
	 	'2016/09/17','2016/09/18','2016/09/19','2016/09/20','2016/09/21','2016/09/22','2016/09/23','2016/09/24',
	 	'2016/09/25','2016/09/26','2016/09/27','2016/09/28','2016/09/29','2016/09/30', 
	 	'2016/12/01','2016/12/02','2016/12/03','2016/12/04']


for dia in 0..2 #BORRAR
	puts fecha = mes_completo[dia]
	for i in 1..4
		if i > 1 then
			id_segmento = i
		else
			id_segmento = [i,5]
		end

		if i < 4 then
			id_fijomovil = [2,3]
		else
			id_fijomovil = 1
		end
		encuestados_a_la_fecha = Encuestum.where(fecha_creacion_encuesta: fecha).where(linea_id: Linea.where(fijomovil_id: id_fijomovil).where(contrato_id: id_segmento).where(segmento_id: 1));
		
		cantidad = encuestados_a_la_fecha.length()
		resolucion_positiva = Encuestum.where(fecha_creacion_encuesta: fecha).where(resuelto_encuesta: 1).where(linea_id: Linea.where(fijomovil_id: id_fijomovil).where(contrato_id: id_segmento).where(segmento_id: 1));
		resolucion_negativa = Encuestum.where(fecha_creacion_encuesta: fecha).where(resuelto_encuesta: 0).where(linea_id: Linea.where(fijomovil_id: id_fijomovil).where(contrato_id: id_segmento).where(segmento_id: 1));

		## 		Calculando preguntas 1 y 2	para segmento	##
		pre_1 = Respuestum.where(preguntum_id: 1).where(valor_pregunta: 1).where(encuestum_id: encuestados_a_la_fecha)
		pre_2 = Respuestum.where(preguntum_id: 1).where(valor_pregunta: 2).where(encuestum_id: encuestados_a_la_fecha)
		pre_4 = Respuestum.where(preguntum_id: 1).where(valor_pregunta: 4).where(encuestum_id: encuestados_a_la_fecha)
		pre_5 = Respuestum.where(preguntum_id: 1).where(valor_pregunta: 5).where(encuestum_id: encuestados_a_la_fecha)




		cantidad_pos = resolucion_positiva.length()
		cantidad_neg = resolucion_negativa.length()
		cantidad_pre1  = pre_1.length()
		cantidad_pre2  = pre_2.length()
		cantidad_pre4  = pre_4.length()
		cantidad_pre5  = pre_5.length()


		# => calculando isn diario
		satisfechos = cantidad_pre4 + cantidad_pre5
		insatisfechos = cantidad_pre1 + cantidad_pre2
		isn = (100*((satisfechos.to_f - insatisfechos.to_f)/cantidad.to_f)).round(3)
		resolutividad = (100 * cantidad_pos.to_f/(cantidad_pos.to_f+cantidad_neg.to_f)).round(3)

		if Indicadoresdiario.where(fecha: fecha).where(segmento: id_segmento).blank? then
			Indicadoresdiario.create(
				isn: isn,
				resolutividad: resolutividad,
				resp_1_2: insatisfechos,
				resp_4_5: satisfechos,
				fecha: fecha,
				segmento: i
				)
		else
			Indicadoresdiario.where(fecha: fecha).where(segmento: id_segmento).update_all(
				isn: isn,
				resolutividad: resolutividad,
				resp_1_2: insatisfechos,
				resp_4_5: satisfechos
				)
		end

		##    Calculando para atributos para segmentos distintos a pyme

		##  Acceso 2 ;;; rapidez 3 ;;; 4 accesibilidad info ;;; 5 utilidad
		for nro_pregunta in 2..5
			pre_1_atri = Respuestum.where(preguntum_id: nro_pregunta).where(valor_pregunta: 1).where(encuestum_id: encuestados_a_la_fecha)
			pre_2_atri = Respuestum.where(preguntum_id: nro_pregunta).where(valor_pregunta: 2).where(encuestum_id: encuestados_a_la_fecha)
			pre_4_atri = Respuestum.where(preguntum_id: nro_pregunta).where(valor_pregunta: 4).where(encuestum_id: encuestados_a_la_fecha)
			pre_5_atri = Respuestum.where(preguntum_id: nro_pregunta).where(valor_pregunta: 5).where(encuestum_id: encuestados_a_la_fecha)

			cant_pre1_atri  = pre_1_atri.length()
			cant_pre2_atri  = pre_2_atri.length()
			cant_pre4_atri  = pre_4_atri.length()
			cant_pre5_atri  = pre_5_atri.length()

			satis_atri = cant_pre4_atri + cant_pre5_atri
			insatis_atri = cant_pre1_atri + cant_pre2_atri

			valor_atri = (100*((satis_atri.to_f - insatis_atri.to_f)/cantidad.to_f)).round(3)

			if Atributosdiario.where(fecha: fecha).where(segmento: id_segmento).where(pregunta: nro_pregunta).blank? then
				Atributosdiario.create(
					valor: valor_atri,
					fecha: fecha,
					segmento: i,
					pregunta: nro_pregunta
					)
			else
				Atributosdiario.where(fecha: fecha).where(segmento: id_segmento).where(pregunta: nro_pregunta).update_all(
					valor: valor_atri
					)
			end
		end
		################################# ACUMULADO

		encuestados_a_la_fecha = Encuestum.where(fecha_creacion_encuesta: Time.parse(fecha).strftime("%Y-%m-01")..fecha).where(linea_id: Linea.where(fijomovil_id: id_fijomovil).where(contrato_id: id_segmento).where(segmento_id: 1));
		
		cantidad = encuestados_a_la_fecha.length()
		resolucion_positiva = Encuestum.where(fecha_creacion_encuesta: Time.parse(fecha).strftime("%Y-%m-01")..fecha).where(resuelto_encuesta: 1).where(linea_id: Linea.where(fijomovil_id: id_fijomovil).where(contrato_id: id_segmento).where(segmento_id: 1));
		resolucion_negativa = Encuestum.where(fecha_creacion_encuesta: Time.parse(fecha).strftime("%Y-%m-01")..fecha).where(resuelto_encuesta: 0).where(linea_id: Linea.where(fijomovil_id: id_fijomovil).where(contrato_id: id_segmento).where(segmento_id: 1));

		## 		Calculando preguntas 1 y 2	para segmento	##
		pre_1 = Respuestum.where(preguntum_id: 1).where(valor_pregunta: 1).where(encuestum_id: encuestados_a_la_fecha)
		pre_2 = Respuestum.where(preguntum_id: 1).where(valor_pregunta: 2).where(encuestum_id: encuestados_a_la_fecha)
		pre_4 = Respuestum.where(preguntum_id: 1).where(valor_pregunta: 4).where(encuestum_id: encuestados_a_la_fecha)
		pre_5 = Respuestum.where(preguntum_id: 1).where(valor_pregunta: 5).where(encuestum_id: encuestados_a_la_fecha)

		cantidad_pos = resolucion_positiva.length()
		cantidad_neg = resolucion_negativa.length()
		cantidad_pre1  = pre_1.length()
		cantidad_pre2  = pre_2.length()
		cantidad_pre4  = pre_4.length()
		cantidad_pre5  = pre_5.length()

		# => calculando isn diario
		satisfechos = cantidad_pre4 + cantidad_pre5
		insatisfechos = cantidad_pre1 + cantidad_pre2
		isn = (100*((satisfechos.to_f - insatisfechos.to_f)/cantidad.to_f)).round(3)
		resolutividad = (100 * cantidad_pos.to_f/(cantidad_pos.to_f+cantidad_neg.to_f)).round(3)


		if Indicadoresacumulado.where(fecha: fecha).where(segmento: id_segmento).blank? then
			Indicadoresacumulado.create(
				isn: isn,
				resolutividad: resolutividad,
				resp_1_2: insatisfechos,
				resp_4_5: satisfechos,
				fecha: fecha,
				segmento: i
				)
		else
			Indicadoresacumulado.where(fecha: fecha).where(segmento: id_segmento).update_all(
				isn: isn,
				resolutividad: resolutividad,
				resp_1_2: insatisfechos,
				resp_4_5: satisfechos
				)
		end

		##    Calculando para atributos para segmentos distintos a pyme

		##  Acceso 2 ;;; rapidez 3 ;;; 4 accesibilidad info ;;; 5 utilidad
		for nro_pregunta in 2..5
			pre_1_atri = Respuestum.where(preguntum_id: nro_pregunta).where(valor_pregunta: 1).where(encuestum_id: encuestados_a_la_fecha)
			pre_2_atri = Respuestum.where(preguntum_id: nro_pregunta).where(valor_pregunta: 2).where(encuestum_id: encuestados_a_la_fecha)
			pre_4_atri = Respuestum.where(preguntum_id: nro_pregunta).where(valor_pregunta: 4).where(encuestum_id: encuestados_a_la_fecha)
			pre_5_atri = Respuestum.where(preguntum_id: nro_pregunta).where(valor_pregunta: 5).where(encuestum_id: encuestados_a_la_fecha)

			cant_pre1_atri  = pre_1_atri.length()
			cant_pre2_atri  = pre_2_atri.length()
			cant_pre4_atri  = pre_4_atri.length()
			cant_pre5_atri  = pre_5_atri.length()

			satis_atri = cant_pre4_atri + cant_pre5_atri
			insatis_atri = cant_pre1_atri + cant_pre2_atri

			valor_atri = (100*((satis_atri.to_f - insatis_atri.to_f)/cantidad.to_f)).round(3)

			if Atributosacumulado.where(fecha: fecha).where(segmento: id_segmento).where(pregunta: nro_pregunta).blank? then
				Atributosacumulado.create(
					valor: valor_atri,
					fecha: fecha,
					segmento: i,
					pregunta: nro_pregunta
					)
			else
				Atributosacumulado.where(fecha: fecha).where(segmento: id_segmento).where(pregunta: nro_pregunta).update_all(
					valor: valor_atri
					)
			end
		end
	end

	####### PYMES
	for id_segmento in 1..2 # fijo: 1 ; movil: 2 y 3 (3 es de BAM)
		if id_segmento < 2 then
			id_fijomovil = 1
		else
			id_fijomovil = [2,3]
		end
		encuestados_a_la_fecha = Encuestum.where(fecha_creacion_encuesta: Time.parse(2.month.ago.to_s).strftime("%Y-%m-01")..fecha).where(linea_id: Linea.where(fijomovil_id: id_fijomovil).where(segmento_id: 2));
		
		cantidad = encuestados_a_la_fecha.length()
		resolucion_positiva = Encuestum.where(fecha_creacion_encuesta: Time.parse(2.month.ago.to_s).strftime("%Y-%m-01")..fecha).where(resuelto_encuesta: 1).where(linea_id: Linea.where(fijomovil_id: id_fijomovil).where(segmento_id: 2));
		resolucion_negativa = Encuestum.where(fecha_creacion_encuesta: Time.parse(2.month.ago.to_s).strftime("%Y-%m-01")..fecha).where(resuelto_encuesta: 0).where(linea_id: Linea.where(fijomovil_id: id_fijomovil).where(segmento_id: 2));

		## 		Calculando preguntas 1 y 2	para segmento	##
		pre_1 = Respuestum.where(preguntum_id: 1).where(valor_pregunta: 1).where(encuestum_id: encuestados_a_la_fecha)
		pre_2 = Respuestum.where(preguntum_id: 1).where(valor_pregunta: 2).where(encuestum_id: encuestados_a_la_fecha)
		pre_4 = Respuestum.where(preguntum_id: 1).where(valor_pregunta: 4).where(encuestum_id: encuestados_a_la_fecha)
		pre_5 = Respuestum.where(preguntum_id: 1).where(valor_pregunta: 5).where(encuestum_id: encuestados_a_la_fecha)

		cantidad_pos = resolucion_positiva.length()
		cantidad_neg = resolucion_negativa.length()
		cantidad_pre1  = pre_1.length()
		cantidad_pre2  = pre_2.length()
		cantidad_pre4  = pre_4.length()
		cantidad_pre5  = pre_5.length()


		# => calculando isn diario
		satisfechos = cantidad_pre4 + cantidad_pre5
		insatisfechos = cantidad_pre1 + cantidad_pre2
		isn = (100*((satisfechos.to_f - insatisfechos.to_f)/cantidad.to_f)).round(3)
		resolutividad = (100 * cantidad_pos.to_f/(cantidad_pos.to_f+cantidad_neg.to_f)).round(3)

		if Indicadoresdiario.where(fecha: fecha).where(segmento: id_segmento+4).blank? then
			Indicadoresdiario.create(
				isn: isn,
				resolutividad: resolutividad,
				resp_1_2: insatisfechos,
				resp_4_5: satisfechos,
				fecha: fecha,
				segmento: id_segmento+4
				)
		else
			Indicadoresdiario.where(fecha: fecha).where(segmento: id_segmento+4).update_all(
				isn: isn,
				resolutividad: resolutividad,
				resp_1_2: insatisfechos,
				resp_4_5: satisfechos
				)
		end


		if Indicadoresacumulado.where(fecha: fecha).where(segmento: id_segmento+4).blank? then
			Indicadoresacumulado.create(
				isn: isn,
				resolutividad: resolutividad,
				resp_1_2: insatisfechos,
				resp_4_5: satisfechos,
				fecha: fecha,
				segmento: id_segmento+4
				)
		else
			Indicadoresacumulado.where(fecha: fecha).where(segmento: id_segmento+4).update_all(
				isn: isn,
				resolutividad: resolutividad,
				resp_1_2: insatisfechos,
				resp_4_5: satisfechos
				)
		end


		##    Calculando para atributos para segmentos distintos a pyme

		##  Acceso 2 ;;; rapidez 3 ;;; 4 accesibilidad info ;;; 5 utilidad
		for nro_pregunta in 2..5
			pre_1_atri = Respuestum.where(preguntum_id: nro_pregunta).where(valor_pregunta: 1).where(encuestum_id: encuestados_a_la_fecha)
			pre_2_atri = Respuestum.where(preguntum_id: nro_pregunta).where(valor_pregunta: 2).where(encuestum_id: encuestados_a_la_fecha)
			pre_4_atri = Respuestum.where(preguntum_id: nro_pregunta).where(valor_pregunta: 4).where(encuestum_id: encuestados_a_la_fecha)
			pre_5_atri = Respuestum.where(preguntum_id: nro_pregunta).where(valor_pregunta: 5).where(encuestum_id: encuestados_a_la_fecha)

			cant_pre1_atri  = pre_1_atri.length()
			cant_pre2_atri  = pre_2_atri.length()
			cant_pre4_atri  = pre_4_atri.length()
			cant_pre5_atri  = pre_5_atri.length()

			satis_atri = cant_pre4_atri + cant_pre5_atri
			insatis_atri = cant_pre1_atri + cant_pre2_atri

			valor_atri = (100*((satis_atri.to_f - insatis_atri.to_f)/cantidad.to_f)).round(3)

			if Atributosdiario.where(fecha: fecha).where(segmento: id_segmento).where(pregunta: nro_pregunta).blank? then
				Atributosdiario.create(
					valor: valor_atri,
					fecha: fecha,
					segmento: id_segmento+4,
					pregunta: nro_pregunta
					)
			else
				Atributosdiario.where(fecha: fecha).where(segmento: id_segmento).where(pregunta: nro_pregunta).update_all(
					valor: valor_atri
					)
			end

			if Atributosacumulado.where(fecha: fecha).where(segmento: id_segmento+4).where(pregunta: nro_pregunta).blank? then
				Atributosacumulado.create(
					valor: valor_atri,
					fecha: fecha,
					segmento: id_segmento+4,
					pregunta: nro_pregunta
					)
			else
				Atributosacumulado.where(fecha: fecha).where(segmento: id_segmento+4).where(pregunta: nro_pregunta).update_all(
					valor: valor_atri
					)
			end
		end
	end
	# FIN FOR PYMES


	#ISN TOTAL
	ponderacion_contrato = 0.402
	ponderacion_hibrido = 0.183
	ponderacion_prepago = 0.092
	ponderacion_fijo = 0.205
	ponderacion_pyme_movil = 0.091
	ponderacion_pyme_fijo = 0.027 


	indicadores_diarios_actuales = Indicadoresdiario.where(fecha: fecha)
	isn_diario_global = (ponderacion_contrato*indicadores_diarios_actuales.where(segmento: 1).take.isn+
						ponderacion_hibrido*indicadores_diarios_actuales.where(segmento: 2).take.isn+
						ponderacion_prepago*indicadores_diarios_actuales.where(segmento: 3).take.isn+
						ponderacion_fijo*indicadores_diarios_actuales.where(segmento: 4).take.isn+
						ponderacion_pyme_fijo*indicadores_diarios_actuales.where(segmento: 5).take.isn+
						ponderacion_pyme_movil*indicadores_diarios_actuales.where(segmento: 6).take.isn).to_f.round(3);
	resolutividad_diario_global = (ponderacion_contrato*indicadores_diarios_actuales.where(segmento: 1).take.resolutividad+
						ponderacion_hibrido*indicadores_diarios_actuales.where(segmento: 2).take.resolutividad+
						ponderacion_prepago*indicadores_diarios_actuales.where(segmento: 3).take.resolutividad+
						ponderacion_fijo*indicadores_diarios_actuales.where(segmento: 4).take.resolutividad+
						ponderacion_pyme_fijo*indicadores_diarios_actuales.where(segmento: 5).take.resolutividad+
						ponderacion_pyme_movil*indicadores_diarios_actuales.where(segmento: 6).take.resolutividad).to_f.round(3);
	insatisfechos_diario_global = (ponderacion_contrato*indicadores_diarios_actuales.where(segmento: 1).take.resp_1_2+
						ponderacion_hibrido*indicadores_diarios_actuales.where(segmento: 2).take.resp_1_2+
						ponderacion_prepago*indicadores_diarios_actuales.where(segmento: 3).take.resp_1_2+
						ponderacion_fijo*indicadores_diarios_actuales.where(segmento: 4).take.resp_1_2+
						ponderacion_pyme_fijo*indicadores_diarios_actuales.where(segmento: 5).take.resp_1_2+
						ponderacion_pyme_movil*indicadores_diarios_actuales.where(segmento: 6).take.resp_1_2).to_f.round(3);
	satisfechos_4_5_diario_global = (ponderacion_contrato*indicadores_diarios_actuales.where(segmento: 1).take.resp_4_5+
						ponderacion_hibrido*indicadores_diarios_actuales.where(segmento: 2).take.resp_4_5+
						ponderacion_prepago*indicadores_diarios_actuales.where(segmento: 3).take.resp_4_5+
						ponderacion_fijo*indicadores_diarios_actuales.where(segmento: 4).take.resp_4_5+
						ponderacion_pyme_fijo*indicadores_diarios_actuales.where(segmento: 5).take.resp_4_5+
						ponderacion_pyme_movil*indicadores_diarios_actuales.where(segmento: 6).take.resp_4_5).to_f.round(3);
	
	if Indicadoresdiario.where(fecha: fecha).where(segmento: 7).blank? then
		Indicadoresdiario.create(
			isn: isn_diario_global,
			resolutividad: resolutividad_diario_global,
			resp_1_2: insatisfechos_diario_global,
			resp_4_5: satisfechos_4_5_diario_global,
			fecha: fecha,
			segmento: 7
			)
	else
		Indicadoresdiario.where(fecha: fecha).where(segmento: 7).update_all(
			isn: isn_diario_global,
			resolutividad: resolutividad_diario_global,
			resp_1_2: insatisfechos_diario_global,
			resp_4_5: satisfechos_4_5_diario_global
			)
	end


	indicadores_acumulados_actuales = Indicadoresacumulado.where(fecha: fecha)
	isn_acumulado_global = (ponderacion_contrato*indicadores_acumulados_actuales.where(segmento: 1).take.isn+
						ponderacion_hibrido*indicadores_acumulados_actuales.where(segmento: 2).take.isn+
						ponderacion_prepago*indicadores_acumulados_actuales.where(segmento: 3).take.isn+
						ponderacion_fijo*indicadores_acumulados_actuales.where(segmento: 4).take.isn+
						ponderacion_pyme_fijo*indicadores_acumulados_actuales.where(segmento: 5).take.isn+
						ponderacion_pyme_movil*indicadores_acumulados_actuales.where(segmento: 6).take.isn).to_f.round(3);
	resolutividad_acumulado_global = (ponderacion_contrato*indicadores_acumulados_actuales.where(segmento: 1).take.resolutividad+
						ponderacion_hibrido*indicadores_acumulados_actuales.where(segmento: 2).take.resolutividad+
						ponderacion_prepago*indicadores_acumulados_actuales.where(segmento: 3).take.resolutividad+
						ponderacion_fijo*indicadores_acumulados_actuales.where(segmento: 4).take.resolutividad+
						ponderacion_pyme_fijo*indicadores_acumulados_actuales.where(segmento: 5).take.resolutividad+
						ponderacion_pyme_movil*indicadores_acumulados_actuales.where(segmento: 6).take.resolutividad).to_f.round(3).round(3);
	insatisfechos_acumulado_global = (ponderacion_contrato*indicadores_acumulados_actuales.where(segmento: 1).take.resp_1_2+
						ponderacion_hibrido*indicadores_acumulados_actuales.where(segmento: 2).take.resp_1_2+
						ponderacion_prepago*indicadores_acumulados_actuales.where(segmento: 3).take.resp_1_2+
						ponderacion_fijo*indicadores_acumulados_actuales.where(segmento: 4).take.resp_1_2+
						ponderacion_pyme_fijo*indicadores_acumulados_actuales.where(segmento: 5).take.resp_1_2+
						ponderacion_pyme_movil*indicadores_acumulados_actuales.where(segmento: 6).take.resp_1_2).to_f.round(3);
	satisfechos_4_5_acumulado_global = (ponderacion_contrato*indicadores_acumulados_actuales.where(segmento: 1).take.resp_4_5+
						ponderacion_hibrido*indicadores_acumulados_actuales.where(segmento: 2).take.resp_4_5+
						ponderacion_prepago*indicadores_acumulados_actuales.where(segmento: 3).take.resp_4_5+
						ponderacion_fijo*indicadores_acumulados_actuales.where(segmento: 4).take.resp_4_5+
						ponderacion_pyme_fijo*indicadores_acumulados_actuales.where(segmento: 5).take.resp_4_5+
						ponderacion_pyme_movil*indicadores_acumulados_actuales.where(segmento: 6).take.resp_4_5).to_f.round(3);
	
	if Indicadoresacumulado.where(fecha: fecha).where(segmento: 7).blank? then
		Indicadoresacumulado.create(
			isn: isn_acumulado_global,
			resolutividad: resolutividad_acumulado_global,
			resp_1_2: insatisfechos_acumulado_global,
			resp_4_5: satisfechos_4_5_acumulado_global,
			fecha: fecha,
			segmento: 7
			)
	else
		Indicadoresacumulado.where(fecha: fecha).where(segmento: 7).update_all(
			isn: isn_acumulado_global,
			resolutividad: resolutividad_acumulado_global,
			resp_1_2: insatisfechos_acumulado_global,
			resp_4_5: satisfechos_4_5_acumulado_global
			)
	end
end #BORRAR ESTE END
  


  end


end

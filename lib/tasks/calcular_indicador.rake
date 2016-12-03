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
		'2016/10/25','2016/10/26','2016/10/27','2016/10/28','2016/10/29','2016/10/30','2016/10/31'];

for j in 0..30 #BORRAR
	puts fecha = mes_completo[j]
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
	
	if Indicadoresacumulado.where(fecha: fecha).where(segmento: 7).blank? then
		Indicadoresacumulado.create(
			isn: isn_diario_global,
			resolutividad: resolutividad_diario_global,
			resp_1_2: insatisfechos_diario_global,
			resp_4_5: satisfechos_4_5_diario_global,
			fecha: fecha,
			segmento: 7
			)
	else
		Indicadoresacumulado.where(fecha: fecha).where(segmento: 7).update_all(
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

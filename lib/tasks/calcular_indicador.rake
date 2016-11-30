namespace :calcular_indicador do
  desc "TODO"
  task consultar_task: :environment do
  	#puts "Exito"

	#### Calculando indicadores ####
	## aqui get fecha de lo que se desea actualizar en relacion a los indicadores
	fecha = '2016/10/11';
	#puts"cantidad #{cantidad}"
	total = Encuestum.where($fecha);

	cantidad = total.length()
	resolucion_positiva= Encuestum.where( resuelto_encuesta: 1)
	resolucion_negativa= Encuestum.where( resuelto_encuesta: 0)

	## 		Calculando preguntas 1 y 2	para segmento	##
	pre_1 = Respuestum.where(valor_pregunta: 1).where(preguntum_id: 1)
	pre_2 = Respuestum.where(valor_pregunta: 2).where(preguntum_id: 1)
	pre_4 = Respuestum.where(valor_pregunta: 4).where(preguntum_id: 1)
	pre_5 = Respuestum.where(valor_pregunta: 5).where(preguntum_id: 1)

	cantidad_pos = resolucion_positiva.length()
	cantidad_neg = resolucion_negativa.length()
	cantidad_pre1  = pre_1.length()
	cantidad_pre2  = pre_2.length()
	cantidad_pre4  = pre_4.length()
	cantidad_pre5  = pre_5.length()
	#puts "resolucion_positiva#{cantidad_pos}"
	nuevo_dia = Indicadoresdiario.new();
	# => calculando isn diario
	satisfechos = cantidad_pre4 + cantidad_pre5
	insatisfechos = cantidad_pre1 + cantidad_pre2
	tot = (satisfechos - insatisfechos)
	nuevo_dia.isn = (100 * (tot.to_f / cantidad.to_f)).round(3)
	#puts"nuevo: #{cantidad}"
	nuevo_dia.resolutividad = cantidad_pos
	nuevo_dia.resp_1_2 = (cantidad_pre1+cantidad_pre2)
	nuevo_dia.resp_4_5 = (cantidad_pre5+cantidad_pre4)
	nuevo_dia.fecha = fecha
	nuevo_dia.save()

  end

end

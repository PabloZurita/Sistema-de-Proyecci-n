namespace :calcular_indicador do
  desc "TODO"
  task consultar_task: :environment do
  	 	puts "Exito"

	#### Calculando indicadores ####
	## aqui get fecha de lo que se desea actualizar en relacion a los indicadores
	fecha = '2016/10/11';
	cantidad = Encuestum.all
	cantidad = cantidad.length()
	#puts"cantidad #{cantidad}"
	#@enc_deldia = Encuestum.find_by_all_fecha_creacion_encuesta($fecha);
	resolucion_positiva= Encuestum.where( resuelto_encuesta: 1)
	resolucion_negativa= Encuestum.where( resuelto_encuesta: 0)

	@saludo = 1
	## 		Calculando preguntas 1 y 2		##
	pre_1 = Respuestum.where(valor_pregunta: 1)
	pre_2 = Respuestum.where(valor_pregunta: 2)
	pre_4 = Respuestum.where(valor_pregunta: 4)
	pre_5 = Respuestum.where(valor_pregunta: 5)

	cantidad_pos = resolucion_positiva.length()
	cantidad_neg = resolucion_negativa.length()
	cantidad_pre1  = pre_1.length()
	cantidad_pre2  = pre_2.length()
	cantidad_pre4  = pre_4.length()
	cantidad_pre5  = pre_5.length()
	#puts "resolucion_positiva#{cantidad_pos}"
	#puts "resolucion_negativa#{cantidad_neg}"
	#puts "pre_1#{cantidad_pre1}"
	#puts "pre_2#{cantidad_pre2}"
	puts "pre_4#{cantidad_pre4}"
	puts "pre_5#{cantidad_pre5}"
	
	nuevo_dia = Indicadoresdiario.new();
	nuevo_dia.id_ind_diario = 1
	nuevo_dia.isn = cantidad_pos
	nuevo_dia.resolutividad = cantidad_pos
	nuevo_dia.resp_1_2 = (cantidad_pre1+cantidad_pre2)/1
	nuevo_dia.resp_4_5 = (cantidad_pre5+cantidad_pre4)/1
	nuevo_dia.fecha = fecha
	nuevo_dia.save()
	
  end

end

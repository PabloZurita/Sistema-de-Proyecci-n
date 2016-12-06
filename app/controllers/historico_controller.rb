class HistoricoController < ApplicationController
  helper_method :obtener_datos
  def index


  	#ID VERSIONES -- desktop:1    mobile:2     canalOnline:3

  	#PARA DATATABLES
  	@indicadoresdiarios = Indicadoresdiario.where(segmento: 7).order(fecha: :asc)




  	#PARA GRAFICO HISTORICO

  	#DATOS DESKTOP --> version 1
  	version = 1;
  	@nombres_segmentos = ['Global','Contrato','Hibrido','Prepago','Fijo','Pyme Fijo','Pyme Movil'];
  	@datos_desktop_global_acumulado
  	@desktop_global_acumulado = Indicadoresacumulado.where(segmento: 7).where(version: version).order(fecha: :asc)
  	
  	@datos_desktop_contrato_acumulado
  	@desktop_contrato_acumulado = Indicadoresacumulado.where(segmento: 1).where(version: version).order(fecha: :asc)
  	
  	@datos_desktop_hibrido_acumulado
  	@desktop_hibrido_acumulado= Indicadoresacumulado.where(segmento: 2).where(version: version).order(fecha: :asc)
  	
  	@datos_desktop_prepago_acumulado
  	@desktop_prepago_acumulado = Indicadoresacumulado.where(segmento: 3).where(version: version).order(fecha: :asc)
  	
  	@datos_desktop_fijo_acumulado
  	@desktop_fijo_acumulado = Indicadoresacumulado.where(segmento: 4).where(version: version).order(fecha: :asc)

  	@datos_desktop_pyme_fijo_acumulado
	@desktop_pyme_fijo_acumulado = Indicadoresacumulado.where(segmento: 5).where(version: version).order(fecha: :asc)	

  	@datos_desktop_pyme_movil_acumulado
  	@desktop_pyme_movil_acumulado = Indicadoresacumulado.where(segmento: 6).where(version: version).order(fecha: :asc)

  	if @desktop_global_acumulado.length > 0 then
  		@datos_desktop_global_acumulado = Array.new(@desktop_global_acumulado.length) { Array.new(2,0.0) }
  		@datos_desktop_contrato_acumulado = Array.new(@desktop_contrato_acumulado.length) { Array.new(2,0.0) }
  		@datos_desktop_hibrido_acumulado = Array.new(@desktop_hibrido_acumulado.length) { Array.new(2,0.0) }
  		@datos_desktop_prepago_acumulado = Array.new(@desktop_prepago_acumulado.length) { Array.new(2,0.0) }
  		@datos_desktop_fijo_acumulado = Array.new(@desktop_fijo_acumulado.length) { Array.new(2,0.0) }
  		@datos_desktop_pyme_fijo_acumulado = Array.new(@desktop_pyme_fijo_acumulado.length) { Array.new(2,0.0) }
  		@datos_desktop_pyme_movil_acumulado = Array.new(@desktop_pyme_movil_acumulado.length) { Array.new(2,0.0) }
	 	for i in 0..@desktop_global_acumulado.length-1
	 		@datos_desktop_global_acumulado[i][0] = (Time.zone.parse(@desktop_global_acumulado[i].fecha.to_s).utc.to_f*1000).to_f
	 		@datos_desktop_global_acumulado[i][1] = @desktop_global_acumulado[i].isn.to_f

	 		@datos_desktop_contrato_acumulado[i][0] = (Time.zone.parse(@desktop_contrato_acumulado[i].fecha.to_s).utc.to_f*1000).to_f
	 		@datos_desktop_contrato_acumulado[i][1] = @desktop_contrato_acumulado[i].isn.to_f

	 		@datos_desktop_hibrido_acumulado[i][0] = (Time.zone.parse(@desktop_hibrido_acumulado[i].fecha.to_s).utc.to_f*1000).to_f
	 		@datos_desktop_hibrido_acumulado[i][1] = @desktop_hibrido_acumulado[i].isn.to_f

	 		@datos_desktop_prepago_acumulado[i][0] = (Time.zone.parse(@desktop_prepago_acumulado[i].fecha.to_s).utc.to_f*1000).to_f
	 		@datos_desktop_prepago_acumulado[i][1] = @desktop_prepago_acumulado[i].isn.to_f

	 		@datos_desktop_fijo_acumulado[i][0] = (Time.zone.parse(@desktop_fijo_acumulado[i].fecha.to_s).utc.to_f*1000).to_f
	 		@datos_desktop_fijo_acumulado[i][1] = @desktop_fijo_acumulado[i].isn.to_f

	 		@datos_desktop_pyme_fijo_acumulado[i][0] = (Time.zone.parse(@desktop_pyme_fijo_acumulado[i].fecha.to_s).utc.to_f*1000).to_f
	 		@datos_desktop_pyme_fijo_acumulado[i][1] = @desktop_pyme_fijo_acumulado[i].isn.to_f

	 		@datos_desktop_pyme_movil_acumulado[i][0] = (Time.zone.parse(@desktop_pyme_movil_acumulado[i].fecha.to_s).utc.to_f*1000).to_f
	 		@datos_desktop_pyme_movil_acumulado[i][1] = @desktop_pyme_movil_acumulado[i].isn.to_f


	  	end
	  	@datos_acumulado_desktop = [@datos_desktop_global_acumulado,
	  		@datos_desktop_contrato_acumulado,
	  		@datos_desktop_hibrido_acumulado,
	  		@datos_desktop_prepago_acumulado,
	  		@datos_desktop_fijo_acumulado,
	  		@datos_desktop_pyme_fijo_acumulado,
	  		@datos_desktop_pyme_movil_acumulado
	  	]
	else
		@datos_desktop_global_acumulado = [0,0]
		@datos_desktop_contrato_acumulado = [0,0]
		@datos_desktop_hibrido_acumulado = [0,0]
		@datos_desktop_prepago_acumulado = [0,0]
		@datos_desktop_fijo_acumulado = [0,0]
		@datos_desktop_pyme_fijo_acumulado = [0,0]
		@datos_desktop_pyme_movil_acumulado = [0,0]
	end #FIN IF




	#AQUI COMIENZAN LAS MISMAS CONSULTAS ANTERIORES PERO PARA LA VERSION MOBILE  ---- version: 2
	version = 2;
	@datos_mobile_global_acumulado
  	@mobile_global_acumulado = Indicadoresacumulado.where(segmento: 7).where(version: version).order(fecha: :asc)
  	
  	@datos_mobile_contrato_acumulado
  	@mobile_contrato_acumulado = Indicadoresacumulado.where(segmento: 1).where(version: version).order(fecha: :asc)
  	
  	@datos_mobile_hibrido_acumulado
  	@mobile_hibrido_acumulado= Indicadoresacumulado.where(segmento: 2).where(version: version).order(fecha: :asc)
  	
  	@datos_mobile_prepago_acumulado
  	@mobile_prepago_acumulado = Indicadoresacumulado.where(segmento: 3).where(version: version).order(fecha: :asc)
  	
  	@datos_mobile_fijo_acumulado
  	@mobile_fijo_acumulado = Indicadoresacumulado.where(segmento: 4).where(version: version).order(fecha: :asc)

  	@datos_mobile_pyme_fijo_acumulado
	@mobile_pyme_fijo_acumulado = Indicadoresacumulado.where(segmento: 5).where(version: version).order(fecha: :asc)	

  	@datos_mobile_pyme_movil_acumulado
  	@mobile_pyme_movil_acumulado = Indicadoresacumulado.where(segmento: 6).where(version: version).order(fecha: :asc)

  	if @mobile_global_acumulado.length > 0 then
  		@datos_mobile_global_acumulado = Array.new(@mobile_global_acumulado.length) { Array.new(2,0.0) }
  		@datos_mobile_contrato_acumulado = Array.new(@mobile_contrato_acumulado.length) { Array.new(2,0.0) }
  		@datos_mobile_hibrido_acumulado = Array.new(@mobile_hibrido_acumulado.length) { Array.new(2,0.0) }
  		@datos_mobile_prepago_acumulado = Array.new(@mobile_prepago_acumulado.length) { Array.new(2,0.0) }
  		@datos_mobile_fijo_acumulado = Array.new(@mobile_fijo_acumulado.length) { Array.new(2,0.0) }
  		@datos_mobile_pyme_fijo_acumulado = Array.new(@mobile_pyme_fijo_acumulado.length) { Array.new(2,0.0) }
  		@datos_mobile_pyme_movil_acumulado = Array.new(@mobile_pyme_movil_acumulado.length) { Array.new(2,0.0) }
	 	for i in 0..@mobile_global_acumulado.length-1
	 		@datos_mobile_global_acumulado[i][0] = (Time.zone.parse(@mobile_global_acumulado[i].fecha.to_s).utc.to_f*1000).to_f
	 		@datos_mobile_global_acumulado[i][1] = @mobile_global_acumulado[i].isn.to_f

	 		@datos_mobile_contrato_acumulado[i][0] = (Time.zone.parse(@mobile_contrato_acumulado[i].fecha.to_s).utc.to_f*1000).to_f
	 		@datos_mobile_contrato_acumulado[i][1] = @mobile_contrato_acumulado[i].isn.to_f

	 		@datos_mobile_hibrido_acumulado[i][0] = (Time.zone.parse(@mobile_hibrido_acumulado[i].fecha.to_s).utc.to_f*1000).to_f
	 		@datos_mobile_hibrido_acumulado[i][1] = @mobile_hibrido_acumulado[i].isn.to_f

	 		@datos_mobile_prepago_acumulado[i][0] = (Time.zone.parse(@mobile_prepago_acumulado[i].fecha.to_s).utc.to_f*1000).to_f
	 		@datos_mobile_prepago_acumulado[i][1] = @mobile_prepago_acumulado[i].isn.to_f

	 		@datos_mobile_fijo_acumulado[i][0] = (Time.zone.parse(@mobile_fijo_acumulado[i].fecha.to_s).utc.to_f*1000).to_f
	 		@datos_mobile_fijo_acumulado[i][1] = @mobile_fijo_acumulado[i].isn.to_f

	 		@datos_mobile_pyme_fijo_acumulado[i][0] = (Time.zone.parse(@mobile_pyme_fijo_acumulado[i].fecha.to_s).utc.to_f*1000).to_f
	 		@datos_mobile_pyme_fijo_acumulado[i][1] = @mobile_pyme_fijo_acumulado[i].isn.to_f

	 		@datos_mobile_pyme_movil_acumulado[i][0] = (Time.zone.parse(@mobile_pyme_movil_acumulado[i].fecha.to_s).utc.to_f*1000).to_f
	 		@datos_mobile_pyme_movil_acumulado[i][1] = @mobile_pyme_movil_acumulado[i].isn.to_f


	  	end
	  	@datos_acumulado_mobile = [@datos_mobile_global_acumulado,
	  		@datos_mobile_contrato_acumulado,
	  		@datos_mobile_hibrido_acumulado,
	  		@datos_mobile_prepago_acumulado,
	  		@datos_mobile_fijo_acumulado,
	  		@datos_mobile_pyme_fijo_acumulado,
	  		@datos_mobile_pyme_movil_acumulado
	  	]
	else
		@datos_mobile_global_acumulado = [0,0]
		@datos_mobile_contrato_acumulado = [0,0]
		@datos_mobile_hibrido_acumulado = [0,0]
		@datos_mobile_prepago_acumulado = [0,0]
		@datos_mobile_fijo_acumulado = [0,0]
		@datos_mobile_pyme_fijo_acumulado = [0,0]
		@datos_mobile_pyme_movil_acumulado = [0,0]
	end #FIN IF



	#@datitos = obtener_datos(@indicadoresdiarios,2)
	#AHORA LOS DATOS GLOBALES (PONDERADO DESKTOP-MOBILE) --- version: 3
	version = 3;




  end





  
end

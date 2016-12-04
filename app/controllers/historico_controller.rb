class HistoricoController < ApplicationController

  def index
  	@nombres_segmentos = ['Contrato','Hibrido','Prepago','Fijo','Pyme Fijo','Pyme Movil','Global Desktop'];
  	@datos_desktop_global_diario
  	@desktop_global_diario = Indicadoresdiario.where(segmento: 7).order(fecha: :asc)


  	@indicadoresdiarios = Indicadoresdiario.where(segmento: 7).order(fecha: :asc)

  	
  	@datos_desktop_contrato_diario
  	@desktop_contrato_diario = Indicadoresdiario.where(segmento: 1).order(fecha: :asc)
  	
  	@datos_desktop_hibrido_diario
  	@desktop_hibrido_diario= Indicadoresdiario.where(segmento: 2).order(fecha: :asc)
  	
  	@datos_desktop_prepago_diario
  	@desktop_prepago_diario = Indicadoresdiario.where(segmento: 3).order(fecha: :asc)
  	
  	@datos_desktop_fijo_diario
  	@desktop_fijo_diario = Indicadoresdiario.where(segmento: 4).order(fecha: :asc)

  	@datos_desktop_pyme_fijo_diario
	@desktop_pyme_fijo_diario = Indicadoresdiario.where(segmento: 5).order(fecha: :asc)	

  	@datos_desktop_pyme_movil_diario
  	@desktop_pyme_movil_diario = Indicadoresdiario.where(segmento: 6).order(fecha: :asc)

  	if @desktop_global_diario.length > 0 then
  		@datos_desktop_global_diario = Array.new(@desktop_global_diario.length) { Array.new(2,0.0) }
  		@datos_desktop_contrato_diario = Array.new(@desktop_contrato_diario.length) { Array.new(2,0.0) }
  		@datos_desktop_hibrido_diario = Array.new(@desktop_hibrido_diario.length) { Array.new(2,0.0) }
  		@datos_desktop_prepago_diario = Array.new(@desktop_prepago_diario.length) { Array.new(2,0.0) }
  		@datos_desktop_fijo_diario = Array.new(@desktop_fijo_diario.length) { Array.new(2,0.0) }
  		@datos_desktop_pyme_fijo_diario = Array.new(@desktop_pyme_fijo_diario.length) { Array.new(2,0.0) }
  		@datos_desktop_pyme_movil_diario = Array.new(@desktop_pyme_movil_diario.length) { Array.new(2,0.0) }
	 	for i in 0..@desktop_global_diario.length-1
	 		@datos_desktop_global_diario[i][0] = (Time.zone.parse(@desktop_global_diario[i].fecha.to_s).utc.to_f*1000).to_f
	 		@datos_desktop_global_diario[i][1] = @desktop_global_diario[i].isn.to_f

	 		@datos_desktop_contrato_diario[i][0] = (Time.zone.parse(@desktop_contrato_diario[i].fecha.to_s).utc.to_f*1000).to_f
	 		@datos_desktop_contrato_diario[i][1] = @desktop_contrato_diario[i].isn.to_f

	 		@datos_desktop_hibrido_diario[i][0] = (Time.zone.parse(@desktop_hibrido_diario[i].fecha.to_s).utc.to_f*1000).to_f
	 		@datos_desktop_hibrido_diario[i][1] = @desktop_hibrido_diario[i].isn.to_f

	 		@datos_desktop_prepago_diario[i][0] = (Time.zone.parse(@desktop_prepago_diario[i].fecha.to_s).utc.to_f*1000).to_f
	 		@datos_desktop_prepago_diario[i][1] = @desktop_prepago_diario[i].isn.to_f

	 		@datos_desktop_fijo_diario[i][0] = (Time.zone.parse(@desktop_fijo_diario[i].fecha.to_s).utc.to_f*1000).to_f
	 		@datos_desktop_fijo_diario[i][1] = @desktop_fijo_diario[i].isn.to_f

	 		@datos_desktop_pyme_fijo_diario[i][0] = (Time.zone.parse(@desktop_pyme_fijo_diario[i].fecha.to_s).utc.to_f*1000).to_f
	 		@datos_desktop_pyme_fijo_diario[i][1] = @desktop_pyme_fijo_diario[i].isn.to_f

	 		@datos_desktop_pyme_movil_diario[i][0] = (Time.zone.parse(@desktop_pyme_movil_diario[i].fecha.to_s).utc.to_f*1000).to_f
	 		@datos_desktop_pyme_movil_diario[i][1] = @desktop_pyme_movil_diario[i].isn.to_f


	  	end
	  	@datos_diario = [@datos_desktop_global_diario,
	  		@datos_desktop_contrato_diario,
	  		@datos_desktop_hibrido_diario,
	  		@datos_desktop_prepago_diario,
	  		@datos_desktop_fijo_diario,
	  		@datos_desktop_pyme_fijo_diario,
	  		@datos_desktop_pyme_movil_diario
	  	]
	else
		@datos_desktop_global_diario = [0,0]
		@datos_desktop_contrato_diario = [0,0]
		@datos_desktop_hibrido_diario = [0,0]
		@datos_desktop_prepago_diario = [0,0]
		@datos_desktop_fijo_diario = [0,0]
		@datos_desktop_pyme_fijo_diario = [0,0]
		@datos_desktop_pyme_movil_diario = [0,0]
	end
  end
end

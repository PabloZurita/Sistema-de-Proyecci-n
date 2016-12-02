class HistoricoController < ApplicationController

  def index
  	@indicadoresdiarios = Indicadoresdiario.order(fecha: :asc).all
  	@datos
  	if @indicadoresdiarios.length > 0 then
  		@datos = Array.new(@indicadoresdiarios.length) { Array.new(2,0.0) }
	 	for i in 0..@indicadoresdiarios.length-1
	 		@datos[i][0] = (Time.zone.parse(@indicadoresdiarios[i].fecha.to_s).utc.to_f*1000).to_f
	 		@datos[i][1] = @indicadoresdiarios[i].isn.to_f
	  	end
	else
		@datos = [0,0] 
	end
  end
end

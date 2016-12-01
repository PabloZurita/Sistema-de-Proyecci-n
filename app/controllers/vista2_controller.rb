class Vista2Controller < ApplicationController

  def index
  	@indicadoresdiarios = Indicadoresdiario.all
  	@indicadoresacumulados = Indicadoresacumulado.all

  	#Indicadores Diarios 
  	if @indicadoresdiarios.where("fecha = ?", Time.now).blank? then
  		@isn_diario = 0
  	else
  		@isn_diario = @indicadoresdiarios.where("fecha = ?", Time.now).take.isn
  	end

  	if @indicadoresdiarios.where("fecha = ?", Time.now).blank? then
  		@resp_1_2_diario = 0
  	else
  		@resp_1_2_diario = @indicadoresdiarios.where("fecha = ?", Time.now).take.resp_1_2
  	end

  	if @indicadoresdiarios.where("fecha = ?", Time.now).blank? then
  		@resp_4_5_diario = 0
  	else
  		@resp_4_5_diario = @indicadoresdiarios.where("fecha = ?", Time.now).take.resp_4_5
  	end

  	#Indicadores Acumulados
  	if @indicadoresacumulados.where("fecha = ?", Time.now).blank? then
  		@isn_acumulado = 0
  	else
  		@isn_acumulado = @indicadoresacumulados.where("fecha = ?", Time.now).take.isn
  	end

  	if @indicadoresacumulados.where("fecha = ?", Time.now).blank? then
  		@resp_1_2_acumulado = 0
  	else
  		@resp_1_2_acumulado = @indicadoresacumulados.where("fecha = ?", Time.now).take.resp_1_2
  	end

  	if @indicadoresacumulados.where("fecha = ?", Time.now).blank? then
  		@resp_4_5_acumulado = 0
  	else
  		@resp_4_5_acumulado = @indicadoresacumulados.where("fecha = ?", Time.now).take.resp_4_5
  	end

  end
end

class Vista2Controller < ApplicationController

  def index
    @indicadoresdiarios = Indicadoresdiario.all
    @indicadoresacumulados = Indicadoresacumulado.all
    id_segmento = 7 #7 contendrá el ISN ponderado

    #Indicadores Diarios 
    fecha = Date.today.strftime("%d/%m/%Y")
    if @indicadoresdiarios.where(fecha: fecha).where(segmento: id_segmento).blank? then
      @isn_diario = 0
      @resp_1_2_diario = 0
      @resp_4_5_diario = 0
      @resolu_diario = 0
    else

      @isn_diario = @indicadoresdiarios.where(fecha: fecha).where(segmento: id_segmento).take.isn
      @resp_1_2_diario = @indicadoresdiarios.where(fecha: fecha).where(segmento: id_segmento).take.resp_1_2
      @resp_4_5_diario = @indicadoresdiarios.where(fecha: fecha).where(segmento: id_segmento).take.resp_4_5
      @resolu_diario = @indicadoresdiarios.where(fecha: fecha).where(segmento: id_segmento).take.resolutividad
    end
    #@indicadoresdiarios = Indicadoresdiario.find(Indicadoresdiario.where(fecha: Time.parse(fecha.to_s).strftime("%Y-%m-01")..fecha).where(segmento: id_segmento).ids).isn

    #Indicadores Acumulados
    if @indicadoresacumulados.where(fecha: fecha).where(segmento: id_segmento).blank? then
      @isn_acumulado = 0
      @resp_1_2_acumulado = 0
      @resp_4_5_acumulado = 0
      @resolu_acumulado = 0
    else
      @isn_acumulado = @indicadoresacumulados.where(fecha: fecha).where(segmento: id_segmento).take.isn
      @resp_1_2_acumulado = @indicadoresacumulados.where(fecha: fecha).where(segmento: id_segmento).take.resp_1_2
      @resp_4_5_acumulado = @indicadoresacumulados.where(fecha: fecha).where(segmento: id_segmento).take.resp_4_5
      @resolu_acumulado = @indicadoresacumulados.where(fecha: fecha).where(segmento: id_segmento).take.resolutividad
    end
    #@indicadoresacumulados = Indicadoresacumulado.find(Indicadoresacumulado.where(fecha: Time.parse(fecha.to_s).strftime("%Y-%m-01")..fecha).where(segmento: id_segmento).ids)
    
    #se supone que esta y la de más arriba da los ids del mes actual, pero no sé como acceder al isn

    @isn_mes = @indicadoresdiarios.where("fecha >= ? AND fecha <= ? AND segmento = ?",Time.now.month.to_s+"/01/"+Time.now.year.to_s, Time.now.month.to_s+"/"+Time.now.day.to_s+"/"+Time.now.year.to_s, id_segmento).pluck(:isn)
    @resolu_mes = @indicadoresdiarios.where("fecha >= ? AND fecha <= ? AND segmento = ?",Time.now.month.to_s+"/01/"+Time.now.year.to_s,Time.now.month.to_s+"/"+Time.now.day.to_s+"/"+Time.now.year.to_s, id_segmento).pluck(:resolutividad) 
  end
end
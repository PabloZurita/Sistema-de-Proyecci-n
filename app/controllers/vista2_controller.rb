class Vista2Controller < ApplicationController

  def index
    @indicadoresdiarios = Indicadoresdiario.all
    @indicadoresacumulados = Indicadoresacumulado.all
    id_segmento = 7 #7 contendrá el ISN ponderado

    #Indicadores Diarios 
    fecha = "11/04/2016"#Date.today.strftime("%d/%m/%Y")
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
    isn_diario_mes = @indicadoresdiarios.where("fecha >= ? AND fecha <= ? AND segmento = ?",Time.now.strftime("01/%m/%Y").to_s, Time.now.strftime("%d/%m/%Y").to_s, id_segmento).order(fecha: :asc).pluck(:isn)
    fechas_isn_diario = @indicadoresdiarios.where("fecha >= ? AND fecha <= ? AND segmento = ?",Time.now.strftime("01/%m/%Y").to_s, Time.now.strftime("%d/%m/%Y").to_s, id_segmento).order(fecha: :asc).pluck(:fecha)
    resolu_diario_mes = @indicadoresdiarios.where("fecha >= ? AND fecha <= ? AND segmento = ?",Time.now.strftime("01/%m/%Y").to_s, Time.now.strftime("%d/%m/%Y").to_s, id_segmento).order(fecha: :asc).pluck(:resolutividad) 
    fechas_resolu_diario = @indicadoresdiarios.where("fecha >= ? AND fecha <= ? AND segmento = ?",Time.now.strftime("01/%m/%Y").to_s, Time.now.strftime("%d/%m/%Y").to_s, id_segmento).order(fecha: :asc).pluck(:fecha) 
    @isn_mes = Array.new(isn_diario_mes.length) { Array.new(2,0.0) }
    @resolu_mes = Array.new(resolu_diario_mes.length) { Array.new(2,0.0) }
    for i in 0..isn_diario_mes.length-1
      @isn_mes[i] = [(Time.zone.parse(fechas_isn_diario[i].to_s).utc.to_f*1000).to_f,isn_diario_mes[i]]
      @resolu_mes[i] = [(Time.zone.parse(fechas_resolu_diario[i].to_s).utc.to_f*1000).to_f,resolu_diario_mes[i]]
    end
  end
end
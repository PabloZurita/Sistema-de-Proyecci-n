class GraficosController < ApplicationController
  def index
  	@atributosdiarios = Atributosdiario.all
    @atributosacumulados = Atributosacumulado.all
    id_segmento = 4 #7 contendrá el valor ponderado


    #@Atributosacumulados = Atributosacumulado.find(Atributosacumulado.where(fecha: Time.parse(Time.now.to_s).strftime("%Y-%m-01")..Time.now).where(segmento: id_segmento).ids)
    
    version = 1; #DESKTOP
    #se supone que esta y la de más arriba da los ids del mes actual, pero no sé como acceder al valor
    acceso_diario_mes = @atributosdiarios.where("fecha >= ? AND fecha <= ? AND segmento = ? AND pregunta = ? AND version = ?",Time.now.strftime("01/%m/%Y").to_s, Time.now.strftime("%d/%m/%Y").to_s, id_segmento,2,version).order(fecha: :asc).pluck(:valor)
    fechas_acceso_diario = @atributosdiarios.where("fecha >= ? AND fecha <= ? AND segmento = ? AND pregunta = ? AND version = ?",Time.now.strftime("01/%m/%Y").to_s, Time.now.strftime("%d/%m/%Y").to_s, id_segmento,2,version).order(fecha: :asc).pluck(:fecha)
    
    rapidez_diario_mes = @atributosdiarios.where("fecha >= ? AND fecha <= ? AND segmento = ? AND pregunta = ? AND version = ?",Time.now.strftime("01/%m/%Y").to_s, Time.now.strftime("%d/%m/%Y").to_s, id_segmento,3,version).order(fecha: :asc).pluck(:valor) 
    fechas_rapidez_diario = @atributosdiarios.where("fecha >= ? AND fecha <= ? AND segmento = ? AND pregunta = ? AND version = ?",Time.now.strftime("01/%m/%Y").to_s, Time.now.strftime("%d/%m/%Y").to_s, id_segmento,3,version).order(fecha: :asc).pluck(:fecha) 
    
    encontrar_info_diario_mes = @atributosdiarios.where("fecha >= ? AND fecha <= ? AND segmento = ? AND pregunta = ? AND version = ?",Time.now.strftime("01/%m/%Y").to_s, Time.now.strftime("%d/%m/%Y").to_s, id_segmento,4,version).order(fecha: :asc).pluck(:valor) 
    fechas_encontrar_info_diario = @atributosdiarios.where("fecha >= ? AND fecha <= ? AND segmento = ? AND pregunta = ? AND version = ?",Time.now.strftime("01/%m/%Y").to_s, Time.now.strftime("%d/%m/%Y").to_s, id_segmento,4,version).order(fecha: :asc).pluck(:fecha) 

    utilidad_info_diario_mes = @atributosdiarios.where("fecha >= ? AND fecha <= ? AND segmento = ? AND pregunta = ? AND version = ?",Time.now.strftime("01/%m/%Y").to_s, Time.now.strftime("%d/%m/%Y").to_s, id_segmento,5,version).order(fecha: :asc).pluck(:valor) 
    fechas_utilidad_info_diario = @atributosdiarios.where("fecha >= ? AND fecha <= ? AND segmento = ? AND pregunta = ? AND version = ?",Time.now.strftime("01/%m/%Y").to_s, Time.now.strftime("%d/%m/%Y").to_s, id_segmento,5,version).order(fecha: :asc).pluck(:fecha) 

    @acceso_dia_mes = Array.new(acceso_diario_mes.length) { Array.new(2,0.0) }
    @rapidez_dia_mes = Array.new(rapidez_diario_mes.length) { Array.new(2,0.0) }
    @encontrar_info_dia_mes = Array.new(encontrar_info_diario_mes.length) { Array.new(2,0.0) }
    @utilidad_info_dia_mes = Array.new(utilidad_info_diario_mes.length) { Array.new(2,0.0) }
    for i in 0..acceso_diario_mes.length-1
      @acceso_dia_mes[i] = [(Time.zone.parse(fechas_acceso_diario[i].to_s).utc.to_f*1000).to_f,*acceso_diario_mes[i]]
      @rapidez_dia_mes[i] = [(Time.zone.parse(fechas_rapidez_diario[i].to_s).utc.to_f*1000).to_f,rapidez_diario_mes[i]]
      @encontrar_info_dia_mes[i] = [(Time.zone.parse(fechas_encontrar_info_diario[i].to_s).utc.to_f*1000).to_f,encontrar_info_diario_mes[i]]
      @utilidad_info_dia_mes[i] = [(Time.zone.parse(fechas_utilidad_info_diario[i].to_s).utc.to_f*1000).to_f,utilidad_info_diario_mes[i]]
    end



    #ACUMULADO
    acceso_acumulado_mes = @atributosacumulados.where("fecha >= ? AND fecha <= ? AND segmento = ? AND pregunta = ? AND version = ?",Time.now.strftime("01/%m/%Y").to_s, Time.now.strftime("%d/%m/%Y").to_s, id_segmento,2,version).order(fecha: :asc).pluck(:valor)
    fechas_acceso_acumulado = @atributosacumulados.where("fecha >= ? AND fecha <= ? AND segmento = ? AND pregunta = ? AND version = ?",Time.now.strftime("01/%m/%Y").to_s, Time.now.strftime("%d/%m/%Y").to_s, id_segmento,2,version).order(fecha: :asc).pluck(:fecha)
    
    rapidez_acumulado_mes = @atributosacumulados.where("fecha >= ? AND fecha <= ? AND segmento = ? AND pregunta = ? AND version = ?",Time.now.strftime("01/%m/%Y").to_s, Time.now.strftime("%d/%m/%Y").to_s, id_segmento,3,version).order(fecha: :asc).pluck(:valor) 
    fechas_rapidez_acumulado = @atributosacumulados.where("fecha >= ? AND fecha <= ? AND segmento = ? AND pregunta = ? AND version = ?",Time.now.strftime("01/%m/%Y").to_s, Time.now.strftime("%d/%m/%Y").to_s, id_segmento,3,version).order(fecha: :asc).pluck(:fecha) 
    
    encontrar_info_acumulado_mes = @atributosacumulados.where("fecha >= ? AND fecha <= ? AND segmento = ? AND pregunta = ? AND version = ?",Time.now.strftime("01/%m/%Y").to_s, Time.now.strftime("%d/%m/%Y").to_s, id_segmento,4,version).order(fecha: :asc).pluck(:valor) 
    fechas_encontrar_info_acumulado = @atributosacumulados.where("fecha >= ? AND fecha <= ? AND segmento = ? AND pregunta = ? AND version = ?",Time.now.strftime("01/%m/%Y").to_s, Time.now.strftime("%d/%m/%Y").to_s, id_segmento,4,version).order(fecha: :asc).pluck(:fecha) 

    utilidad_info_acumulado_mes = @atributosacumulados.where("fecha >= ? AND fecha <= ? AND segmento = ? AND pregunta = ? AND version = ?",Time.now.strftime("01/%m/%Y").to_s, Time.now.strftime("%d/%m/%Y").to_s, id_segmento,5,version).order(fecha: :asc).pluck(:valor) 
    fechas_utilidad_info_acumulado = @atributosacumulados.where("fecha >= ? AND fecha <= ? AND segmento = ? AND pregunta = ? AND version = ?",Time.now.strftime("01/%m/%Y").to_s, Time.now.strftime("%d/%m/%Y").to_s, id_segmento,5,version).order(fecha: :asc).pluck(:fecha) 

    @acceso_acum_mes = Array.new(acceso_acumulado_mes.length) { Array.new(2,0.0) }
    @rapidez_acum_mes = Array.new(rapidez_acumulado_mes.length) { Array.new(2,0.0) }
    @encontrar_info_acum_mes = Array.new(encontrar_info_acumulado_mes.length) { Array.new(2,0.0) }
    @utilidad_info_acum_mes = Array.new(utilidad_info_acumulado_mes.length) { Array.new(2,0.0) }
    for i in 0..acceso_acumulado_mes.length-1
      @acceso_acum_mes[i] = [(Time.zone.parse(fechas_acceso_acumulado[i].to_s).utc.to_f*1000).to_f,*acceso_acumulado_mes[i]]
      @rapidez_acum_mes[i] = [(Time.zone.parse(fechas_rapidez_acumulado[i].to_s).utc.to_f*1000).to_f,rapidez_acumulado_mes[i]]
      @encontrar_info_acum_mes[i] = [(Time.zone.parse(fechas_encontrar_info_acumulado[i].to_s).utc.to_f*1000).to_f,encontrar_info_acumulado_mes[i]]
      @utilidad_info_acum_mes[i] = [(Time.zone.parse(fechas_utilidad_info_acumulado[i].to_s).utc.to_f*1000).to_f,utilidad_info_acumulado_mes[i]]
    end








    #







  end
end

lista_motivo = [
   "Ver saldo y consumo de bolsas" ,
   "Ver consumo y saldo de navegación" ,
   "Otro" ,
   "Ver listado / Detalle de boleta" ,
   "Pagar en línea" ,
   "Ver productos y servicios contratados" ,
   "Contratar / Descontratar servicios adicionales" ,
   "Ver puntos Club Movistar" ,
   "Realizar Consulta / Solicitud / Reclamo" ,
   "Ver saldo de minutos del plan y bolsas" ,
   "Ver detalle de llamadas" ,
   "Solicitar / Autorizar uso de puntos Club Movistar" ,
   "Ver listado / Detalle de boleta" ,
   "Ver puntos Club Movistar" ,
   "Ver listado / Detalle de boleta o facturas" ]


lista_motivo.each do |tipo_motivo|
  Motivo.create( tipo_motivo: tipo_motivo )
end


lista_pregunta= [
	"Satisfación general sucursal virtual",
  	"Facilidad acceso con rut y clave",
  	"Rapidez despliegue de info",
  	"Facilidad de encontrar info",
  	"Utilidad de la info"]


lista_pregunta.each do |tipo_pregunta|
  Preguntum.create( tipo_pregunta: tipo_pregunta)
end


lista_segmento= ["p","n"]

lista_segmento.each do |tipo_segmento|
  Segmento.create( tipo_segmento: tipo_segmento)
end


lista_contrato= ["contrato","hibrido","prepago","residencial","vip"]


lista_contrato.each do |tipo_contrato|
  Contrato.create( tipo_contrato: tipo_contrato)
end



lista_fijomovil= ["FIJA","MOVIL"]


lista_fijomovil.each do |tipo_fijomovil|
  Fijomovil.create( tipo_fijomovil: tipo_fijomovil)
end

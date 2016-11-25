require 'httparty'
class Conexion

	include HTTParty
	attr_accessor :encuesta

	def initialize
	   respuesta_consulta = consultar_ws
	   asignar_valores(respuesta_consulta)
	end


	def consultar_ws
		HTTParty.post('https://bo.opinat.com/ws/wsht-opinat.php',
			:body => 
				'<?xml version="1.0"?>
					<historico>
						<cliente>
							<username>tlfc</username>
							<contrasenya>d61fd001d6f98a28c33a6a9eb09acf04eb4873ce</contrasenya>
						</cliente>
						<encuestado>
							<nif_cliente>CH0000006</nif_cliente>
							<codigo_campanya>635</codigo_campanya>
							<codigo_oleada>13028</codigo_oleada>
							<codigo_centro>2137</codigo_centro>
							<codigo_interno_cliente/>
							<fecha_desde>15/10/2016</fecha_desde>
							<fecha_hasta>17/10/2016</fecha_hasta>
							<estado>R</estado>
						</encuestado>
					</historico>',  :format => 'json') #SI LE QUITO LA LINEA :formar => json  QUEDA COMO HASH Y NO COMO XML
	end


	def asignar_valores(respuesta_consulta)
		#SE SUPONE QUE EN ESTA FUNCIÓN SE DEBERÍAN SEPARAR LAS ENCUESTAS CON SUS RESPUESTAS Y ESO
		self.encuesta = respuesta_consulta
 	end
end
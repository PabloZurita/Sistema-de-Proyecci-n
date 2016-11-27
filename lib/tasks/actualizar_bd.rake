namespace :actualizar_bd do
  desc "TODO"
  task consultar_ws: :environment do
  	fecha_desde = '15/10/2016';
  	fecha_hasta = '17/10/2016';
  	respuesta_PREPAGO = Conexion.new('tlfc','d61fd001d6f98a28c33a6a9eb09acf04eb4873ce','CH0000006','635','13028','2137',fecha_desde,fecha_hasta,'R') #PREPAGO  	
  	#respuesta_FIJO = Conexion.new('tlfc','662cefa09e06767c0352946025bffcf2bf197d72','CH0000006','690','13522','2137',fecha_desde,fecha_hasta,'R') #FIJO
  	#respuesta_CONTRATO = Conexion.new('tlfc','0375b95368ad01d50b5c1b05131f51cf156f4a68','CH0000006','692','13523','2137',fecha_desde,fecha_hasta,'R') #CONTRATO
  	#respuesta_HIBRIDO = Conexion.new('tlfc','72036c3ab6bae9d3f59ab194e9a57bca357cc230','CH0000006','693','13524','2137',fecha_desde,fecha_hasta,'R') #HIBRIDO
  	#respuesta_PYME_FIJO = Conexion.new('tlfc','a4a67e084da28969d2be6621684c960bb7dddb2c','CH0000006','694','13525','2137',fecha_desde,fecha_hasta,'R') #PYME FIJO
  	#respuesta_PYME_MOVIL = Conexion.new('tlfc','5e97f24a2c4bc9940e590ffc752e91cbb1d2b1c2','CH0000006','695','13526','2137',fecha_desde,fecha_hasta,'R') #PYME MOVIL

  end
end

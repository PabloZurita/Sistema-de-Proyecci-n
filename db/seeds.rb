
lista_motivo = [
  [ "(8641) Ver saldo y consumo de bolsas" ],
  [ "(8642) Ver consumo y saldo de navegación" ],
  [ "(8653) Otro" ],
  [ "(9725) Ver listado / Detalle de boleta" ],
  [ "(9726) Pagar en línea" ],
  [ "(9727) Ver productos y servicios contratados" ],
  [ "(9729) Contratar / Descontratar servicios adicionales" ],
  [ "(9731) Ver puntos Club Movistar" ],
  [ "(9734) Realizar Consulta / Solicitud / Reclamo" ],
  [ "(9738) Ver saldo de minutos del plan y bolsas" ],
  [ "(9739) Ver consumo y saldo de navegación" ],
  [ "(9740) Ver listado / Detalle de boleta" ],
  [ "(9741) Pagar en línea" ],
  [ "(9742) Ver productos y servicios contratados" ],
  [ "(9745) Ver detalle de llamadas" ],
  [ "(9746) Ver puntos Club Movistar" ],
  [ "(9748) Solicitar / Autorizar uso de puntos Club Movistar" ],
  [ "(9750) Otro" ],
  [ "(9754) Ver consumo y saldo de navegación" ],
  [ "(9755) Ver listado / Detalle de boleta" ],
  [ "(9756) Pagar en línea" ],
  [ "(9761) Ver puntos Club Movistar" ],
  [ "(9765) Otro" ],
  [ "(9770) Ver listado / Detalle de boleta o facturas" ]
]

lista_motivo.each do |tipo_motivo|
  Motivo.create( tipo_motivo: tipo_motivo )
end


lista_clientes= [
  [ "136644521","ronniepizarro@gmail.com" ],[ "192772737","herreraandrea84@gmail.com" ],[ "17923386K","chris.rnb.55@hotmail.com" ],[ "193891926","eimybelen_0713@hotmail.com" ],[ "156137596","Paturry_xx_linda@hotmail.com" ],
  [ "179249944","sebastian226@hotmail.com" ],[ "167424112","_sergio77@hotmail.es" ],[ "98754857","jgalazcorvalan@gmail.com" ],[ "124993393","maguilera@santotomas.cl" ],["171202493" ,"pau.rojasibaceta4@gmail" ],
  [ "134417242","bvalenzuelae@hotmail.com" ],["178780891","edwards_1618@hotmail.com" ],[ "63631965","eduardochiang@hotmail.com" ],[ "13786312K","leonoraalistevergara@gmail.com" ],[ "50960579","edoper48@gmail.com" ],
  [ "102841611","jea.albornoz@gmail.com" ],[ "58647888","mariacristinamedinaa@gmail.com" ],[ "52823420","panchoarratia@gmail.com" ],["41021136","walmeneses2008@hotmail.com" ],[ "155221593","MAET14@GMAIL.COM" ],
  [ "57148403","MADERASLOPRADO@HOTMAIL.COM" ],[ "12072312K","rodolfoaravenao@gmail.com" ],[ "101895610","accale@hotmail.com" ],[ "84388106","rosa.oliver@hotmail.es" ],[ "186324056","cristianzambra93@gmail.com" ],
  [ "168351003","edith.ibarra1@gmail.com" ],[ "93665155","christian.vanderschraft@gsf.cl" ],[ "179699753","elizabeth.tiznado@gmail.com" ],[ "98505695","richard.faundez@vtr.net" ],[ "80593724","abastecimiento@llorente.cl" ],
  [ "219347685","carlos.hernan.diaz@hotmail.com" ],[ "93649257","jaosan@gmail.com" ],[ "118196198","ricardohantofagasta@yahoo.es" ],[ "11632511K","patricio.pino4767@gmail.com" ],[ "167347320","MAKA.SIGGES@GMAIL.COM" ],
  ["185937712","vania.f.l@hotmail.com"],["185714306","martazfp@gmail.com"],["70329808","ignacioeguiguren@hotmail.com"],["134066547","cesfamlm@gmail.com"],["112582886","orietta.arqueros@gmail.com"],
  ["108550619","bmdinamarcaf@yahoo.es"],["59957236","h.echeverria.c@gmail.com"],["236194361","chavez.9991@gmail.com"],["126601794","jossandon@gmail.com"],["56302409","rolygo@hotmail.com"],  
  ["161165697","Mleonbustos54@gmail.com"],["125568432","migambiado@gmail.com"],["13605192K","punzueta@ft.cl"],["243984149","mado_23@hotmail.com"],["10608467K","jocortes@interexport.cl"],  
  ["166445086","ignacio.morales.1987@gmail.com"],["130210031","nelvemed@gmail.com"],["122155692","cecilia.garmendia@gmail.com"],["119584191","mariaeugenia.gonzalez@umag.cl"],["100284812","josenortino@yahoo.es"],
  ["119450322","yanitabelmar@hotmail.com"],["144410483","bobita_79@hotmail.com"],["17960101K","catacoxq7@gmail.com"]  
]

lista_clientes.each do |rut_cliente, mail_cliente|
  Cliente.create( rut_cliente: rut_cliente, mail_cliente: mail_cliente )
end



lista_pregunta= [
  ["Satisfación general sucursal virtual"],
  ["Facilidad acceso con rut y clave"],
  ["Rapidez despliegue de info"],
  ["Facilidad de encontrar info"],
  ["Utilidad de la info"]
]

lista_pregunta.each do |tipo_pregunta|
  Preguntum.create( tipo_pregunta: tipo_pregunta)
end


lista_segmento= [
  ["Persona"],["Negocio"]
]

lista_segmento.each do |tipo_segmento|
  Segmento.create( tipo_segmento: tipo_segmento)
end


lista_contrato= [
  ["contrato"],["hibrido"],["prepago"],["residencial"],["vip"]
]

lista_contrato.each do |tipo_contrato|
  Contrato.create( tipo_contrato: tipo_contrato)
end



lista_fijomovil= [
  ["Fija"],["Movil"]
]

lista_fijomovil.each do |tipo_fijomovil|
  Fijomovil.create( tipo_fijomovil: tipo_fijomovil)
end


lista_indicador= [
  [1.0,1.0, 2.0,"11/10/2016"]
]

lista_indicador.each do |isn, resp_1_2, resp_4_5, fecha|
  Indicadoresdiario.create(isn: isn, resp_1_2: resp_1_2, resp_4_5: resp_4_5, fecha: fecha)
end



lista_linea= [
  [ "412381249", 1, 1, 1, 4],
  [ "993523109", 2, 1, 2, 2],
  [ "996008924", 3, 1, 2, 2],
  [ "962433771", 4, 1, 2, 1],
  [ "412436154", 5, 1, 1, 4],
  [ "225451610", 6, 1, 1, 4],
  [ "226694975", 7, 1, 1, 4],
  [ "978973213", 8, 1, 2, 1],
  [ "999091599", 9, 1, 2, 5],
  [ "971358244", 10, 1, 2, 1],
  [ "952000441", 11, 1, 2, 1],
  [ "981641652", 12, 1, 2, 1],
  [ "989260790", 13, 1, 2, 2],
  [ "712257662", 14, 1, 1, 4],
  [ "224754334", 15, 1, 1, 4],
  [ "422680760", 16, 1, 1, 4],
  [ "229430460", 17, 1, 1, 4],
  [ "412877848", 18, 1, 1, 4],
  [ "992864264", 19, 1, 2, 1],
  [ "985471305", 20, 1, 2, 3],
  [ "227746859", 21, 2, 1, 4],
  [ "971838192", 22, 1, 2, 1],
  [ "995283542", 23, 1, 2, 2],
  [ "992355566", 24, 1, 2, 2],
  [ "990245283", 25, 1, 2, 1],
  [ "961135000", 26, 1, 2, 3],
  [ "990109266", 27, 1, 2, 5],
  [ "967534008", 28, 1, 2, 3],
  [ "225355646", 29, 1, 1, 4],
  [ "993272516", 30, 1, 2, 5],
  [ "995589171", 31, 1, 2, 1],
  [ "993314979", 32, 1, 2, 5],
  [ "977348026", 33, 1, 2, 2],
  [ "966369301", 34, 1, 2, 1],
  [ "990258467", 35, 1, 2, 2],
  [ "983259689", 36, 1, 2, 2],
  [ "984626419", 37, 1, 2, 2],
  [ "993457272", 38, 1, 2, 5],
  [ "973334001", 39, 1, 2, 1],
  [ "228466558", 40, 1, 1, 4],
  [ "999050512", 41, 1, 2, 1],
  [ "990929079", 42, 1, 2, 1],
  [ "994434448", 43, 1, 2, 5],
  [ "512444181", 44, 1, 1, 4],
  [ "994395380", 45, 1, 2, 1],
  [ "990967926", 46, 1, 2, 1],
  [ "412220366", 47, 1, 1, 4],
  [ "942130116", 48, 1, 2, 1],
  [ "941500455", 49, 1, 2, 3],
  [ "981378604", 50, 1, 2, 1],
  [ "971403849", 51, 1, 2, 1],
  [ "995136627", 52, 1, 2, 1],
  [ "994864363", 53, 1, 2, 1],
  [ "994680697", 54, 1, 2, 5],
  [ "993690120", 55, 1, 2, 1],
  [ "993792124", 56, 1, 2, 1],
  [ "994265995", 57, 1, 2, 1],
  [ "989055002", 58, 1, 2, 2]
]

lista_linea.each do |numero_cliente, cliente_id, segmento_id, fijomovil_id, contrato_id|
  Linea.create( numero_cliente: numero_cliente, cliente_id: cliente_id, segmento_id: segmento_id, fijomovil_id: fijomovil_id, contrato_id: contrato_id)
end




lista_encuesta= [
  [ "11/10/2016", 1, 1],
  [ "11/10/2016", 1, 2],
  [ "11/10/2016", 1, 3],
  [ "11/10/2016", 1, 4],
  [ "11/10/2016", 1, 5],
  [ "11/10/2016", 1, 6],
  [ "11/10/2016", 0, 7],
  [ "11/10/2016", 0, 8],
  [ "11/10/2016", 1, 9],
  [ "11/10/2016", 1, 10],
  [ "11/10/2016", 1, 11],
  [ "11/10/2016", 1, 12],
  [ "11/10/2016", 0, 13],
  [ "11/10/2016", 1, 14],
  [ "11/10/2016", 1, 15],
  [ "11/10/2016", 1, 16],
  [ "11/10/2016", 1, 17],
  [ "11/10/2016", 1, 18],
  [ "11/10/2016", 1, 19],
  [ "11/10/2016", 1, 20],
  [ "11/10/2016", 1, 21],
  [ "11/10/2016", 1, 22],
  [ "11/10/2016", 1, 23],
  [ "11/10/2016", 1, 24],
  [ "11/10/2016", 0, 25],
  [ "11/10/2016", 1, 26],
  [ "11/10/2016", 1, 27],
  [ "11/10/2016", 1, 28],
  [ "11/10/2016", 1, 29],
  [ "11/10/2016", 1, 30],
  [ "11/10/2016", 1, 31],
  [ "11/10/2016", 1, 32],
  [ "11/10/2016", 1, 33],
  [ "11/10/2016", 1, 34],
  [ "11/10/2016", 0, 35],
  [ "11/10/2016", 1, 36],
  [ "11/10/2016", 1, 37],
  [ "11/10/2016", 1, 38],
  [ "11/10/2016", 1, 39],
  [ "11/10/2016", 1, 40],
  [ "11/10/2016", 1, 41],
  [ "11/10/2016", 0, 42],
  [ "11/10/2016", 1, 43],
  [ "11/10/2016", 1, 44],
  [ "11/10/2016", 1, 45],
  [ "11/10/2016", 0, 46],
  [ "11/10/2016", 1, 47],
  [ "11/10/2016", 1, 48],
  [ "11/10/2016", 1, 49],
  [ "11/10/2016", 1, 50],
  [ "11/10/2016", 1, 51],
  [ "11/10/2016", 1, 52],
  [ "11/10/2016", 1, 53],
  [ "11/10/2016", 1, 54],
  [ "11/10/2016", 1, 55],
  [ "11/10/2016", 1, 56],
  [ "11/10/2016", 1, 57],
  [ "11/10/2016", 1, 58]
]

lista_encuesta.each do |fecha_creacion_encuesta, resuelto_encuesta, linea_id|
  Encuestum.create( fecha_creacion_encuesta: fecha_creacion_encuesta, resuelto_encuesta: resuelto_encuesta, linea_id: linea_id)
end

lista_respuesta= [
[ 5 , 1 , 1 ],[ 5 , 2 , 1 ],[ 5 , 3 , 1 , ],[ 5 , 4 , 1 ],[ 5 , 5 , 1 ],
[ 5 , 1 , 2 ],[ 5 , 2 , 2 ],[ 5 , 3 , 2 , ],[ 5 , 4 , 2 ],[ 5 , 5 , 2 ],
[ 5 , 1 , 3 ],[ 5 , 2 , 3 ],[ 5 , 3 , 3 , ],[ 5 , 4 , 3 ],[ 5 , 5 , 3 ],
[ 5 , 1 , 4 ],[ 5 , 2 , 4 ],[ 5 , 3 , 4 , ],[ 5 , 4 , 4 ],[ 5 , 5 , 4 ],
[ 5 , 1 , 5 ],[ 5 , 2 , 5 ],[ 5 , 3 , 5 , ],[ 5 , 4 , 5 ],[ 5 , 5 , 5 ],
[ 4 , 1 , 6 ],[ 5 , 2 , 6 ],[ 5 , 3 , 6 , ],[ 5 , 4 , 6 ],[ 5 , 5 , 6 ],
[ 3 , 1 , 7 ],[ 5 , 2 , 7 ],[ 3 , 3 , 7 , ],[ 3 , 4 , 7 ],[ 3 , 5 , 7 ],
[ 2 , 1 , 8 ],[ 4 , 2 , 8 ],[ 4 , 3 , 8 , ],[ 2 , 4 , 8 ],[ 1 , 5 , 8 ],
[ 5 , 1 , 9 ],[ 5 , 2 , 9 ],[ 5 , 3 , 9 , ],[ 5 , 4 , 9 ],[ 5 , 5 , 9 ],
[ 5 , 1 , 10],[ 5 , 2 , 10],[ 5 , 3 , 10, ],[ 5 , 4 , 10],[ 5 , 5 , 10],
[ 4 , 1 , 11],[ 3 , 2 , 11],[ 4 , 3 , 11, ],[ 4 , 4 , 11],[ 4 , 5 , 11],
[ 3 , 1 , 12],[ 5 , 2 , 12],[ 3 , 3 , 12, ],[ 4 , 4 , 12],[ 4 , 5 , 12],
[ 5 , 1 , 13],[ 5 , 2 , 13],[ 5 , 3 , 13, ],[ 5 , 4 , 13],[ 4 , 5 , 13],
[ 4 , 1 , 14],[ 5 , 2 , 14],[ 5 , 3 , 14, ],[ 4 , 4 , 14],[ 4 , 5 , 14],
[ 4 , 1 , 15],[ 5 , 2 , 15],[ 5 , 3 , 15, ],[ 4 , 4 , 15],[ 4 , 5 , 15],
[ 4 , 1 , 16],[ 5 , 2 , 16],[ 4 , 3 , 16, ],[ 5 , 4 , 16],[ 5 , 5 , 16],
[ 4 , 1 , 17],[ 2 , 2 , 17],[ 4 , 3 , 17, ],[ 2 , 4 , 17],[ 4 , 5 , 17],
[ 4 , 1 , 18],[ 5 , 2 , 18],[ 3 , 3 , 18, ],[ 4 , 4 , 18],[ 3 , 5 , 18],
[ 5 , 1 , 19],[ 5 , 2 , 19],[ 5 , 3 , 19, ],[ 5 , 4 , 19],[ 5 , 5 , 19],
[ 4 , 1 , 10],[ 5 , 2 , 20],[ 5 , 3 , 20, ],[ 5 , 4 , 20],[ 5 , 5 , 20],
[ 5 , 1 , 11],[ 5 , 2 , 21],[ 5 , 3 , 21, ],[ 4 , 4 , 21],[ 4 , 5 , 21],
[ 5 , 1 , 12],[ 5 , 2 , 22],[ 5 , 3 , 22, ],[ 5 , 4 , 22],[ 5 , 5 , 22],
[ 5 , 1 , 13],[ 5 , 2 , 23],[ 5 , 3 , 23, ],[ 4 , 4 , 23],[ 5 , 5 , 23],
[ 3 , 1 , 14],[ 3 , 2 , 24],[ 3 , 3 , 24, ],[ 3 , 4 , 24],[ 3 , 5 , 24],
[ 1 , 1 , 15],[ 1 , 2 , 25],[ 1 , 3 , 25, ],[ 1 , 4 , 25],[ 1 , 5 , 25],
[ 4 , 1 , 16],[ 5 , 2 , 26],[ 4 , 3 , 26, ],[ 4 , 4 , 26],[ 4 , 5 , 26],
[ 5 , 1 , 17],[ 5 , 2 , 27],[ 4 , 3 , 27, ],[ 4 , 4 , 27],[ 4 , 5 , 27],
[ 4 , 1 , 18],[ 4 , 2 , 28],[ 4 , 3 , 28, ],[ 4 , 4 , 28],[ 4 , 5 , 28],
[ 4 , 1 , 19],[ 4 , 2 , 29],[ 4 , 3 , 29, ],[ 4 , 4 , 29],[ 4 , 5 , 29],
[ 5 , 1 , 20],[ 5 , 2 , 30],[ 5 , 3 , 30, ],[ 5 , 4 , 30],[ 5 , 5 , 30],
[ 5 , 1 , 21],[ 5 , 2 , 31],[ 5 , 3 , 31, ],[ 5 , 4 , 31],[ 5 , 5 , 31],
[ 4 , 1 , 22],[ 4 , 2 , 32],[ 4 , 3 , 32, ],[ 4 , 4 , 32],[ 4 , 5 , 32],
[ 5 , 1 , 23],[ 5 , 2 , 33],[ 5 , 3 , 33, ],[ 5 , 4 , 33],[ 5 , 5 , 33],
[ 5 , 1 , 24],[ 5 , 2 , 34],[ 5 , 3 , 34, ],[ 5 , 4 , 34],[ 5 , 5 , 34],
[ 1 , 1 , 25],[ 2 , 2 , 35],[ 2 , 3 , 35, ],[ 3 , 4 , 35],[ 3 , 5 , 35],
[ 5 , 1 , 26],[ 5 , 2 , 36],[ 5 , 3 , 36, ],[ 5 , 4 , 36],[ 5 , 5 , 36],
[ 5 , 1 , 27],[ 5 , 2 , 37],[ 5 , 3 , 37, ],[ 5 , 4 , 37],[ 5 , 5 , 37],
[ 5 , 1 , 28],[ 5 , 2 , 38],[ 5 , 3 , 38, ],[ 5 , 4 , 38],[ 5 , 5 , 38],
[ 5 , 1 , 29],[ 5 , 2 , 39],[ 5 , 3 , 39, ],[ 5 , 4 , 39],[ 5 , 5 , 39],
[ 4 , 1 , 30],[ 2 , 2 , 40],[ 4 , 3 , 40, ],[ 3 , 4 , 40],[ 3 , 5 , 40],
[ 5 , 1 , 31],[ 5 , 2 , 41],[ 5 , 3 , 41, ],[ 5 , 4 , 41],[ 4 , 5 , 41],
[ 1 , 1 , 32],[ 5 , 2 , 42],[ 4 , 3 , 42, ],[ 4 , 4 , 42],[ 4 , 5 , 42],
[ 5 , 1 , 33],[ 5 , 2 , 43],[ 5 , 3 , 43, ],[ 5 , 4 , 43],[ 5 , 5 , 43],
[ 5 , 1 , 34],[ 5 , 2 , 44],[ 5 , 3 , 44, ],[ 5 , 4 , 44],[ 5 , 5 , 44],
[ 5 , 1 , 35],[ 5 , 2 , 45],[ 5 , 3 , 45, ],[ 5 , 4 , 45],[ 5 , 5 , 45],
[ 1 , 1 , 36],[ 1 , 2 , 46],[ 1 , 3 , 46, ],[ 1 , 4 , 46],[ 1 , 5 , 46],
[ 4 , 1 , 37],[ 4 , 2 , 47],[ 4 , 3 , 47, ],[ 4 , 4 , 47],[ 4 , 5 , 47],
[ 5 , 1 , 38],[ 5 , 2 , 48],[ 5 , 3 , 48, ],[ 5 , 4 , 48],[ 5 , 5 , 48],
[ 5 , 1 , 39],[ 5 , 2 , 59],[ 5 , 3 , 59, ],[ 5 , 4 , 59],[ 5 , 5 , 59],
[ 4 , 1 , 40],[ 4 , 2 , 50],[ 5 , 3 , 50, ],[ 4 , 4 , 50],[ 4 , 5 , 50],
[ 5 , 1 , 41],[ 5 , 2 , 51],[ 5 , 3 , 51, ],[ 4 , 4 , 51],[ 5 , 5 , 51],
[ 5 , 1 , 42],[ 5 , 2 , 52],[ 5 , 3 , 52, ],[ 5 , 4 , 52],[ 4 , 5 , 52],
[ 5 , 1 , 43],[ 5 , 2 , 53],[ 5 , 3 , 53, ],[ 5 , 4 , 53],[ 5 , 5 , 53],
[ 5 , 1 , 44],[ 5 , 2 , 54],[ 5 , 3 , 54, ],[ 5 , 4 , 54],[ 5 , 5 , 54],
[ 4 , 1 , 45],[ 4 , 2 , 55],[ 3 , 3 , 55, ],[ 3 , 4 , 55],[ 5 , 5 , 55],
[ 5 , 1 , 46],[ 5 , 2 , 56],[ 5 , 3 , 56, ],[ 5 , 4 , 56],[ 5 , 5 , 56],
[ 5 , 1 , 47],[ 5 , 2 , 57],[ 5 , 3 , 57, ],[ 5 , 4 , 57],[ 5 , 5 , 57],
[ 4 , 1 , 48],[ 5 , 2 , 58],[ 5 , 3 , 58, ],[ 4 , 4 , 58],[ 4 , 5 , 58]

]

lista_respuesta.each do | valor_pregunta, preguntum_id, encuestum_id |
  Respuestum.create( valor_pregunta: valor_pregunta, preguntum_id: preguntum_id, encuestum_id: encuestum_id)
end

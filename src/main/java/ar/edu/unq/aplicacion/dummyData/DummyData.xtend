package ar.edu.unq.aplicacion.dummyData

import ar.edu.unq.acahaygatoencerrado.dominio.ServidorDeLaberintos
import ar.edu.unq.acahaygatoencerrado.dominio.Jugador
import ar.edu.unq.acahaygatoencerrado.dominio.CreadorDeLaberintos
import ar.edu.unq.acahaygatoencerrado.dominio.Laberinto
import ar.edu.unq.acahaygatoencerrado.dominio.Item
import ar.edu.unq.acahaygatoencerrado.dominio.Habitacion

class DummyData {

	ServidorDeLaberintos servidor
	CreadorDeLaberintos creadorDeLaberintos
	Jugador jugador

	new(){
		
		creadorDeLaberintos = new CreadorDeLaberintos

		servidor = new ServidorDeLaberintos
		servidor.registrar(creadorDeLaberintos)

		creadorDeLaberintos.agregarLaberinto(getLaberintoNostromo)
		creadorDeLaberintos.agregarLaberinto(getLaberintoCarcel)
		creadorDeLaberintos.agregarLaberinto(getLaberintoUNQui)
		creadorDeLaberintos.agregarLaberinto(getLaberintoIncompleto)

		servidor.habilitarLaberintosQueEstenEnCondicionesDeSerJugados

		jugador = new Jugador => [
			it.nombre = "Pepe Default"
		]
	}

	def getLaberintos(){
		servidor.getLaberintos
	}
	
	def getJugador(){
		jugador
	}
	
	def jugarLaberinto(Integer idLaberinto) {
		jugador.jugarLaberinto(servidor.getLaberinto(idLaberinto))
	}

	def getLaberintoNostromo(){
		new Laberinto => [

			nombre = "Nostromo"
			descripcion = "Estabas ocupado haciendo lo segundo y, como no se escuchan los gritos en el " +
			"espacio, nadie escuchó tus gritos pidiendo que alguien te alcance un rollo de papel higiénico. " +
			"Te las arreglaste pegándote una ducha y no te diste cuenta de que Alien mató a tus amigos. " +
			"Ahora, procurando no resbalarte, vas a tener que tratar de escapar de esta nave."

			agregarHabitacion(crearHabitacion("Vestuario"))
			agregarHabitacion(crearHabitacion("Comedor"))
			agregarHabitacion(crearHabitacion("Puerto"))
			agregarHabitacion(crearHabitacion("Nave Auxiliar"))

			//DEFINIMOS HABITACIONES INICIAL Y FINAL
				habitacionInicial = habitaciones.get(0)
				//Vestuario es la habitacionInicial
				habitacionFinal = habitaciones.get(3)
				//Nave Auxiliar es la habitacionFinal

			//CREAMOS ACCIONES DE IR A OTRA HABITACION
				habitaciones.get(1).crearAccionDeIrAOtraHabitacion(habitaciones.get(2))
				//del Comedor puedo ir al Puerto
				habitaciones.get(2).crearAccionDeIrAOtraHabitacion(habitaciones.get(1))
				//del Puerto puedo ir al Comedor
				
			//CREAMOS ACCIONES DE AGARRAR UN ITEM
				habitaciones.get(0).crearAccionDeAgarrarUnElemento("Ropa")
				//en el Vestuario puedo agarrar Ropa
				habitaciones.get(1).crearAccionDeAgarrarUnElemento("Servilleta con password escrita")
				//en el Comedor puedo agarrar Servilleta con password escrita

			//CREAMOS ACCIONES DE USAR UN ITEM PARA AGARRAR OTRO ITEM
				habitaciones.get(0).crearAccionDeUsarUnItem(
					habitaciones.get(0).acciones.get(0).itemAgarrable.get(0),
					new Item => [ nombre = "Descencia" ])
					//en el Vestuario puedo usar Ropa para obtener Descencia

			//CREAMOS ACCIONES DE USAR UN ITEM PARA IR A OTRA HABITACION
				habitaciones.get(0).crearAccionDeUsarUnItem(
					habitaciones.get(0).acciones.get(1).itemAgarrable.get(0),
					habitaciones.get(1))
					//en el Baño puedo usar Descencia para ir al Comedor
				habitaciones.get(2).crearAccionDeUsarUnItem(
					habitaciones.get(1).acciones.get(1).itemAgarrable.get(0),
					habitaciones.get(3))
					//en el Puerto puedo usar la Servilleta con password escrita
					//para ir a la Nave Auxiliar
		]
	}

	def getLaberintoCarcel(){
		new Laberinto => [

			nombre = "Carcel"
			descripcion = "Por enamorarte de la hija del comisario terminaste tras las rejas. " +
			"Pero sos una persona inteligente y estuviste preparando un excelente plan para escapar. " +
			"Lástima que no tenés buena memoria y ahora no te acordás qué cosas tenés que usar para " +
			"poder salir... Es que estar enamorado no te deja pensar bien."
			
			agregarHabitacion(crearHabitacion("Calabozo"))
			agregarHabitacion(crearHabitacion("Tunel"))
			agregarHabitacion(crearHabitacion("Cocina"))
			agregarHabitacion(crearHabitacion("Sala de primeros auxilios"))
			agregarHabitacion(crearHabitacion("Calle"))

			//DEFINIMOS HABITACIONES INICIAL Y FINAL
				habitacionInicial = habitaciones.get(0)
				//Calabozo es la habitacionInicial
				habitacionFinal = habitaciones.get(4)
				//Calle es la habitacionFinal

			//CREAMOS ACCIONES DE IR A OTRA HABITACION
				habitaciones.get(1).crearAccionDeIrAOtraHabitacion(habitaciones.get(0))
				//del Tunel puedo ir al Calabozo
				habitaciones.get(1).crearAccionDeIrAOtraHabitacion(habitaciones.get(2))
				//del Tunel puedo ir a la Cocina
				habitaciones.get(2).crearAccionDeIrAOtraHabitacion(habitaciones.get(1))
				//de la Cocina puedo ir al Tunel
			//CREAMOS ACCIONES DE AGARRAR UN ITEM
				habitaciones.get(0).crearAccionDeAgarrarUnElemento("Cuchara")
				//en el Calabozo puedo obtener Cuchara
				habitaciones.get(1).crearAccionDeAgarrarUnElemento("Rata")
				//en el Tunel puedo obtener Rata
				habitaciones.get(2).crearAccionDeAgarrarUnElemento("Detergente")
				//en la Cocina puedo obtener Detergente
			//CREAMOS ACCIONES DE USAR UN ITEM PARA AGARRAR OTRO ITEM
				habitaciones.get(0).crearAccionDeUsarUnItem(
					habitaciones.get(2).acciones.get(1).itemAgarrable.get(0),
					new Item => [ nombre = "Enfermedad"])
					//en el Calabozo puedo usar Detergente para obtener Enfermedad
				habitaciones.get(3).crearAccionDeUsarUnItem(
					habitaciones.get(1).acciones.get(2).itemAgarrable.get(0),
					new Item => [ nombre = "Distracción"])
					//en la Sala de Primeros Auxilios puedo usar Rata para obtener Distracción
			//CREAMOS ACCIONES DE USAR UN ITEM PARA IR A OTRA HABITACION
				habitaciones.get(0).crearAccionDeUsarUnItem(
					habitaciones.get(0).acciones.get(0).itemAgarrable.get(0),
					habitaciones.get(1))
					//en el Calabozo puedo usar Cuchara para ir al Tunel
				habitaciones.get(0).crearAccionDeUsarUnItem(
					habitaciones.get(0).acciones.get(1).itemAgarrable.get(0),
					habitaciones.get(3))
					//en el Calabozo pueso usar Enfermedad para ir a la Sala de Primeros Auxilios
				habitaciones.get(3).crearAccionDeUsarUnItem(
					habitaciones.get(3).acciones.get(0).itemAgarrable.get(0),
					habitaciones.get(4))
					//en la Sala de Primeros Auxilios puedo usar Distracción para ir a la Calle
		]
	}

	def getLaberintoUNQui(){
		new Laberinto => [
			
			nombre = "UNQui"
			descripcion = "Estás estudiando para ser un gran programador, pero tenés un maquiavélico parcial" +
			" dentro de unas horas. Estás en el API, con tu PC y todos los test te siguen fallando. " +
			"Y encima estás en silla de ruedas por herir tu columna de tanto cargar la notebook de" +
			" acá para allá. Tenés que prepararte, rendirlo bien y salir orgulloso de tu sapienza." +
			"¿Vas a llegar?"

			agregarHabitacion(crearHabitacion("API"))
			agregarHabitacion(crearHabitacion("Ascensor"))
			agregarHabitacion(crearHabitacion("Aula 60"))
			agregarHabitacion(crearHabitacion("Aula 37-B"))
			agregarHabitacion(crearHabitacion("Hall de la Planta Baja"))
			agregarHabitacion(crearHabitacion("Hall del Primer Piso"))
			agregarHabitacion(crearHabitacion("Hall del Segundo Piso"))
			agregarHabitacion(crearHabitacion("Oficina de TPI y LDS"))
			agregarHabitacion(crearHabitacion("Patio"))

			//DEFINIMOS HABITACIONES INICIAL Y FINAL
				habitacionInicial = habitaciones.get(0)
				//API es la habitacionInicial
				habitacionFinal = habitaciones.get(8)
				//Calle es la habitacionFinal

			//CREAMOS ACCIONES DE IR A OTRA HABITACION
		
			//CREAMOS ACCIONES DE AGARRAR UN ITEM
			
			//CREAMOS ACCIONES DE USAR UN ITEM PARA IR A OTRA HABITACION
			
			//CREAMOS ACCIONES DE USAR UN ITEM PARA AGARRAR OTRO ITEM
			
		]
	}

	def getLaberintoIncompleto(){
		new Laberinto => [
			nombre="INCOMPLETO"
			descripcion="Este laberinto no debe aparecer ya que no está en condiciones de ser jugado"
		]
	}

	def crearHabitacion(String nombreHabitacion) {
		new Habitacion => [
			nombre = nombreHabitacion
		]
	}
}
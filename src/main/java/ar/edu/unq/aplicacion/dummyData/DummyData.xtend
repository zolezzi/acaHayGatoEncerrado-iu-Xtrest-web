package ar.edu.unq.aplicacion.dummyData

import org.uqbar.commons.utils.Observable
import ar.edu.unq.acahaygatoencerrado.dominio.Laberinto
import java.util.List
import java.util.ArrayList
import ar.edu.unq.acahaygatoencerrado.dominio.Habitacion
import ar.edu.unq.acahaygatoencerrado.dominio.Item
import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.unq.acahaygatoencerrado.dominio.Jugador
import java.util.NoSuchElementException

@Accessors
@Observable
class DummyData {
	
	List<Laberinto> laberintos
	Jugador jugador

	new(){

		jugador = new Jugador => [
			it.nombre = "Pepe Default"
		]
		
		laberintos = new ArrayList<Laberinto>
		
		crearLaberintoNostromo
		crearLaberintoCasaEmbrujada
		crearLaberintoUNQui
		
		habilitarTodosLosLaberintos
		
		crearLaberintoFalso
	}

	def habilitarTodosLosLaberintos(){

		for(laberinto : laberintos){
			laberinto.disponibilidad = true
		}
	}

	def crearLaberintoNostromo(){

		laberintos.add(new Laberinto => [
			
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

		])
	}
	
	def crearLaberintoCasaEmbrujada(){

		laberintos.add(new Laberinto => [
			
			nombre = "Carcel"
			descripcion = "Por enamorarte de la hija del comisario terminaste tras las rejas. " +
			"Pero sos una persona inteligente y estuviste preparando un excelente plan para escapar. " +
			"Lástima que no tenés buena memoria y ahora no te acordás qué cosas tenés que usar para " +
			"poder salir... Es que estar enamorado no te deja pensar bien."
			
			agregarHabitacion(crearHabitacion("Calabozo"))
			agregarHabitacion(crearHabitacion("Sala de Tortura"))
			agregarHabitacion(crearHabitacion("Comedor"))
			agregarHabitacion(crearHabitacion("Patio"))
			agregarHabitacion(crearHabitacion("Calle"))
			
			//DEFINIMOS HABITACIONES INICIAL Y FINAL
				habitacionInicial = habitaciones.get(0)
				//Calabozo es la habitacionInicial
				habitacionFinal = habitaciones.get(4)
				//Calle es la habitacionFinal

			//CREAMOS ACCIONES DE IR A OTRA HABITACION
		
			//CREAMOS ACCIONES DE AGARRAR UN ITEM
			
			//CREAMOS ACCIONES DE USAR UN ITEM PARA IR A OTRA HABITACION
			
			//CREAMOS ACCIONES DE USAR UN ITEM PARA AGARRAR OTRO ITEM
		
		])
	}
	
	def crearLaberintoUNQui(){

		laberintos.add(new Laberinto => [
			
			nombre = "UNQui"
			descripcion = "Estás estudiando para ser un gran programador, pero tenés un maquiavélico parcial" +
			" dentro de unas horas. Estás en el API, con tu PC y todos los test te siguen fallando. " +
			"Tenés que prepararte, rendirlo bien y salir orgulloso de tu sapienza. ¿Vas a llegar? "
			
			agregarHabitacion(crearHabitacion("API"))
			agregarHabitacion(crearHabitacion("Ascensor"))
			agregarHabitacion(crearHabitacion("Aula 60"))
			agregarHabitacion(crearHabitacion("Calle"))

			//DEFINIMOS HABITACIONES INICIAL Y FINAL
				habitacionInicial = habitaciones.get(0)
				//API es la habitacionInicial
				habitacionFinal = habitaciones.get(3)
				//Calle es la habitacionFinal
		
			//CREAMOS ACCIONES DE IR A OTRA HABITACION
		
			//CREAMOS ACCIONES DE AGARRAR UN ITEM
			
			//CREAMOS ACCIONES DE USAR UN ITEM PARA IR A OTRA HABITACION
			
			//CREAMOS ACCIONES DE USAR UN ITEM PARA AGARRAR OTRO ITEM
		
		])
	}

	def crearLaberintoFalso(){
		laberintos.add(new Laberinto => [
			nombre="FALSO"
			descripcion="Este laberinto no debe aparecer"
		])
	}

	def crearHabitacion(String nombreHabitacion) {
		new Habitacion => [
			nombre = nombreHabitacion
		]
	}
	
	def Laberinto getLaberinto(String nombreLaberinto) {
		val laberinto = this.laberintos.findFirst[it.nombre == nombreLaberinto]
		if(laberinto == null) {
			throw new NoSuchElementException('''No hay ningún laberinto que se llame «nombreLaberinto»''')
		}
	}
}
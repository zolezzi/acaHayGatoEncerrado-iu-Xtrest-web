package ar.edu.unq.aplicacion.dummyData

import org.uqbar.commons.utils.Observable
import ar.edu.unq.acahaygatoencerrado.dominio.Laberinto
import java.util.List
import java.util.ArrayList
import ar.edu.unq.acahaygatoencerrado.dominio.Habitacion
import ar.edu.unq.acahaygatoencerrado.dominio.Item
import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.unq.acahaygatoencerrado.dominio.Jugador

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

			agregarHabitacion(crearHabitacion("Vestuario"))
			agregarHabitacion(crearHabitacion("Comedor"))
			agregarHabitacion(crearHabitacion("Puerto"))
			agregarHabitacion(crearHabitacion("Nave"))

			//DEFINIMOS HABITACIONES INICIAL Y FINAL
				habitacionInicial = habitaciones.get(0)
				//Vestuario es la habitacionInicial
				habitacionFinal = habitaciones.get(3)
				//Nave es la habitacionFinal

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
					new Item => [ nombre = "Manos limpias" ])
					//en el Vestuario puedo usar Ropa para obtener Manos limpias

			//CREAMOS ACCIONES DE USAR UN ITEM PARA IR A OTRA HABITACION
				habitaciones.get(0).crearAccionDeUsarUnItem(
					habitaciones.get(0).acciones.get(1).itemAgarrable.get(0),
					habitaciones.get(1))
					//en el Baño puedo usar las Manos limpias para ir al Comedor
				habitaciones.get(2).crearAccionDeUsarUnItem(
					habitaciones.get(1).acciones.get(1).itemAgarrable.get(0),
					habitaciones.get(3))
					//en el Puerto puedo usar la Servilleta con contraseña escrita
					//para ir a la Cápsula de Escape

		])
	}
	
	def crearLaberintoCasaEmbrujada(){

		laberintos.add(new Laberinto => [
			
			nombre = "Carcel"
			
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
		laberintos.add(new Laberinto => [nombre="Laberinto no disponible"])
	}

	def crearHabitacion(String nombreHabitacion) {
		new Habitacion => [
			nombre = nombreHabitacion
		]
	}

	def getLaberinto(String nombreLaberinto) {
		var Laberinto resultadoLaberinto = null
		for(laberinto : laberintos){
			if(laberinto.nombre == nombreLaberinto){
				resultadoLaberinto = laberinto
			}
		}
		resultadoLaberinto
	}
}
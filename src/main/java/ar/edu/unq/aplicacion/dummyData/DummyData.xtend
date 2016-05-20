package ar.edu.unq.aplicacion.dummyData

import org.uqbar.commons.utils.Observable
import ar.edu.unq.acahaygatoencerrado.dominio.Laberinto
import java.util.List
import java.util.ArrayList
import ar.edu.unq.acahaygatoencerrado.dominio.Habitacion
import ar.edu.unq.acahaygatoencerrado.dominio.Item
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
@Observable
class DummyData {
	
	List<Laberinto> laberintos
	
	new(){
		laberintos = new ArrayList<Laberinto>
		
		crearLaberintoNostromo
		crearLaberintoCasaEmbrujada
		crearLaberintoUNQui
		
		habilitarTodosLosLaberintos
	}

	def habilitarTodosLosLaberintos(){

		for(laberinto : laberintos){
			laberinto.disponibilidad = true
		}
	}

	def laberintosDisponibles(){
		
		var List<Laberinto> laberintosDisponibles = new ArrayList<Laberinto>
		for(laberinto : laberintos){
			if(laberinto.disponibilidad){
				laberintosDisponibles.add(laberinto)
			}
		}
		laberintosDisponibles
	}

	def crearLaberintoNostromo(){

		laberintos.add(new Laberinto => [
			
			nombre = "Nostromo"

			agregarHabitacion(crearHabitacion("Baño"))
			agregarHabitacion(crearHabitacion("Comedor"))
			agregarHabitacion(crearHabitacion("Puerto"))
			agregarHabitacion(crearHabitacion("Cápsula de Escape"))

			//DEFINIMOS HABITACIONES INICIAL Y FINAL
				habitacionInicial = habitaciones.get(0)
				//Baño es la habitacionInicial
				habitacionFinal = habitaciones.get(3)
				//Cápsula de Escape es la habitacionFinal

			//CREAMOS ACCIONES DE IR A OTRA HABITACION
				habitaciones.get(1).crearAccionDeIrAOtraHabitacion(habitaciones.get(2))
				//del Comedor puedo ir al Puerto
				habitaciones.get(2).crearAccionDeIrAOtraHabitacion(habitaciones.get(1))
				//del Puerto puedo ir al Comedor
				
			//CREAMOS ACCIONES DE AGARRAR UN ITEM
				habitaciones.get(0).crearAccionDeAgarrarUnElemento("Jabón")
				//en el Baño puedo agarrar Jabón
				habitaciones.get(1).crearAccionDeAgarrarUnElemento("Servilleta con contraseña escrita")

			//CREAMOS ACCIONES DE USAR UN ITEM PARA AGARRAR OTRO ITEM
				habitaciones.get(0).crearAccionDeUsarUnItem(
					habitaciones.get(0).acciones.get(0).itemAgarrable.get(0),
					new Item => [ nombre = "Manos limpias" ])
					//en el Baño puedo usar Jabón para obtener Manos limpias

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
			
			nombre = "Casa Embrujada"
			
			agregarHabitacion(crearHabitacion("Calabozo"))
			agregarHabitacion(crearHabitacion("Sala de Tortura"))
			agregarHabitacion(crearHabitacion("Living-Comedor"))
			agregarHabitacion(crearHabitacion("Patio"))
			
			//DEFINIMOS HABITACIONES INICIAL Y FINAL
				habitacionInicial = habitaciones.get(0)
				//Calabozo es la habitacionInicial
				habitacionFinal = habitaciones.get(3)
				//Patio es la habitacionFinal

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

	def crearHabitacion(String nombreHabitacion) {
		new Habitacion => [
			nombre = nombreHabitacion
		]
	}
}
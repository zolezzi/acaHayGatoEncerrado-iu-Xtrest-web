package ar.edu.unq.aplicacion.dummyData

import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.unq.acahaygatoencerrado.dominio.Laberinto
import java.util.List
import java.util.ArrayList
import ar.edu.unq.acahaygatoencerrado.dominio.Habitacion

@Accessors
@Observable
class DummyData {
	
	List<Laberinto> laberintos
	
	new(){
		laberintos = new ArrayList<Laberinto>
		crearDummyData
	}
	
	def crearDummyData(){
		
		crearLaberintoNostromo
		crearLaberintoCasaEmbrujada
		crearLaberintoUNQui
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
				habitaciones.get(0).crearAccionDeIrAOtraHabitacion(habitaciones.get(1))
				//del Baño puedo ir al Comedor
				habitaciones.get(1).crearAccionDeIrAOtraHabitacion(habitaciones.get(0))
				habitaciones.get(1).crearAccionDeIrAOtraHabitacion(habitaciones.get(2))
				//del Comedor puedo ir al Baño y al Puerto
				habitaciones.get(2).crearAccionDeIrAOtraHabitacion(habitaciones.get(1))
				//del Puerto puedo ir al Comedor
		])
	}
	
	def crearLaberintoCasaEmbrujada(){

		laberintos.add(new Laberinto => [
			
			nombre = "Casa Embrujada"
		])
	}
	
	def crearLaberintoUNQui(){

		laberintos.add(new Laberinto => [
			
			nombre = "UNQui"
		])
	}

	def crearHabitacion(String nombreHabitacion) {
		new Habitacion => [
			nombre = nombreHabitacion
		]
	}
}
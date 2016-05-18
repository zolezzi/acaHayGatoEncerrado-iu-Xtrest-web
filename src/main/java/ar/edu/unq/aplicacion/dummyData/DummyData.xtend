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
		crearLaberintoDummy
	}
	
	def crearLaberintoDummy(){
		laberintos.add(new Laberinto => [
			
			nombre = "Nostromo"
			agregarHabitacion(crearHabitacion("Baño"))
			habitacionInicial = habitaciones.get(0)
			
			agregarHabitacion(crearHabitacion("Comedor"))
			habitaciones.get(0).crearAccionDeIrAOtraHabitacion(habitaciones.get(1))
//			habitaciones.get(1).crearAccionDeIrAOtraHabitacion(habitaciones.get(0))
			
			agregarHabitacion(crearHabitacion("Puerto"))
			habitaciones.get(1).crearAccionDeIrAOtraHabitacion(habitaciones.get(2))
//			habitaciones.get(2).crearAccionDeIrAOtraHabitacion(habitaciones.get(1))
			
			agregarHabitacion(crearHabitacion("Cápsula de Escape"))
			habitacionFinal = habitaciones.get(3)
		])
	}

	def crearHabitacion(String nombreHabitacion) {
		new Habitacion => [
			nombre = nombreHabitacion
		]
	}
}
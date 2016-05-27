package ar.edu.unq.aplicacion.web

import ar.edu.unq.aplicacion.dummyData.DummyData
import org.uqbar.xtrest.api.Result
import org.uqbar.xtrest.api.XTRest
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.json.JSONUtils
import java.util.NoSuchElementException

@Controller
class LaberintosController {
	
	extension JSONUtils = new JSONUtils
	val dummyData = new DummyData
	
	@Get("/laberintos")
	def Result laberintos(){
		
		ok(dummyData.getLaberintos.toJson)
	}
	
	@Get("/jugador")
	def Result jugador(){
		
		ok(dummyData.getJugador.toJson)
	}
	
	@Get("/:nombreLaberinto")
	def Result seleccionarLaberinto(String nombre){
		try{
			response.contentType = "application/json"
			ok(dummyData.getLaberinto(nombreLaberinto).toJson)
		} catch (NoSuchElementException nse) {
			notFound('''No se encontró ningún laberinto que se llame «nombreLaberinto»''')
		}
	}

	def static void main(String[] args) {
		XTRest.start(LaberintosController, 9777)
	}
}
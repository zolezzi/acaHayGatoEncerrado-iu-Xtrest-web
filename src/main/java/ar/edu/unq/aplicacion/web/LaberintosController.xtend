package ar.edu.unq.aplicacion.web

import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.XTRest
import org.uqbar.xtrest.json.JSONUtils
import org.uqbar.xtrest.api.Result
import ar.edu.unq.aplicacion.dummyData.DummyData
import ar.edu.unq.acahaygatoencerrado.dominio.Laberinto

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
	def Result seleccionarLaberinto(){
		
		var Laberinto laberintoSeleccionado = dummyData.getLaberinto(nombreLaberinto)
		
		ok(laberintoSeleccionado.toJson)
	}

	def static void main(String[] args) {
		XTRest.start(LaberintosController, 9777)
	}
}
package ar.edu.unq.aplicacion.web

import ar.edu.unq.aplicacion.dummyData.DummyData
import org.uqbar.xtrest.api.Result
import org.uqbar.xtrest.api.XTRest
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.json.JSONUtils

@Controller
class LaberintosController {
	
	extension JSONUtils = new JSONUtils
	var dummyData = new DummyData
	
	@Get("/laberintos")
	def Result laberintos(){
		
		ok(dummyData.getLaberintos.toJson)
	}
	
	@Get("/jugador")
	def Result jugador(){
		
		ok(dummyData.getJugador.toJson)
	}

	def static void main(String[] args) {
		XTRest.start(LaberintosController, 9777)
	}
}
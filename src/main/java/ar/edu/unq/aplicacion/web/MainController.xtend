package ar.edu.unq.aplicacion.web

import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.XTRest
import org.uqbar.xtrest.json.JSONUtils
import org.uqbar.xtrest.api.Result
import ar.edu.unq.aplicacion.dummyData.DummyData

@Controller
class MainController {
	
	extension JSONUtils = new JSONUtils
	
	@Get("/laberintosDisponibles")
	def Result laberintosDisponibles(){

		val laberintos = new DummyData().laberintos
		ok(laberintos.toJson)
	}
	
	def static void main(String[] args) {
		XTRest.start(MainController, 9777)
	}
}
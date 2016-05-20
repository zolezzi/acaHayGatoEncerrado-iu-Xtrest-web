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
	val dummyData = new DummyData
	
	@Get("/laberintos")
	def Result laberintos(){
		
		ok(dummyData.laberintos.toJson)
	}

	@Get("/laberintosDisponibles")
	def Result laberintosDisponibles(){

		ok(dummyData.laberintosDisponibles.toJson)
	}

	def static void main(String[] args) {
		XTRest.start(MainController, 9777)
	}
}
package ar.edu.unq.aplicacion.web

import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.XTRest

@Controller
class MainController {
	
	@Get("/inicio")
	def inicio(){

		ok("Acá Hay Gato Encerrado...")
	}
	
	def static void main(String[] args) {
		XTRest.start(MainController, 9777)
	}
}
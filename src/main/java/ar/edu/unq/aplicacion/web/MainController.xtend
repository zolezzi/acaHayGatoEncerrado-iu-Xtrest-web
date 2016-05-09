package ar.edu.unq.aplicacion.web

import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.json.JSONUtils
import org.uqbar.xtrest.api.annotation.Get

@Controller
class MainController {

	extension JSONUtils = new JSONUtils
	
	@Get("/inicio")
	def inicio(){
		ok("")
	}
}
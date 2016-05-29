package ar.edu.unq.aplicacion.web

import ar.edu.unq.acahaygatoencerrado.dominio.Laberinto
import ar.edu.unq.aplicacion.dummyData.DummyData
import org.uqbar.xtrest.api.Result
import org.uqbar.xtrest.api.XTRest
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.json.JSONUtils
import org.uqbar.commons.model.UserException

@Controller
class JuegoController {
	
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
	
	@Get("/jugar/:idLaberinto")
	def Result jugarLaberinto(){
		val iId = Integer.valueOf(idLaberinto)
		try {
			response.contentType = "application/json"
			dummyData.jugarLaberinto(iId)
			ok(dummyData.getJugador.toJson)
		}
		catch (UserException e) {
			notFound("No existe laberinto con id '" + idLaberinto + "'");
		}
	}

	def static void main(String[] args) {
		XTRest.start(JuegoController, 9777)
	}
}
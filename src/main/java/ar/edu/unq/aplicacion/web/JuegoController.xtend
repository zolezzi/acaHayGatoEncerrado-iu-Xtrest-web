package ar.edu.unq.aplicacion.web

import ar.edu.unq.acahaygatoencerrado.web.JuegoAppModel
import org.uqbar.commons.model.UserException
import org.uqbar.xtrest.api.Result
import org.uqbar.xtrest.api.XTRest
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.json.JSONUtils
import ar.edu.unq.acahaygatoencerrado.dummyData.DummyData

@Controller
class JuegoController {
	
	extension JSONUtils = new JSONUtils
	var juegoAppModel = new JuegoAppModel(new DummyData)
	
	@Get("/laberintos")
	def Result laberintos(){
		
		ok(juegoAppModel.getLaberintos.toJson)
	}
	
	@Get("/jugador/:idJugador")
	def Result jugador(){
		val id = Integer.valueOf(idJugador)
		
		ok(juegoAppModel.getJugador(id).toJson)
	}
	
	@Get("/jugar/:idLaberinto/:idJugador")
	def Result jugarLaberinto(){
		val idLab = Integer.valueOf(idLaberinto)
		val idJug = Integer.valueOf(idJugador)
		try {
			response.contentType = "application/json"
			juegoAppModel.jugarLaberinto(idLab,iIdJug)
			ok(juegoAppModel.getJugador(idJug).toJson)
		}
		catch (UserException e) {
			notFound("No existe laberinto con id '" + idLaberinto + "'");
		}
	}
	
	@Get("/hacer/:idAccion/:idJugador")
	def Result hacerAccion(){
		val idAcc = Integer.valueOf(idAccion)
		val idJug = Integer.valueOf(idJugador)
		try{
			response.contentType = "application/json"
			juegoAppModel.hacerAccion(idAcc,idJug)
			ok(juegoAppModel.getJugador(idJug).toJson)
		}
		catch (UserException e){
			notFound("No existe accion con id '" + idAccion + "'")
		}
	}
	
	@Get("/ganador/:idLaberinto/:idJugador")
	def Result ganador(){
		val idLab = Integer.valueOf(idLaberinto)
		val idJug = Integer.valueOf(idJugador)
		
		try{
			response.contentType= "application/json"
			ok((juegoAppModel.getLaberinto(idLab).getHabitacionFinal
								==
				juegoAppModel.getJugador(idJug).habitacionActual).toJson)
		} catch(UserException e){
			notFound("No existe resultado para el laberinto con id'" + idLaberinto + "'")
		}
	}
	
	@Get("/ganar/:idLaberinto/:idJugador")
	def Result ganar(){
		val idLab = Integer.valueOf(idLaberinto)
		val idJug = Integer.valueOf(idJugador)
		juegoAppModel.getLaberinto(idLab).agregarGanador(idJug)
		ok()
	}

	def static void main(String[] args) {
		XTRest.start(JuegoController, 9777)
	}
}
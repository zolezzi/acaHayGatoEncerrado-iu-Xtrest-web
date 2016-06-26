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
	
	@Get("/laberintos/:idLaberinto")
	def Result laberinto(){
		val idLab = Integer.valueOf(idLaberinto)
		try {
			response.contentType = "application/json"
			ok(juegoAppModel.getLaberinto(idLab).toJson)
		}
		catch (UserException e) {
			notFound("No existe laberinto con id '" + idLaberinto + "'")
		}
		
		
	}
	
	@Get("/jugador")
	def Result jugador(){
		
		ok(juegoAppModel.getJugador().toJson)
	}
	
	@Get("/inventario")
	def Result inventario(){
		
		ok(juegoAppModel.getJugador.getInventario().toJson)
	}
	
	@Get("/jugar/:idLaberinto")
	def Result jugarLaberinto(){
		val idLab = Integer.valueOf(idLaberinto)
		try {
			response.contentType = "application/json"
			juegoAppModel.jugarLaberinto(idLab)
			ok(juegoAppModel.getJugador().toJson)
		}
		catch (UserException e) {
			notFound("No existe laberinto con id '" + idLaberinto + "'")
		}
	}
	
	@Get("/hacer/:idAccion")
	def Result hacerAccion(){
		val idAcc = Integer.valueOf(idAccion)
		try{
			response.contentType = "application/json"
			juegoAppModel.hacerAccion(idAcc)
			ok(juegoAppModel.getJugador().toJson)
		}
		catch (UserException e){
			notFound("No existe accion con id '" + idAccion + "'")
		}
	}
	
	@Get("/ganador/:idLaberinto")
	def Result ganar(){
		val idLab = Integer.valueOf(idLaberinto)
		
		try{
			response.contentType= "application/json"
			ok((juegoAppModel.jugadorGanoElLaberinto(idLab)).toJson)
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
	
	@Get("/abandonar/:idLaberinto")
	def Result abandonar(){
		val idLab = Integer.valueOf(idLaberinto)
		juegoAppModel.getLaberinto(idLab).disponibilidad = true
		ok()
	}

	@Get("/tirar/:idItem")
	def Result tirar(){
		val itemId = Integer.valueOf(idItem)
		
		juegoAppModel.getJugador.quitar(itemId)
		ok(juegoAppModel.getJugador().toJson)
	}

	def static void main(String[] args) {
		XTRest.start(JuegoController, 9777)
	}
}
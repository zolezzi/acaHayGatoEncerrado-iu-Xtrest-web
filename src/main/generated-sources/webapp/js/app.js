var laberintos = [{"nombre":"Nostromo",
			"habitaciones":	[{"nombre":"Baño",
						"acciones":[	{"nombre":"Agarrar Jabón"},
								{"nombre":"Usar Jabón para obtener Manos limpias"},
								{"nombre":"Usar Manos limpias para ir a Comedor"}]},
					{"nombre":"Comedor",
						"acciones":[	{"nombre":"Ir a Puerto"},
								{"nombre":"Agarrar Servilleta con contraseña escrita"}]},
					{"nombre":"Puerto",
						"acciones":[	{"nombre":"Ir a Comedor"},
								{"nombre":"Usar Servilleta con contraseña escrita para ir a Cápsula de Escape"}]},
					{"nombre":"Cápsula de Escape",
						"acciones":[	]}],
			"disponibilidad":true,
			"jugadorActual":null,
			"habitacionInicial":{"nombre":"Baño"},
			"habitacionFinal":{"nombre":"Cápsula de Escape"},
			"itemsAgarrables":	[{"nombre":"Jabón"},
						{"nombre":"Manos limpias"},
						{"nombre":"Servilleta con contraseña escrita"}]},

		{"nombre":"Casa Embrujada",
			"habitaciones":[{"nombre":"Calabozo",
						"acciones":[	]},
					{"nombre":"Sala de Tortura",
						"acciones":[	]},
					{"nombre":"Living-Comedor",
						"acciones":[	]},
					{"nombre":"Patio",
						"acciones":[	]}],
			"disponibilidad":true,
			"jugadorActual":null,
			"habitacionInicial":{"nombre":"Calabozo"},
			"habitacionFinal":{"nombre":"Patio"},
			"itemsAgarrables":[]},

		{"nombre":"UNQui",
			"habitaciones":[{"nombre":"API",
						"acciones":[	]},
					{"nombre":"Ascensor",
						"acciones":[	]},
					{"nombre":"Aula 60",
						"acciones":[	]},
					{"nombre":"Calle",
						"acciones":[	]}],
			"disponibilidad":true,
			"jugadorActual":null,
			"habitacionInicial":{"nombre":"API"},
			"habitacionFinal":{"nombre":"Calle"},
			"itemsAgarrables":[]}]

obtenerLaberintosDisponibles(laberintos);

function obtenerLaberintosDisponibles() {
	var out = "";
	var i;
	for(i = 0; i < laberintos.length; i++) {
		if(laberintos[i].disponibilidad){
			out +=	'<li><a><img src="img/' + laberintos[i].nombre + '.jpg" alt="' + laberintos[i].nombre + 			'"style="float:left;width:44px;height:44px;">' + laberintos[i].nombre + '</a></li>'
		}
	}
    document.getElementById("menu").innerHTML = out;
}
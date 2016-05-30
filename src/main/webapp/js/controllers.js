app.controller('JuegoCtrl', function($scope, $http) {

	$http.get("/laberintos").then(function (response) {
		$scope.laberintos = response.data;
	});

	$http.get("/jugador").then(function (response) {
		$scope.jugador = response.data;
	});

	$scope.seleccionNula = true;
	$scope.hayUnLaberintoSeleccionado = false;
	$scope.seEstaJugandoEnElLaberintoSeleccionado = false;
	$scope.laberintoGanado = false;

	$scope.laberintoSeleccionado = null;
	$scope.elJugadorSolicitoAbandonar = false;

	$scope.itemSeleccionado = null;

	$scope.seleccionarLaberinto = function(laberinto) {
		$scope.laberintoSeleccionado = laberinto;
		$scope.seleccionNula = false;
		$scope.hayUnLaberintoSeleccionado = true;
	};

	$scope.jugarLaberinto = function() {
		$scope.hayUnLaberintoSeleccionado = false;
		$scope.seEstaJugandoEnElLaberintoSeleccionado = true;
		$http.get("/jugar/" + $scope.laberintoSeleccionado.id).then(function(response){
			$scope.jugador = response.data;
		})
	};

	$scope.soyElLaberintoSeleccionado = function(laberinto) {
		return (laberinto == $scope.laberintoSeleccionado)
	};

	$scope.hacerAccion = function(idAccion) {
		$http.get("/hacer/" + idAccion).then(function(response){
			$scope.jugador = response.data;
		})
		$http.get("/ganador/" + $scope.laberintoSeleccionado.id).then(function(response){
			if(response.data){
				$scope.seEstaJugandoEnElLaberintoSeleccionado = false;
				$scope.laberintoGanado = true;
			}
		})
	};

	$scope.restablecer = function() {
		$http.get("/ganar/" + $scope.laberintoSeleccionado.id + "/" + $scope.jugador.id).then(function(response){});
		$scope.seleccionNula = true;
		$scope.hayUnLaberintoSeleccionado = false;
		$scope.seEstaJugandoEnElLaberintoSeleccionado = false;
		$scope.laberintoGanado = false;
		$scope.laberintoSeleccionado = null;
	};

	$scope.solicitarAbandonarLaberinto = function() {
		$scope.elJugadorSolicitoAbandonar = true;
	}

	$scope.abandonarLaberinto = function() {
		$scope.seleccionNula = true;
		$scope.hayUnLaberintoSeleccionado = false;
		$scope.seEstaJugandoEnElLaberintoSeleccionado = false;
		$scope.laberintoGanado = false;
		$http.get("/abandonar/" + $scope.laberintoSeleccionado.id).then(function(response){});
		$scope.laberintoSeleccionado = null;
		$scope.elJugadorSolicitoAbandonar = false;
	};

	$scope.cancelarSolicitudDeAbandonoDeLaberinto = function() {
		$scope.elJugadorSolicitoAbandonar = false;
	};

	$scope.seleccionarItem = function(item) {
		$scope.itemSeleccionado = item;
	}

	$scope.soyElItemSeleccionado = function(item) {
		return (item == $scope.itemSeleccionado)
	};

	$scope.tirarItemSeleccionado = function() {
		$http.get("/tirar/" + $scope.itemSeleccionado.id).then(function(response){
			$scope.itemSeleccionado = null
			$scope.jugador = response.data;
		})
	};
});

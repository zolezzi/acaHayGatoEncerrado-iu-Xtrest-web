app.controller('JuegoCtrl', function($scope, $http) {

	$http.get("/laberintos").then(function (response) {
		$scope.laberintos = response.data;
	});

	$http.get("/jugador").then(function (response) {
		$scope.jugador = response.data;
	});

	$scope.laberintoSeleccionado = null;
	$scope.seleccionNula = true;
	$scope.hayUnLaberintoSeleccionado = false;
	$scope.seEstaJugandoEnElLaberintoSeleccionado = false;

	$scope.seleccionarLaberinto = function(laberinto) {
		$scope.laberintoSeleccionado = laberinto;
		$scope.seleccionNula = false;
		$scope.hayUnLaberintoSeleccionado = true;
	};
});

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

	$scope.laberintoSeleccionado = null;

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
});

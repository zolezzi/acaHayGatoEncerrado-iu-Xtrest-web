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

	$http.get("/nombreLaberinto").then(function (response) {
		$scope.seleccionarLaberinto = function() {
			$scope.seleccionNula = false;
			$scope.laberintoSeleccionado = response.data;
			$scope.hayUnLaberintoSeleccionado = true;
		}
	});
});

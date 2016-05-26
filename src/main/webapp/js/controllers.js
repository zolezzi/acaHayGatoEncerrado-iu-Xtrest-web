app.controller('JuegoCtrl', function($scope, $http) {

	$http.get("/laberintos").then(function (response) {
		$scope.laberintos = response.data;
	});

	$http.get("/jugador").then(function (response) {
		$scope.jugador = response.data;
	});
/*
});

app.controller('SeleccionNulaCtrl', function($scope) {
*/	
	$scope.seleccionNula = true;
	showSeleccionNula(function () {
		$scope.seleccionNula = false;
	});
/*
});

app.controller('LaberintoCtrl', function($scope, $http) {
*/
	$http.get("/nombreLaberinto").then(function (response) {
		$scope.laberintoSeleccionado = null;
		$scope.seleccionarLaberinto = function() {
			$scope.laberintoSeleccionado = response.data;
		}
	});
});

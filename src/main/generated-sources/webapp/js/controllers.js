app.controller('JuegoCtrl', function($scope, $http) {

	$http.get("http://localhost:9777/laberintos").then(function (response) {
		$scope.laberintos = response.data;
	});

	$http.get("http://localhost:9777/jugador").then(function (response) {
		$scope.jugador = response.data;
	});
});

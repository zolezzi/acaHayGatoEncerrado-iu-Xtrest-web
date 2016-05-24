app.factory('Laberintos', function($resource) {
	return $resource('/laberintosDisponibles', {'nombre':'@nombre'},{
		'query': { method: 'GET', isArray: true}
	});
});

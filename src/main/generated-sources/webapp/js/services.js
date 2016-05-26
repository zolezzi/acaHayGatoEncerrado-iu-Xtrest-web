app.factory('Laberintos', function($resource) {
	return $resource('/laberintos', {'nombre':'@nombre'},{
		'query': { method: 'GET', isArray: true}
	});
});

var app = require('express')(),
	path = require('path');

if (require.main === module) {
	app.use('/', require(path.join(__dirname, 'routes', 'main'))());
	var server = app.listen(5000, function () {
		var host = server.address().address,
			port = server.address().port;
		console.log('Server is listening at http://%s:%s', host, port);
	});
} else {
	exports = module.exports = function (options) {
		app.use('/', require(path.join(__dirname, 'routes', 'main'))(options));
		return app;
	};
}
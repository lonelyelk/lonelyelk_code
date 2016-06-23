describe('Server main route in factory pattern', function () {
	var server,
		path = require('path'),
		request = require('request'),
		baseURL = 'http://localhost:6000/',
		app = require(path.join(__dirname, '..', 'index.js'));

	beforeEach(function (done) {
		server = app({
			customLib: {name: 'Mock name'}
		}).listen(6000, function (err) {
			if (err) {
				done.fail(err);
			} else {
				done();
			}
		});
	});

	afterEach(function (done) {
		server.close(function (err) {
			if (err) {
				done.fail(err);
			} else {
				done();
			}
		});
	});

	it('should render main page with mock name', function (done) {
		request.get(baseURL, function (err, res, body) {
			expect(res.statusCode).toBe(200);
			expect(body).toEqual('Real server text. CustomLib: Mock name');
			done();
		});
	});
});
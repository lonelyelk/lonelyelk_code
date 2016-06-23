(function () {
	'use strict';

	exports = module.exports = function (options) {
		options = options || {};
		var router = require('express').Router(),
			path = require('path'),
			customLib = options.customLib || require(path.join(__dirname, '..', 'lib', 'custom'));

		/* GET main page. */
		router.get('/', function (req, res, next) {
			res.end('Real server text. CustomLib: ' + customLib.name);
		});

		return router;
	};
})();

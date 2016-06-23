var gulp = require('gulp'),
	path = require('path');

gulp.task('spec', function (done) {
	var Jasmine = require('jasmine'),
		jasmine = new Jasmine(),
		util = require('util'),
		ElkReporter = require(path.join(__dirname, 'spec', 'support', 'elk_reporter')),
		elkReporter = new ElkReporter({
			print: function() {
				process.stdout.write(util.format.apply(this, arguments));
			},
			showColors: true,
			jasmineCorePath: this.jasmineCorePath
		});

	jasmine.loadConfigFile(path.join(__dirname, 'spec', 'support', 'jasmine.json'));
	jasmine.addReporter(elkReporter);

	jasmine.execute();

	jasmine.onComplete(function (passed) {
		done();
	});
});

'use strict';

var http = require('http');
var cheerio = require('cheerio');

String.prototype.lowercaseFirstLetter = function() {
    return this.charAt(0).toLowerCase() + this.slice(1);
};

function download(url, callback) {
	http.get(url, function(res) {
		var data = "";
		res.on('data', function (chunk) {
		  data += chunk;
		});

		res.on("end", function() {
		  callback(data);
		});

	}).on("error", function() {
	  	callback(null);
	});
}

download('http://www.flatuicolorpicker.com/all', function(data) {
	parse(data);
});

function parse(data) {
	var $ = cheerio.load(data);
	$('.page-wrap').children().each(function(i, e) {
		var item = $(e).find('div ul li');
		var name = $(item).find('.color-name').text();
		var rgb = $(item).find('.rgb-number').text();

		var betterName = name.replace(/ /g, '').lowercaseFirstLetter();

		// public static let flamingo = UIColor.rgb(239, 72, 54)
		console.log('public static let ' + betterName + ' = UIColor.rgb(' + rgb + ')');
	});
};

var GlyphRenderer = function() {

	var midPoint = function(point1, point2) {
		return [(point1[0] + point2[0]) / 2.0,
				(point1[1] + point2[1]) / 2.0];
	};

	var expand = function(point, height, padding) {
		var scale = height / 2.0 - padding;
		return [point[0] * scale + scale + padding, -point[1] * scale + scale + padding];
	};

	var unitPoints = function() {
		var pi = 3.14159265358979323846;

		var outer = [];
		var i;
		for (i = 0; i < 6; ++i) {
			var rad = pi * (i / 3.0 + 0.5);
			outer[i] = [Math.cos(rad), Math.sin(rad)];
		}

	 	var center = midPoint(outer[0], outer[3]);
		var inner = [];
		inner.push(midPoint(outer[1], center));
		inner.push(midPoint(outer[2], center));
		inner.push(midPoint(outer[4], center));
		inner.push(midPoint(outer[5], center));

		var results = outer.concat(inner);
		results.push(center);
		return results;
	}();

	var expandPoints = function(points, height, padding) {
		var results = [];
		for (i = 0; i < points.length; ++i) {
			results.push(expand(points[i], height, padding));
		}
		return results;
	};

	var selectPoints = function(points, indexes) {
		var results = [];
		for (i = 0; i < indexes.length; ++i) {
			results.push(points[indexes[i]]);
		}
		return results;
	};

	var drawGlyphPoints = function(svg, height, indexes) {
		// 6, 1, 5
		var circleRadius = height * 0.03;
		var circleStrokeWidth = height * 0.01;
		var padding = circleRadius + circleStrokeWidth;
		var lineWidth = height * 0.03;
		
		var points = expandPoints(unitPoints, height, padding);
		for (i = 0; i < points.length; ++i) {
			svg.circle(points[i][0], points[i][1], circleRadius,
						{fill: 'none', stroke: 'gray', strokeWidth: circleStrokeWidth});
		}

		var g = svg.group({stroke: '#8080ff', strokeWidth: lineWidth});
		
		var lineSettings = {
			stroke: '#8080ff',
			strokeWidth: lineWidth,
			fill: 'none',
			strokeLineCap: 'round',
			strokeLineJoin: 'round'
		};
		if (indexes.length > 1 && indexes[0] == indexes[indexes.length - 1]) {
			svg.polygon(selectPoints(points, indexes), lineSettings);
		} else {
			svg.polyline(selectPoints(points, indexes), lineSettings);
		}
		
		// for (i = 0; i < indexes.length - 1; ++i) {
		// 	var from = points[indexes[i]];
		// 	var to = points[indexes[i + 1]];
		// 	svg.line(g, from[0], from[1], to[0], to[1]);
		// }
	};

	return {	
		draw: function(selector, indexes) {
			$(selector).svg(function(svg) {
				drawGlyphPoints(svg, $(this).height(), indexes);
			});
		}
	};
}();

$(document).ready(function() {
	GlyphRenderer.draw('#past', [1, 6, 7, 2]);
	GlyphRenderer.draw('#chaos', [2, 1, 0, 5, 9, 10, 7, 3]);
	GlyphRenderer.draw('#create', [2, 7, 10, 9, 5]);
	GlyphRenderer.draw('#future', [5, 9, 8, 4]);
	GlyphRenderer.draw('#harmony', [0, 6, 10, 8, 3, 7, 10, 9, 0]);
});


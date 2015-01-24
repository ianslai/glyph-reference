
var GlyphRenderer = function() {

    var glyphMap = Shapes;

    var midPoint = function(point1, point2) {
        return [(point1[0] + point2[0]) / 2.0,
            (point1[1] + point2[1]) / 2.0];
    };

    // Scale a unit point up to a bounding box with the given height
    // and add padding to top and bottom; also convert the point from
    // mathematical axes (Y increases going up, (0, 0) at center) to screen axes
    // (Y increases going down, (0, 0) at top left).
    var expand = function(point, height, padding) {
        var scale = height / 2.0 - padding;
        return [point[0] * scale + scale + padding, -point[1] * scale + scale + padding];
    };

    // Calculate points on the glyph grid based on a unit circle.
    // Points 0 through 5 are on the outer hexagon starting at the top.
    // Points 6 through 9 are on the inner rectangle starting at the top left.
    // Point 10 is the center of the grid.
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

    // Expand all points in the given array
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

    // Draw lines between the points indexed by the indexes array
    var drawPolyline = function(svg, points, indexes, lineWidth) {
        var lineSettings = {
            stroke: '#8080ff',
            strokeWidth: lineWidth,
            fill: 'none',
            strokeLineCap: 'round',
            strokeLineJoin: 'round'
        };

        if (indexes.length > 1 && indexes[0] == indexes[indexes.length - 1]) {
            svg.polygon(selectPoints(points, indexes), lineSettings);
        } else if (indexes.length > 0) {
            svg.polyline(selectPoints(points, indexes), lineSettings);
        }
    }

    var drawPointCircles = function(svg, points, radius, strokeWidth) {
        for (i = 0; i < points.length; ++i) {
            svg.circle(points[i][0], points[i][1], radius,
                {fill: 'none', stroke: 'gray', strokeWidth: strokeWidth});
        }
    }

    // Draw a mini-glyph, which consists of a bounding hexagon
    // and the glyph inside.
    var drawMiniGlyph = function(svg, height, indexes) {
        var lineWidth = height * 0.07;
        var outerLineSpacing = lineWidth * 1.5;
        var padding = outerLineSpacing + lineWidth;

        var outerHexagonPoints = expandPoints(unitPoints, height, lineWidth / 2.0);
        var points = expandPoints(unitPoints, height, padding);

        drawPolyline(svg, outerHexagonPoints, [0, 1, 2, 3, 4, 5, 0], lineWidth);
        drawPolyline(svg, points, indexes, lineWidth);
    };

    // Draw a regular glyph on top of circles at each point in the grid.
    var drawGlyphPoints = function(svg, height, indexes) {
        var circleRadius = height * 0.03;
        var circleStrokeWidth = height * 0.01;
        var padding = circleRadius + circleStrokeWidth;
        var lineWidth = height * 0.03;

        var points = expandPoints(unitPoints, height, padding);
        
        drawPointCircles(svg, points, circleRadius, circleStrokeWidth);
        drawPolyline(svg, points, indexes, lineWidth);
    };

    return {
        draw: function(selector) {
            $(selector).svg(function(svg) {
                var word = $(this).attr("data-name");
                var indexes = glyphMap[word];
                if (indexes != null) {
                    if ($(this).hasClass('mini-glyph')) {
                        drawMiniGlyph(svg, $(this).height(), indexes);
                    } else {
                        drawGlyphPoints(svg, $(this).height(), indexes);
                    }
                }
            });
        },
    };
}();

$(document).ready(function() {
    $('.glyph, .mini-glyph').each(function() {
        GlyphRenderer.draw($(this));
    });

});


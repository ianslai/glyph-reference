var Shapes = function() {
	
	var pointMap = {
		'all': [0, 1, 2, 3, 4, 5, 0],
		'chaos': [2, 1, 0, 5, 9, 10, 7, 3],
		'clear': [0, 1, 3],
		'clear-all': [0, 1, 2, 3, 4, 5, 0, 1, 3],
		'civilization': [1, 6, 7, 8, 9, 5],
		'create': [2, 7, 10, 9, 5],
		'destroy': [1, 6, 10, 8, 4],
		'equal': [7, 6, 9, 8],
		'future': [5, 9, 8, 4],
		'human': [3, 7, 6, 9, 8, 3],
		'imperfect': [6, 10, 8, 9, 10],
		'lie': [7, 6, 10, 8, 9, 10],
		'nature': [2, 7, 6, 9, 8, 4],
		'past': [1, 6, 7, 2],
		'peace': [0, 6, 10, 8, 3, 7, 10, 9, 0],
		'present': [6, 7, 8, 9],
		'open': [7, 8, 3, 7],
		'open-all': [3, 7, 8, 3, 4, 5, 0, 1, 2, 3],
		'shapers': [2, 7, 6, 0, 9, 8, 4],
		'strong': [6, 9, 8, 7, 6],
		'truth': [6, 10, 9, 8, 10, 7, 6],
		'unknown': [],
		'xm': [10, 7, 6, 9, 8, 10],
	};

	pointMap['now'] = pointMap['present'];
	pointMap['harmony'] = pointMap['peace'];

	return pointMap;
}();

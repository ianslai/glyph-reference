var Shapes = function() {

    var pointMap = {
        'all': [0, 1, 2, 3, 4, 5, 0],
        'again': [2, 6, 7, 10, 9, 8],
        'advance': [0, 6, 2],
        'answer': [6, 9, 8, 10],
        'attack': [2, 6, 0, 9, 4],
        'avoid': [1, 0, 9, 5, 8],
        'barrier': [0, 10, 8, 4],
        'begin': [0, 7, 3, 8],
        'body': [6, 9, 10, 6],
        'capture': [5, 8, 10, 7, 2, 3],
        'change': [7, 10, 3, 8],
        'chaos': [2, 1, 0, 5, 9, 10, 7, 3],
        'clear': [0, 10, 3],
        'clear-all': [0, 1, 2, 3, 4, 5, 0, 10, 3],
        'civilization': [1, 6, 7, 8, 9, 5],
        'complex': [9, 6, 10, 7],
        'conflict': [2, 6, 7, 8, 9, 4],
        'contemplate': [9, 10, 6, 7, 3, 4, 5, 0],
        'courage': [2, 6, 7, 8],
        'create': [2, 7, 10, 9, 5],
        'danger': [0, 6, 10, 3],
        'data': [0, 9, 10, 7, 3],
        'defend': [1, 7, 3, 8, 5],
        'destiny': [6, 10, 9, 8, 7, 3],
        'destroy': [1, 6, 10, 8, 4],
        'deteriorate': [6, 10, 7, 2],
        'die': [2, 7, 10, 8, 4],
        'difficult': [7, 10, 8, 9, 5],
        'discover': [5, 4, 3, 2],
        'distance': [0, 1, 2],
        'easy': [9, 10, 7, 3],
        'end': [0, 10, 3, 8, 5, 0],
        'enlightened': [6, 9, 10, 6, 0, 5, 4, 3],
        'equal': [7, 6, 9, 8],
        'escape': [0, 5, 9, 6, 7],
        'failure': [0, 10, 9, 8],
        'fear': [6, 9, 8, 5],
        'follow': [0, 9, 5, 4],
        'forget': [7, 2],
        'future': [5, 9, 8, 4],
        'gain': [1, 7],
        'grow': [2, 6, 7],
        'harm': [10, 9, 0, 6, 10, 8, 4],
        'have': [8, 10, 7, 3],
        'help': [1, 6, 10, 7, 8],
        'hide': [6, 9, 5, 8, 7],
        'human': [3, 7, 6, 9, 8, 3],
        'i': [6, 9, 3, 6],
        'idea': [7, 2, 1, 6, 10, 8, 4, 5, 9],
        'ignore': [8, 4],
        'imperfect': [9, 10, 7, 6, 10],
        'improve': [8, 10, 9, 5],
        'impure': [10, 7, 6, 10, 3],
        'inside': [6, 9, 8],
        'intelligence': [2, 7, 6, 10, 9, 5],
        'journey': [5, 9, 10, 6, 1, 2, 3],
        'knowledge': [6, 3, 9, 10, 6],
        'lead': [0, 1, 2, 7, 3],
        'less': [6, 10, 9],
        'liberate': [0, 5, 9, 10, 6, 2],
        'lie': [7, 6, 10, 8, 9, 10],
        'live': [1, 6, 10, 9, 5],
        'lose': [5, 8],
        'message': [2, 6, 10, 8, 5],
        'mind': [6, 7, 3, 10, 6],
        'more': [7, 10, 8],
        'nature': [2, 7, 6, 9, 8, 4],
        'new': [9, 8, 4],
        'nourish': [10, 7, 2, 3, 10],
        'old': [1, 6, 7],
        'open': [7, 8, 3, 7],
        'open-all': [3, 7, 8, 3, 4, 5, 0, 1, 2, 3],
        'past': [1, 6, 7, 2],
        'path': [0, 10, 7, 2],
        'peace': [0, 6, 10, 8, 3, 7, 10, 9, 0],
        'perfection': [0, 10, 7, 2, 3, 4, 8, 10],
        'portal': [1, 2, 7, 8, 4, 5, 9, 6, 1],
        'potential': [0, 10, 8, 4, 5],
        'present': [6, 7, 8, 9],
        'pure': [0, 10, 8, 9, 10],
        'pursue': [1, 6, 0, 9],
        'question': [0, 9, 6, 7],
        'react': [9, 6, 10, 8, 4],
        'rebel': [1, 7, 10, 9, 5, 4],
        'reduce': [4, 9, 8],
        'repair': [0, 1, 6, 10, 0],
        'resistance': [9, 6, 0, 10, 3, 7],
        'restraint': [1, 6, 10, 8, 4, 3],
        'retreat': [0, 9, 4],
        'safety': [2, 6, 9, 4],
        'save': [7, 10, 8, 5],
        'search': [10, 9, 6, 7, 8],
        'see': [0, 6],
        'self': [2, 3, 4],
        'separate': [1, 6, 7, 10, 9, 8, 4],
        'shapers': [2, 7, 6, 0, 9, 8, 4],
        'share': [4, 8, 7, 2, 3],
        'simple': [7, 8],
        'soul': [9, 10, 3, 8, 9],
        'stay': [2, 7, 8, 4],
        'success': [0, 10, 6, 7],
        'strong': [6, 9, 8, 7, 6],
        'technology': [5, 9, 10, 7, 6, 10, 8, 4],
        'them': [0, 7, 8],
        'together': [10, 6, 9, 10, 7, 2],
        'truth': [6, 10, 9, 8, 10, 7, 6],
        'unbounded': [10, 9, 6, 7, 8, 5, 0, 1, 2, 3, 4],
        'unknown': [],
        'us': [6, 9, 3],
        'use': [10, 8, 5],
        'want': [2, 7, 3, 8],
        'weak': [1, 6, 9, 8],
        'xm': [10, 7, 6, 9, 8, 10],
        'you': [0, 7, 8, 0]
    };

    var synonyms = {
        'accept': 'open',
        'balance': 'perfection',
        'breathe': 'live',
        'creativity': 'idea',
        'contract': 'reduce',
        'enlightenment': 'enlightened',
        'evolution': 'success',
        'harmony': 'peace',
        'individual': 'self',
        'me': 'i',
        'not': 'inside',
        'now': 'present',
        'outside': 'distance',
        'progress': 'success',
        'recharge': 'repair',
        'repeat': 'again',
        'thought': 'idea',
        'stability': 'stay',
        'struggle': 'resistance',
        'war': 'attack',
        'we': 'us',
        'your': 'you'
    };

    for (key in synonyms) {
        pointMap[key] = pointMap[synonyms[key]];
    }

    return pointMap;
}();

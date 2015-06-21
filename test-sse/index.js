var EventSource = require('eventsource');
 
var es = new EventSource('http://10.100.84.219/events');
es.onmessage = function(e) {
  console.log(e.data);
};
es.onerror = function() {
  console.log('ERROR!');
};

function whenAvailable(name, callback) {
    var interval = 10; // ms
    window.setTimeout(function() {
        if (window[name]) {
            callback(window[name]);
        } else {
            window.setTimeout(arguments.callee, interval);
        }
    }, interval);
}


document.onready = function () {
  whenAvailable("Grooveshark", function(t) {
    var pusher = new Pusher('6cb600ad67bea0d1692d');
    var channel = pusher.subscribe('groovy');
    channel.bind('add_list', function(data) {
      window.Grooveshark.addSongsByID([data]);
    });
  });
}

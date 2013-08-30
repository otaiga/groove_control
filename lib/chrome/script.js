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
    var pusher = new Pusher('key');
    var channel = pusher.subscribe('groovy');
    channel.bind('add_list', function(data) {
      window.Grooveshark.addSongsByID([data], false);
    });
    channel.bind('play_control', function(data) {
      switch(data){
        case "play":
          window.Grooveshark.play();
          break;
        case "pause":
          window.Grooveshark.pause();
          break;
        case "back":
          window.Grooveshark.previous();
          break;
        case "forward":
          window.Grooveshark.next();
          break;
      }
    });
  });
}

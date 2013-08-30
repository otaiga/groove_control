var s = document.createElement('script');
s.src = chrome.extension.getURL('script.js');
s.onload = function() {
  s.parentNode.removeChild(s);
};
(document.head||document.documentElement).appendChild(s);

var pusher = document.createElement('script');
pusher.type = 'text/javascript';
pusher.src = "http://js.pusher.com/2.1/pusher.min.js";
(document.head||document.documentElement).appendChild(pusher);
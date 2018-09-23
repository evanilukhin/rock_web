import "phoenix_html"

import socket from "./socket"

var channel = socket.channel('chat:lobby', {});

channel.on('shout', function (payload) {
  var li = document.createElement("li");
  var name = payload.name || 'guest';
  li.innerHTML = '<b>' + name + '</b>: ' + payload.message;
  ul.appendChild(li);
  ul.scrollTop = ul.scrollHeight - ul.clientHeight;
});

channel.join(); // join the channel.


var ul = document.getElementById('msg-list');
var name = document.getElementById('name');
var msg = document.getElementById('msg');

msg.addEventListener('keypress', function (event) {
  if (event.keyCode == 13 && msg.value.length > 0) {
    channel.push('shout', {
      name: name.value,
      message: msg.value
    });
    msg.value = '';
  }
});

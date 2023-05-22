var keepAboveMaximized = [];

workspace.clientMaximizeSet.connect(function(client, h, v) {
  if (h && v) {
    print(client.caption + " is fully maximized");
  } else {
    print(client.caption + " is not maximized");
  }
});

// const clients = workspace.clientList();

// for (var i = 0; i < clients.length; i++) {
//   print(clients[i].caption);
// }


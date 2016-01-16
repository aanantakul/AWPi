var socket = require("socket.io-client")("http://localhost:3000");

var clientName = "NODE01";
var initReady  = false;

function getDateTime() {
  var DateTime = new Date();
  DateTime = DateTime.toString().substring(0, 24);

  return DateTime;
}

socket.on("connect", function(){
	console.log("'" + clientName + "' CONNECTING TO SERVER . . .");
	socket.emit('ready', clientName);

	socket.on("connected", function(allowedClient){
		console.log("'" + allowedClient + "' CONNECT TO SERVER SUCCESSFULLY AT '"+ getDateTime() + "'");
		initReady = true;
	});

	socket.on("updateState", function(state){
		if(initReady){
			console.log("["+ getDateTime() + "] THE NEW STATE IS: " + state);
		}
		else{
			console.log("'" + clientName + "' CLIENT NOT FOUND ON SERVER, RECONNECTING . . .");
			socket.emit('ready', clientName);
		}
	});

});
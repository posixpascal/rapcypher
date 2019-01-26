const WebSocketServer = require('websocket').server;
const crypto = require("crypto");

class WebSocket {
    constructor(){
        this.middlewares = [];
    }
    async init(server){
        const wsServer = new WebSocketServer({
            httpServer: server,
            autoAcceptConnections: false
        });

        const originIsAllowed = (origin) => {
            return true;
        }

        wsServer.on('request', request => {
            if (!originIsAllowed(request.origin)) {
                // Make sure we only accept requests from an allowed origin
                request.reject();
                console.log(`${new Date()} Connection from origin ${request.origin} rejected.`);
                return;
            }

            const connection = request.accept();

            connection.id = crypto.randomBytes(64).toString('hex');
            connection.sendUTF(JSON.stringify({
                "action": "cypher:welcome",
                "token": connection.id
            }));

            connection.on('message', message => {
                this.middlewares.forEach((middleware) => middleware(connection, message.type === "utf8" ? JSON.parse(message.utf8Data) : message.binaryData));
            });

            connection.on('close', function(reasonCode, description) {
                console.log((new Date()) + ' Peer ' + connection.remoteAddress + ' disconnected.');
            });
        });

    }
}

module.exports = {WebSocket};

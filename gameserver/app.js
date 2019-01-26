const http = require("http");
const Game = require("./game");
const Cypher = require("./cypher");
const server = http.createServer();
const WebSocket = require("./websocket").WebSocket;
const socket = new WebSocket();

(async () => {
    server.listen(8080, async () => {
        console.log(`${new Date()} Server is listening on port 8080`);
        await socket.init(server);

        socket.middlewares.push(Game.middleware);
        socket.middlewares.push(Cypher.middleware);
    });
})();



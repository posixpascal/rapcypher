const Cypher = {
    rooms: []
};

Cypher.actions = {
    WELCOME: "cypher:welcome"
};

let nextAction = "create";
Cypher.middleware = (connection, message) => {
    switch (message.action){
        case Cypher.actions.WELCOME:
            // Check if user is authenticated
            if (connection.id === message.token){
                connection.authenticated = true;
            }

            connection.sendUTF(JSON.stringify({
                action: "cypher:accept",
                next_action: nextAction
            }));

            nextAction = (nextAction === "create") ? "join" : "create";

            break;
    }
};


module.exports = Cypher;

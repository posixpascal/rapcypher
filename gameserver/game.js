const Game = {
    players: [],
    games: {},
    joinGame: (req, message) => {

    }
};

Game.actions = {
    JOIN: "game:join"
};

Game.middleware = (req, message) => {
    switch (message.action){
        case Game.actions.JOIN:
            //this.joinGame(req, message);
            break;
    }
};


module.exports = Game;

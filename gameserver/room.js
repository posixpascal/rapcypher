const Room = {

};

Room.actions = {
    CREATE: "room:create",
    JOIN: "room:join",
};

Room.middleware = (req, message) => {
    switch (message.action){

    }
};


module.exports = Room;

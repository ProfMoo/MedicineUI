function sendStr(str) {
    var connection = new WebSocket('ws://localhost:8765');

    connection.onopen = function() {
        connection.send('ayylmao');
    };
}

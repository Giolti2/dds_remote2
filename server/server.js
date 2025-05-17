const net = require('net');
const {
    keyboard,
    Key,
    sleep
} = require('@nut-tree-fork/nut-js');
  
keyboard.config.autoDelayMs = 50;

const PORT = 8000;
const HOST = '0.0.0.0'; // Listen on all network interfaces

const server = net.createServer((socket) => {

    socket.on('data', async (data) => {
        const message = data.toString().trim();

        switch (message) {
            case "up":
                keyboard.type(Key.Up);
                console.log("Pressing up");
                break;
            case "left":
                keyboard.type(Key.Left);
                console.log("Pressing left");
                break;
            case "right":
                keyboard.type(Key.Right);
                console.log("Pressing right");
                break;
            case "down":
                keyboard.type(Key.Down);
                console.log("Pressing down");
                break;
            case "ok":
                keyboard.type(Key.A);
                console.log("Pressing ok");
                break;
            case "back":
                keyboard.type(Key.B);
                console.log("Pressing back");
                break;
            case "bubble":
                keyboard.type(Key.C);
                console.log("Pressing assistant");
                break;
            case "home":
                keyboard.type(Key.D);
                console.log("Pressing home");
                break;
            case "mute":
                keyboard.type(Key.E);
                console.log("Pressing mute");
                break;
            case "settings":
                keyboard.type(Key.F);
                console.log("Pressing settings");
                break;
            case "menu":
                keyboard.type(Key.G);
                console.log("Pressing menu");
                break;
            case "power":
                keyboard.type(Key.H);
                console.log("Pressing power");
                break;
            case "hdmi":
                keyboard.type(Key.I);
                console.log("Pressing input");
                break;
            case "hold":
                keyboard.type(Key.J);
                console.log("Holding down");
            default:
                break;
          }
    });

    socket.on('close', () => {
        console.log('Connection closed');
    });

    socket.on('error', (err) => {
      console.error('Socket error:', err.message);
    });
});

server.listen(PORT, HOST, () => {
  console.log(`Server listening on ${HOST}:${PORT}`);
});

server.on('error', (err) => {
  console.error('Server error:', err.message);
});
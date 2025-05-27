const net = require('net');
const {
    keyboard,
    Key,
    sleep
} = require('@nut-tree-fork/nut-js');
  
keyboard.config.autoDelayMs = 50;

const BACK = Key.I;
const HOME = Key.H;
const SIDE = Key.B;
const OK = Key.K;

const PORT = 8000;
const HOST = '0.0.0.0'; // Listen on all network interfaces

const server = net.createServer((socket) => {

    socket.on('data', async (data) => {
        const message = data.toString().trim();

        switch (message) {
            case "up":
                keyboard.type(Key.W);
                console.log("Pressing up");
                break;
            case "left":
                keyboard.type(Key.A);
                console.log("Pressing left");
                break;
            case "right":
                keyboard.type(Key.D);
                console.log("Pressing right");
                break;
            case "down":
                keyboard.type(Key.S);
                console.log("Pressing down");
                break;
            case "ok":
                keyboard.type(Key.Space);
                console.log("Pressing ok");
                break;
            case "back":
                keyboard.type(BACK);
                console.log("Pressing back");
                break;
            case "bubbles":
                keyboard.type(Key.G);
                console.log("Pressing assistant");
                break;
            case "home":
                keyboard.type(HOME);
                console.log("Pressing home");
                break;
            case "mute":
                keyboard.type(Key.I);
                console.log("Pressing mute");
                break;
            case "sidebar":
                keyboard.type(SIDE);
                console.log("Pressing sidebar");
                break;
            case "power":
                keyboard.type(Key.L);
                console.log("Pressing power");
                break;
            case "hold ok":
                keyboard.type(Key.N);
                console.log("Holding ok");
            case "hold up":
                startHoldingUp();
                console.log("Holding up");
            case "release up":
                stopHoldingUp();
                console.log("Releasing up");
            case "volume-up":
                keyboard.type(Key.P);
                console.log("Volume up");
            case "volume-down":
                keyboard.type(Key.Q);
                console.log("Volume down");
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

var timer;

function startHoldingUp() {
    timer = setInterval(holdingUpRoutine, 300);
}

function stopHoldingUp() {
    clearInterval(timer);
}

function holdingUpRoutine() {
    keyboard.type(Key.W);
    console.log("Pressing up");
}
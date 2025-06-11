const { SerialPort } = require('serialport');
const { ReadlineParser } = require('@serialport/parser-readline');
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

const port = new SerialPort({
  path: 'COM8',  // <-- change this
  baudRate: 115200,        // Must match Arduino's Serial.begin()
});

const parser = port.pipe(new ReadlineParser({ delimiter: '\n' }));

port.on('open', () => {
  console.log('Serial port opened');
});

port.on('error', err => {
  console.error('Serial port error:', err);
});

port.on('data', async (data) => {
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
            keyboard.type(OK);
            console.log("Pressing ok");
            break;
        case "hold":
            keyboard.type(Key.N);
            console.log("Holding ok");
            break;
        case "back":
            keyboard.type(BACK);
            console.log("Pressing back");
            break;
        case "home":
            keyboard.type(HOME);
            console.log("Pressing home");
            break;
        case "sidebar":
            keyboard.type(SIDE);
            console.log("Pressing sidebar");
            break;
        default:
            break;
    }
});
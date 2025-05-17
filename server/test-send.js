const dgram = require('dgram');
const client = dgram.createSocket('udp4');

const message = Buffer.from('Hello from Node UDP!');
const PORT = 8000;
const BROADCAST_ADDR = '255.255.255.255'; // Use your actual broadcast address

client.bind(() => {
  client.setBroadcast(true);
  client.send(message, 0, message.length, PORT, BROADCAST_ADDR, (err) => {
    if (err) console.error(err);
    else console.log('Broadcast message sent.');
    client.close();
  });
});
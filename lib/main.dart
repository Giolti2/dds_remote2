import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';

const double ROW_SPACE = 20;
const double COL_SPACE = 40;

void main() {
  runApp(const MainApp());
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [SystemUiOverlay.bottom],
  ); // to only hide the status bar
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 150),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[MovementButtons()],
            ),
            SizedBox(height: ROW_SPACE),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RawMaterialButton(
                  onPressed: () => {buttonFunction("back")},
                  elevation: 2.0,
                  fillColor: Colors.white,
                  constraints: BoxConstraints(minWidth: 0.0),
                  padding: EdgeInsets.all(15.0),
                  shape: CircleBorder(),
                  child: Icon(Icons.west, size: 35.0),
                ),
                SizedBox(width: COL_SPACE),
                RawMaterialButton(
                  onPressed: () => {buttonFunction("bubble")},
                  elevation: 2.0,
                  fillColor: const Color.fromARGB(255, 0, 0, 0),
                  constraints: BoxConstraints(minWidth: 0.0),
                  padding: EdgeInsets.all(15.0),
                  shape: CircleBorder(),
                  child: Icon(
                    Icons.bubble_chart,
                    color: Color(0xFFFFFFFF),
                    size: 35.0,
                  ),
                ),
              ],
            ),
            SizedBox(height: ROW_SPACE),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RawMaterialButton(
                  onPressed: () => {buttonFunction("home")},
                  elevation: 2.0,
                  fillColor: Colors.white,
                  constraints: BoxConstraints(minWidth: 0.0),
                  padding: EdgeInsets.all(15.0),
                  shape: CircleBorder(),
                  child: Icon(Icons.home_filled, size: 35.0),
                ),
                SizedBox(width: COL_SPACE),
                RawMaterialButton(
                  onPressed: () => {buttonFunction("mute")},
                  elevation: 2.0,
                  fillColor: Colors.white,
                  constraints: BoxConstraints(minWidth: 0.0),
                  padding: EdgeInsets.all(15.0),
                  shape: CircleBorder(),
                  child: Icon(Icons.volume_off, size: 35.0),
                ),
              ],
            ),
            SizedBox(height: ROW_SPACE),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RawMaterialButton(
                  onPressed: () => {buttonFunction("settings")},
                  elevation: 2.0,
                  fillColor: Colors.white,
                  constraints: BoxConstraints(minWidth: 0.0),
                  padding: EdgeInsets.all(15.0),
                  shape: CircleBorder(),
                  child: Icon(Icons.settings, size: 35.0),
                ),
                SizedBox(width: COL_SPACE),
                RawMaterialButton(
                  onPressed: () => {buttonFunction("menu")},
                  elevation: 2.0,
                  fillColor: Colors.white,
                  constraints: BoxConstraints(minWidth: 0.0),
                  padding: EdgeInsets.all(15.0),
                  shape: CircleBorder(),
                  child: Icon(Icons.menu, size: 35.0),
                ),
              ],
            ),
            SizedBox(height: ROW_SPACE),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RawMaterialButton(
                  onPressed: () => {buttonFunction("power")},
                  elevation: 2.0,
                  fillColor: Colors.white,
                  constraints: BoxConstraints(minWidth: 0.0),
                  padding: EdgeInsets.all(5.0),
                  shape: CircleBorder(),
                  child: Icon(Icons.power_settings_new, size: 20.0),
                ),
                SizedBox(width: 32),
                RawMaterialButton(
                  onPressed: () => {buttonFunction("hdmi")},
                  elevation: 2.0,
                  fillColor: Colors.white,
                  constraints: BoxConstraints(minWidth: 0.0),
                  padding: EdgeInsets.all(5.0),
                  shape: CircleBorder(),
                  child: Icon(Icons.input, size: 20.0),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MovementButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        RawMaterialButton(
          onPressed: () => {},
          fillColor: Color.fromARGB(255, 250, 250, 250),
          splashColor: Color.fromARGB(0, 255, 255, 255),
          /*height: 200,
          width: 200,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              width: 0,
            ),
            borderRadius: BorderRadius.all(Radius.circular(100)),
          ),*/
          shape: CircleBorder(),
          child: Table(
            columnWidths: const <int, TableColumnWidth>{
              0: FixedColumnWidth(60),
              1: FixedColumnWidth(80),
              2: FixedColumnWidth(60),
            },
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: <TableRow>[
              TableRow(
                children: [
                  Container(height: 60),
                  InkWell(
                    onTap: () => {buttonFunction("up")},
                    child: Container(height: 60),
                  ),
                  Container(height: 60),
                ],
              ),
              TableRow(
                children: [
                  InkWell(
                    onTap: () => {buttonFunction("left")},
                    child: Container(height: 80),
                  ),
                  Container(height: 80),
                  InkWell(
                    onTap: () => {buttonFunction("right")},
                    child: Container(height: 80),
                  ),
                ],
              ),
              TableRow(
                children: [
                  Container(height: 60),
                  InkWell(
                    onTap: () => {buttonFunction("down")},
                    child: Container(height: 60),
                  ),
                  Container(height: 60),
                ],
              ),
            ],
          ),
        ),
        Container(
          height: 200,
          width: 200,
          alignment: Alignment.center,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
              padding: EdgeInsets.all(24),
              fixedSize: const Size(70, 70),
            ),
            onPressed: () => {buttonFunction("ok")},
            onLongPress: () => {buttonFunction("hold")},
            child: null,
          ),
        ),
      ],
    );
  }
}

void buttonFunction(String message) async {
  HapticFeedback.lightImpact();

  try {
    final socket = await Socket.connect('192.168.200.68', 8000);
    print('Connected to: ${socket.remoteAddress.address}:${socket.remotePort}');

    socket.write(message);
  } catch (e) {
    print('Error connecting: $e');
  }

}

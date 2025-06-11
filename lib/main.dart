import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';

const double ROW_SPACE = 15;
const double COL_SPACE = 25;
const double COL_SPACE2 = 15;

const double BUTTON_SIZE = 30;

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
      theme: new ThemeData(scaffoldBackgroundColor: const Color(0xFFD0D0D0)),
      home: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 50),
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
              ],
            ),
            SizedBox(height: ROW_SPACE),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[MovementButtons()],
            ),
            SizedBox(height: ROW_SPACE + 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RawMaterialButton(
                  onPressed: () => {buttonFunction("back")},
                  elevation: 2.0,
                  fillColor: Colors.white,
                  constraints: BoxConstraints(minWidth: 0.0),
                  padding: EdgeInsets.all(10.0),
                  shape: CircleBorder(),
                  child: Icon(Icons.west, size: BUTTON_SIZE),
                ),
                SizedBox(width: COL_SPACE2),
                RawMaterialButton(
                  onPressed: () => {buttonFunction("home")},
                  elevation: 2.0,
                  fillColor: Colors.white,
                  constraints: BoxConstraints(minWidth: 0.0),
                  padding: EdgeInsets.all(10.0),
                  shape: CircleBorder(),
                  child: Icon(Icons.home_filled, size: BUTTON_SIZE),
                ),
                SizedBox(width: COL_SPACE2),
                RawMaterialButton(
                  onPressed: () => {buttonFunction("sidebar")},
                  elevation: 2.0,
                  fillColor: Colors.white,
                  constraints: BoxConstraints(minWidth: 0.0),
                  padding: EdgeInsets.all(10.0),
                  shape: CircleBorder(),
                  child: Icon(Icons.view_sidebar, size: BUTTON_SIZE),
                ),
              ],
            ),
            SizedBox(height: ROW_SPACE + 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RawMaterialButton(
                  onPressed: () => {buttonFunction("bubbles")},
                  elevation: 2.0,
                  fillColor: Colors.white,
                  constraints: BoxConstraints(minWidth: 0.0),
                  padding: EdgeInsets.all(15.0),
                  shape: CircleBorder(),
                  child: Icon(Icons.mic, size: BUTTON_SIZE),
                ),
                SizedBox(width: COL_SPACE),
                RawMaterialButton(
                  onPressed: () => {buttonFunction("volume-up")},
                  elevation: 2.0,
                  fillColor: Colors.white,
                  constraints: BoxConstraints(minWidth: 0.0),
                  padding: EdgeInsets.all(15.0),
                  shape: CircleBorder(),
                  child: Icon(Icons.add, size: BUTTON_SIZE),
                ),
              ],
            ),
            SizedBox(height: ROW_SPACE),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RawMaterialButton(
                  onPressed: () => {buttonFunction("mute")},
                  elevation: 2.0,
                  fillColor: Colors.white,
                  constraints: BoxConstraints(minWidth: 0.0),
                  padding: EdgeInsets.all(15.0),
                  shape: CircleBorder(),
                  child: Icon(Icons.volume_off, size: BUTTON_SIZE),
                ),
                SizedBox(width: COL_SPACE),
                RawMaterialButton(
                  onPressed: () => {buttonFunction("volume-down")},
                  elevation: 2.0,
                  fillColor: Colors.white,
                  constraints: BoxConstraints(minWidth: 0.0),
                  padding: EdgeInsets.all(15.0),
                  shape: CircleBorder(),
                  child: Icon(Icons.remove, size: BUTTON_SIZE),
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
  static const buttonSize = 50.0;
  static const buttonSize2 = 80.0;
  static const buttonSize3 = 70.0;
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
              0: FixedColumnWidth(buttonSize),
              1: FixedColumnWidth(buttonSize2),
              2: FixedColumnWidth(buttonSize),
            },
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: <TableRow>[
              TableRow(
                children: [
                  Container(height: buttonSize),
                  InkWell(
                    onTap: () => {buttonFunction("up")},
                    child: Container(height: buttonSize),
                  ),
                  Container(height: buttonSize),
                ],
              ),
              TableRow(
                children: [
                  InkWell(
                    onTap: () => {buttonFunction("left")},
                    child: Container(height: buttonSize2),
                  ),
                  Container(height: buttonSize2),
                  InkWell(
                    onTap: () => {buttonFunction("right")},
                    child: Container(height: buttonSize2),
                  ),
                ],
              ),
              TableRow(
                children: [
                  Container(height: buttonSize),
                  InkWell(
                    onTap: () => {buttonFunction("down")},
                    child: Container(height: buttonSize),
                  ),
                  Container(height: buttonSize),
                ],
              ),
            ],
          ),
        ),
        Container(
          height: buttonSize * 2 + buttonSize2,
          width: buttonSize * 2 + buttonSize2,
          alignment: Alignment.center,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFE0E0E0),
              shape: CircleBorder(),
              padding: EdgeInsets.all(24),
              fixedSize: const Size(buttonSize3, buttonSize3),
            ),
            onPressed: () => {buttonFunction("ok")},
            onLongPress: () => {buttonFunction("hold ok")},
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
    final socket = await Socket.connect('192.168.182.219', 8000);
    print('Connected to: ${socket.remoteAddress.address}:${socket.remotePort}');

    socket.write(message);
  } catch (e) {
    print('Error connecting: $e');
  }
}

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  return runApp(App1108());
}

class App1108 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  var rnd = Random();
  var leadingIcons = [
    Icons.start,
    Icons.favorite,
    Icons.wifi,
    Icons.bluetooth,
    Icons.settings,
  ];

  var titleText = ['Star', 'Heart', 'Wi-Fi', 'Bluetooth', 'Gear'];

  var _switchWifi = true;
  var _switchBluetooth = false;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text('ListView')),
        body: ListView.separated(
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) => buildListItem(context, index),
          separatorBuilder: (context, i) => Divider(
            thickness: 1,
            color: Colors.blueGrey,
            indent: 10,
            endIndent: 10,
          ),
          itemCount: titleText.length,
          padding: EdgeInsets.all(20),
        ),
      );

  Widget buildListItem(BuildContext ctx, int index) => ListTile(
        leading: Icon(
          leadingIcons[index],
          size: 36,
        ),
        title: Text(
          titleText[index],
          textScaleFactor: 1.5,
        ),
        subtitle: Text(
          '\$${10 + rnd.nextInt(50)}',
          textScaleFactor: 1.2,
        ),
        trailing: trailWidget(ctx, index),
      );

  trailWidget(BuildContext ctx, int index) {
    var widgets = <Widget>[
      Icon(Icons.arrow_forward_ios),
      InkWell(
        child: Icon(Icons.shopping_cart),
        onTap: () {
          alert(ctx, 'หยิบ ${titleText[index]} ใส่รถเข็นแล้ว');
        },
      ),
      Switch(
        value: _switchWifi,
        onChanged: (isON) => setState(() {
          _switchWifi = isON;
          var t = isON.toString();
          alert(ctx, '${titleText[index]}: $t');
        }),
      ),
      Switch(
        value: _switchBluetooth,
        onChanged: (isON) => setState(() {
          _switchBluetooth = isON;
          var t = (isON) ? 'เปิด' : 'ปิด';
          alert(ctx, '${titleText[index]}: $t');
        }),
      ),
      InkWell(
        child: Icon(
          Icons.shopping_cart,
        ),
        onTap: () => alert(ctx, 'หยิบ ${titleText[index]} ใส่รถเข็นแล้ว'),
      )
    ];

    return widgets[index];
  }

  void alert(BuildContext ctx, String msg) => showDialog(
        context: ctx,
        builder: (ctx) => AlertDialog(
          content: Text(
            msg,
            textScaleFactor: 1.3,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: Text(
                'OK',
                textScaleFactor: 1.3,
              ),
            ),
          ],
        ),
      );
}

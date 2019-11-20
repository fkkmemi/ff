import 'package:flutter/material.dart';

void main() { 
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.menu),
          title: Text('hiru~'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.mode_comment),
              onPressed: () {
                print('눌렀어!');
              },              
            ),
            IconButton(
              icon: Icon(Icons.money_off),
              onPressed: () => print('애로우!'),              
            ),
          ],
        ),
        body: Center(
          child: Text('hello?')
        )
      )
    );
  }
}

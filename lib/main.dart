import 'package:flutter/material.dart';

void main() { 
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: home()
    );
  }
  Widget home() {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text('hiru~!!'),
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
      body: body()
    );
  }
  Widget body() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.red,
      ),
      child: cols()
    );
  }
  Widget cols() {
    return Column(      
      children: <Widget>[
        rows(), rows(), rows()
      ],
    );
  }
  Widget rows() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text('111'),
        Text('222'),
        Text('333'),
        Text('444'),
        Text('555'),
        Text('666'),
        Text('777'),
        Text('888'),
        Text('999'),
      ]      
    );
  }
}

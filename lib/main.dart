import 'package:flutter/material.dart';

void main() { 
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeWidget()
    );
  }
}

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();  
}
class _HomeWidgetState extends State<HomeWidget> {
  int i = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hiru~'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              setState(() => i++);
            },
          )
        ],
      ),
      body: XXX(i: i)
    );
  }
}

class XXX extends StatelessWidget {
  XXX({Key key, this.i: 0}) : super(key: key);
  final int i;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: _change(i)
    );
  }
  Widget _change (i) {
    if (i == 0) return CircularProgressIndicator();
    else if (i == 1) return Icon(Icons.settings);
    else return Text('yyy: $i');
  }
}

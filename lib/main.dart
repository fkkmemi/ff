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

class AppState {
  bool loading;
  String user;
  AppState(this.loading, this.user);
}

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();  
}

class _HomeWidgetState extends State<HomeWidget> {
  final app = AppState(true, '');  
  @override
  void initState() { 
    super.initState();    
    _delay();
  }
  _delay () {
    Future.delayed(Duration(seconds: 1), () {
      setState(() => app.loading = false);
    });  
  }
  @override
  Widget build(BuildContext context) {
    if (app.loading) return _loading();
    if (app.user.isEmpty) return _signIn();
    return _main();
  }
  Widget _loading () {
    return Scaffold(
      appBar: AppBar(title: Text('loading...')),
      body: Center(child: CircularProgressIndicator())
    );
  }
  Widget _signIn () {
    return Scaffold(
      appBar: AppBar(
        title: Text('login page')
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('id'), Text('pass'),            
            RaisedButton(
              child: Text('login'), 
              onPressed: () {
                setState(() {
                  app.loading = true;
                  app.user = 'my name';
                  _delay();
                });
              }
            )
          ],
        )
      )
      
    );
  }
  Widget _main () {
    return Scaffold(
      appBar: AppBar(
        title: Text(app.user),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              setState(() {
                app.user = '';
                app.loading = true;
                _delay();
              });
            },
          )
        ],
      ),
      body: Center(child: Text('contents'))
    );
  }
}

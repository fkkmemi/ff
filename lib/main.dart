import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
  FirebaseUser user;
  AppState(this.loading, this.user);
}

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();  
}

class _HomeWidgetState extends State<HomeWidget> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final app = AppState(false, null);  
  // @override
  // void initState() { 
  //   super.initState();    
  //   _delay();
  // }
  // _delay () {
  //   Future.delayed(Duration(seconds: 1), () {
  //     setState(() => app.loading = false);
  //   });  
  // }
  @override
  Widget build(BuildContext context) {
    if (app.loading) return _loading();
    if (app.user == null) return _loginPage();
    return _main();
  }
  Widget _loading () {
    return Scaffold(
      appBar: AppBar(title: Text('loading...')),
      body: Center(child: CircularProgressIndicator())
    );
  }
  Widget _loginPage () {
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
                _signIn();
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
        title: Text('app.user'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              _signOut();
            },
          )
        ],
      ),
      body: Center(child: Text('contents'))
    );
  }

  Future<String> _signIn () async {
    setState(() => app.loading = true);
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final AuthResult authResult = await _auth.signInWithCredential(credential);
    final FirebaseUser user = authResult.user;

    setState(() {
      app.loading = false;
      app.user = user;      
    });

    return 'success';

  }
  _signOut () async {
    await _googleSignIn.signOut();
    setState(() => app.user = null);
  }
}

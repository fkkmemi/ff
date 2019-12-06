import 'package:flutter/material.dart';

void main() { 
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: home(context)
    );
  }
  Widget home(BuildContext context) {
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
      body: body(context)
    );
  }
  Widget body(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      // decoration: BoxDecoration(
      //   color: Colors.red,
      // ),
      child: testList(context) // cols() // listViewTest2(context)
    );
  }  

  Widget testList (BuildContext context) {
    List<String> items = List.generate(100, (i) => '리스트 테스트 $i');
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, i) {
        return ListTile(
          title: Text(items[i]),
          subtitle: Text('this is test $i ㅎㅎㅎㅎㅎㅎ')
        );
      },
    );
  }
}

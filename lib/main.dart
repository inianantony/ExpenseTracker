import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense_Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () => {
                setState(() {}),
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              color: Colors.grey[100],
              child: Text(
                "<",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'FonsecaRounded',
                    fontSize: 20),
              ),
            ),
            Text(
              "dd-MM-yyyy",
              textAlign: TextAlign.center,
            ),
            RaisedButton(
              onPressed: () => {
                setState(() {}),
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              color: Colors.grey[100],
              child: Text(
                ">",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'FonsecaRounded',
                    fontSize: 20),
              ),
            ),
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
    );
  }
}

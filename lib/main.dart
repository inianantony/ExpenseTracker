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
  String category = 'Grocery';

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
            DropdownButton<String>(
              isExpanded: true,
              value: category,
              icon: Icon(Icons.arrow_downward),
              iconSize: 30,
              elevation: 16,
              style: TextStyle(color: Colors.black),
              underline: Container(
                height: 2,
                color: Colors.grey,
              ),
              onChanged: (String newValue) {
                setState(() {});
              },
              items: <String>['Grocery', 'Electronics', 'Fashion', 'Travel']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

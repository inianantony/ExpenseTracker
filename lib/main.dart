import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  final amountController = TextEditingController();
  DateTime date = new DateTime.now();
  List<Expense> expenseList = [];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          getAddExpenseSection(),
          Container(
            height: 30,
          ),
          getListingSection(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // new
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.pie_chart),
            title: new Text('Chart'),
          )
        ],
      ),
    );
  }

  Widget getListingSection() {
    return Expanded(
      child: SizedBox(
        height: 1.0,
        child: Card(
          child: Container(
            color: Colors.grey[100],
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Card(
                    child: Container(
                        padding: EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "dd-MM-yyyy",
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .subtitle,
                                  textAlign: TextAlign.left,
                                ),
                                Text(
                                  "10",
                                  style: TextStyle(
                                    fontSize: 25,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                            Container(
                                padding: EdgeInsets.only(right: 25),
                                child: Transform.scale(
                                  scale: 1.6,
                                  child: Transform.rotate(
                                    angle: -10 * 3.14 / 180,
                                    child: Icon(
                                      Icons.shopping_cart,
                                      size: 45,
                                    ),
                                  ),
                                )),
                          ],
                        )),
                    color: Colors.grey[400],
                    elevation: 10.0,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getAddExpenseSection() {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ButtonTheme(
                  minWidth: 25.0,
                  height: 30.0,
                  child: RaisedButton(
                    onPressed: () => {
                      setState(() {
                        date = date.subtract(new Duration(days: 1));
                      }),
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
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(top: 0),
                    child: Center(
                      child: Text(
                        DateFormat("dd-MM-yyyy").format(date),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                ButtonTheme(
                  minWidth: 25.0,
                  height: 30.0,
                  child: RaisedButton(
                    onPressed: () => {
                      setState(() {
                        date = date.add(new Duration(days: 1));
                      }),
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
                ),
              ],
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
                setState(() {
                  category = newValue;
                });
              },
              items: <String>['Grocery', 'Electronics', 'Fashion', 'Travel']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            TextField(
              decoration:
                  new InputDecoration(labelText: "Enter your expense amount"),
              keyboardType: TextInputType.number, //
              controller: amountController,
            ),
            ButtonTheme(
              minWidth: 25.0,
              height: 30.0,
              child: RaisedButton(
                onPressed: () => {
                  setState(() {
                    expenseList.add(Expense(
                        amount: double.parse(amountController.text),
                        category: category,
                        date: date));
                    category = "Grocery";
                    date = DateTime.now();
                    amountController.text = "";
                    FocusScope.of(context).requestFocus(new FocusNode());
                  }),
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                color: Colors.grey[100],
                child: Text(
                  "Add Expense",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'FonsecaRounded',
                      fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Expense {
  String category;
  DateTime date;
  double amount;

  Expense({
    this.category,
    this.date,
    this.amount,
  });
}

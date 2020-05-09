import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pie_chart/pie_chart.dart';

import 'amount_validator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense_Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Expense Tracker'),
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
  void dispose() {
    // Clean up the controller when the widget is disposed.
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _pages = [
      getHome(),
      getChart(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
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

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget getHome() {
    return Container(
      padding: EdgeInsets.all(20),
      color: Colors.grey[200],
      child: Column(
        children: <Widget>[
          getAddExpenseSection(),
          Container(
            height: 5,
          ),
          getListingSection(),
        ],
      ),
    );
  }

  Widget getListingSection() {
    var expenses = List<Widget>();
    var icons = new Map();
    icons.putIfAbsent('Grocery', () => Icons.shopping_cart);
    icons.putIfAbsent('Electronics', () => Icons.laptop);
    icons.putIfAbsent('Fashion', () => Icons.shopping_basket);
    icons.putIfAbsent('Travel', () => Icons.beach_access);
    for (var value in expenseList) {
      expenses.add(
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
                          DateFormat("dd-MM-yyyy").format(value.date),
                          style: Theme.of(context).primaryTextTheme.subtitle,
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          value.amount.toString(),
                          style: TextStyle(
                            fontSize: 25,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          value.category,
                          style: TextStyle(
                            fontSize: 15,
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
                              icons[value.category],
                              size: 45,
                            ),
                          ),
                        )),
                  ],
                )),
            color: Colors.grey[400],
            elevation: 10.0,
          ),
        ),
      );
    }

    return Expanded(
      child: SizedBox(
        height: 1.0,
        child: Card(
          child: Container(
            color: Colors.grey[100],
            padding: EdgeInsets.all(10),
            child: ListView(
              children: expenses,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Attention'),
          content: Text('Please corrent the invalid amount'),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
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
                    if (!AmountValidator()
                        .isValidAmount(amountController.text)) {
                      _showMyDialog();
                    } else {
                      expenseList.add(Expense(
                          amount: double.parse(amountController.text),
                          category: category,
                          date: date));
                      category = "Grocery";
                      date = DateTime.now();
                      amountController.text = "";
                      FocusScope.of(context).requestFocus(new FocusNode());
                    }
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

  Map<String, double> getDataForChart() {
    Map<String, double> expenseSummary = new Map();
    expenseList.forEach((Expense expense) {
      if (!expenseSummary.containsKey(expense.category))
        expenseSummary.putIfAbsent(expense.category, () => expense.amount);
      else
        expenseSummary[expense.category] += expense.amount;
    });
    return expenseSummary;
  }

  Widget getChart() {
    List<Color> colorList = [
      Colors.yellow,
      Colors.green,
      Colors.blue,
      Colors.brown[100],
    ];
    return PieChart(
      legendStyle: TextStyle(color: Colors.black),
      dataMap: getDataForChart(),
      animationDuration: Duration(milliseconds: 800),
      chartLegendSpacing: 10.0,
      chartRadius: MediaQuery.of(context).size.width / 2.7,
      showChartValuesInPercentage: true,
      showChartValues: true,
      showChartValuesOutside: false,
      chartValueBackgroundColor: Colors.grey[200],
      colorList: colorList,
      showLegends: true,
      legendPosition: LegendPosition.right,
      decimalPlaces: 1,
      showChartValueLabel: true,
      initialAngle: 0,
      chartValueStyle: defaultChartValueStyle.copyWith(
        color: Colors.blueGrey[900].withOpacity(0.9),
      ),
      chartType: ChartType.disc,
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

# Prerequisites

1. Download Flutter and extract to the specific location
![alt text](https://github.com/inianantony/expense_tracker/blob/master/readme_images/fultter_path.png)
2. Install Dart and Flutter extension in Visual Studio Code
![alt text](https://github.com/inianantony/expense_tracker/blob/master/readme_images/dart_ext.png)
![alt text](https://github.com/inianantony/expense_tracker/blob/master/readme_images/flutter_ext.png)
3. Set up the location of Flutter in Visual Studio Code if prompted
4. Install Android Studio and Open any one Android Emulator
5. Visual Studio Code should be linked to the Emulator

# Create New Project

1. Visual Studio Code -> View -> Command Palette -> Flutter: New Project
2. Set the name of project as `expense_tracker`
3. Chosse the main.dart file and hit the debug button in Visual Studio Code to see your default app on screen
4. Optionally open the Dart dev tools to explore ( Similar to Chrome dev tools )

# Knowing the Folder Structure

1. .dart_tool directory, which is new in Dart 2, is used by pub and other tools
2. .idea -> all the project specific settings for project are stored under the .idea folder
3. android -> files and configurations specific for android
4. build -> build versions reside on this folder
5. ios -> files and configurations specific to ios
6. lib -> is our play ground, or where the app source code resides
6. test -> where the test related code is placed
7. pubspec.yaml -> same use as package.json file to specify dependencies and some configurations

# Code and Demo

1. NOTE : In Flutter the casing is very sensitive, like starting from folder naming to method and class namings, should start with small letter
2. NOTE : However dont worry, visual studio will guide you.

## Clean up the default code

1. Open the main.dart file under lib folder
2. Delete all the comments

## Default code explanation

```dart
void main() => runApp(MyApp());
``` 
- Entry point is the main method, and its call the runApp method and passes the class that holds the application

```dart
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
``` 
- A class extends StatelessWidget
    - Stateless widgets are that that dont hold any data
    - It forces to implement build method
    - Flutter automatically calls the build method when this widget is loaded
- The build method returns MaterialApp widget
    - MaterialApp is the starting point of your app, it tells Flutter that you are going to use Material components and follow material design in your app.
    - set properties like the Theme and title
    - most importantly, the home, which bootstraps our App

```dart
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}
``` 
- A Class extends StatefullWidget
    - The widget holds data
    - It forces to implement the createState method
    - Flutter automatically calls the createState method when this widget is loaded
- The createState method initializes a new state called _MyHomePageState();
    - files starting with _ means they are private and accessible to only this file
- The class also accepts two optional parameters Key key and String title
    - The Key is used to track the state from its creator ( framework handels it)
    - title is passed from class initialization

```dart
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

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
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
``` 
- The state extends State class and links to MyHomePage
- Has a state property called _counter initialized to 0
- Has a method that changes the state data by calling setState method
- By extending State class, you are forced to implement the build method
    - The build method will be auto called by framework when the widget for this state is loaded
- The build method returs a Scaffold widget
    - Scaffold is used under MaterialApp, it gives you many basic functionalities, like AppBar, BottomNavigationBar, Drawer, FloatingActionButton etc.
    - appBar is the top bar of the application
    - body is the main area of the application
    - floatingActionButton is a button shown at the bottom of the screen
- Body contains 2 Text Widgets, enclosed in Column Widget which is enclosed in Center widget
- https://flutter.dev/docs/development/ui/widgets for more reference

## How the app works

- when user clicks the floating action button the state is updated by incrementing the counter
- The UI is updated with the new value


## Add New functionality

1. Delete floatingActionButton, _incrementCounter, _counter, and Text widget showing the counter
2. See the hot reload in action

### Add a new button for left arrow

```dart
RaisedButton(
    onPressed: () => {
        setState(() {
        
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
``` 
- Add this button inside Column widget

### Delete the default text widget for `You have pushed the button this many times:`


### Add a Text widget next to button

```dart
Text(
    "dd-MM-yyyy",
    textAlign: TextAlign.center,
),
```


### Add a new button for right arrow

```dart
RaisedButton(
    onPressed: () => {
        setState(() {
        
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
``` 
- Add this button inside Column widget

### Add a dropdown with some default shopping categories

```dart
String category = 'Grocery';
```
- Add a property category inside `_MyHomePageState` 

```dart
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
        
    });
    },
    items: <String>[
    'Grocery',
    'Electronics',
    'Fashion',
    'Travel'
    ].map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
    );
    }).toList(),
),
```





```dart
void main() => runApp(MyApp());
``` 

```dart
void main() => runApp(MyApp());
``` 
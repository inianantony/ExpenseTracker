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
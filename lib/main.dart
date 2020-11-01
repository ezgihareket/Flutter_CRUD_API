import 'package:flutter/material.dart';
import 'package:flutter_api_test/src/screens/formadd/form_add_screen.dart';
import 'package:flutter_api_test/src/screens/home/home_screen.dart';

void main() => runApp(App());


GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.purple,
        accentColor: Colors.purple,
      ),
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            var result = await Navigator.push(
              _scaffoldState.currentContext,
              MaterialPageRoute(builder: (BuildContext context) {
                return FormAddScreen();
              }),
            );
            if (result != null) {
              setState(() {});
            }
          },
          child: Icon(Icons.add),
        ),
        key: _scaffoldState,
        appBar: AppBar(
          title: SafeArea(
            child: Text(
              "Flutter CRUD API",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        body: HomeScreen(),
      ),
    );
  }
}
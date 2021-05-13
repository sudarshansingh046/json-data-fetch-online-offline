import 'package:flutter/material.dart';
import 'package:flutterjson/offlinejson.dart';
import 'package:flutterjson/onlinejson.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.teal),
      home: MyApp1(),
    );
  }
}

class MyApp1 extends StatefulWidget {
  @override
  _MyApp1State createState() => _MyApp1State();
}

class _MyApp1State extends State<MyApp1> {
  @override
  Widget build(BuildContext context) {
    return

        //to fetch offline data home : HomePage()
        //to fetch online data home : HomePage1()
        Scaffold(
      appBar: AppBar(title: Text("load json")),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: ListView(
            padding: EdgeInsets.all(20.0),
            children: [
              OutlinedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return HomePage();
                  }));
                },
                child: Text(
                  "offline",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => HomePage1()));
                },
                child: Text(
                  "online",
                  style: TextStyle(fontSize: 40.0),
                ),
              )
            ],
          ),
        ),
      ),
      body: GradientText(
        'Hello this is an app in which json data is load go to drawer and click on buttons to see offline and online data.',
        shaderRect: Rect.fromLTWH(100.0, 250.0, 150.0, 10.0),
        gradient: Gradients.hotLinear,
        style: TextStyle(
          fontSize: 40.0,
        ),
      ),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage1 extends StatefulWidget {
  @override
  _HomePage1State createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
  String url =
      "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail";
  List data = [];

  @override
  void initState() {
    super.initState();
    getjsondata();
  }

  getjsondata() async {
    var response = await http.get(Uri.parse(url));
    setState(() {
      var convert = jsonDecode(response.body);
      data = convert["drinks"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("online Page"),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Card(
                    child: Container(
                      child: Column(
                        children: [
                          Text(data[index]["strDrink"]),
                          Text(data[index]["idDrink"]),
                          CircleAvatar(
                              maxRadius: 25.0,
                              child: Image.network(
                                data[index]["strDrinkThumb"],
                              ))
                        ],
                      ),
                      padding: EdgeInsets.all(20.0),
                    ),
                  )
                ],
              ),
            ),
          );
        },
        itemCount: data == null ? 0 : data.length,
      ),
    );
  }
}

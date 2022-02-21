import 'dart:convert';

import 'package:assign/model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Quote quote = Quote(quote: "place holder", author: "place holder");
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorkey =
      new GlobalKey<RefreshIndicatorState>();
  var content;
  var contentname;
  @override
  void initState() {
    fetchquo();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Appbar"),
        ),
        body: RefreshIndicator(
            key: _refreshIndicatorkey,
            child: ListView(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: Text(
                        quote.quote.toString(),
                        style: TextStyle(
                            fontSize: 21, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "-" + quote.author.toString(),
                    style: TextStyle(fontSize: 16),
                  ),
                )
              ],
            ),
            onRefresh: _refresh));
  }

  Future<Null> _refresh() {
    return fetchquo().then((_quote) {
      setState(() {
        quote = _quote;
      });
    });
  }
}

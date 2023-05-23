import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: New(),
  ));
}

class New extends StatefulWidget {
  @override
  State<New> createState() => _NewState();
}

class _NewState extends State<New> {
  @override
  void initState() {
    fetchdata();
    super.initState();
  }
  List photos = [];
  Future<void> fetchdata() async {
    final response =
        await http.get(Uri.parse('https://api.coindesk.com/v1/bpi/currentprice.json'));
    final data = json.decode(response.body);
    setState(() {
      photos = [data];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: photos.isEmpty
            ? Center(
                child: CircularProgressIndicator()): ListView.builder(
          itemCount: photos[0]['bpi'].length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(photos[0]['bpi']['USD']['code']),
              subtitle: Text(photos[0]['bpi']['USD']['rate'].toString()),
              trailing: Text(photos[0]['bpi']['USD']['rate_float'].toString()),
            );
          },
        ),
      ),
    );
  }
}

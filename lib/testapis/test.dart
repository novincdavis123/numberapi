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


  List photos = [];
  Future<void> fetchdata() async {
    final response =
        await http.get(Uri.parse('https://reqres.in/api/users?page=2'));
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
                child: ElevatedButton(onPressed: () {
                  fetchdata();
                }, child: Text('load'))): ListView.builder(
          itemCount: photos[0]['data'].length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: Image.network(photos[0]['data'][index]['avatar']),
              title: Text(photos[0]['data'][index]['email']),
              subtitle: Text(photos[0]['data'][index]["first_name"]),
            );
          },
        ),
      ),
    );
  }
}

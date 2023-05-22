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
    const apiurl = 'https://jsonplaceholder.typicode.com/photos';
    final response = await http.get(Uri.parse(apiurl));
    final data = json.decode(response.body);
    setState(() {
      photos = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: photos.isEmpty
            ? Center(
                child: ElevatedButton(onPressed: () {
                  fetchdata();
                }, child: Text('load')))
            : ListView.builder(
                itemCount: photos.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: Image.network(photos[index]["thumbnailUrl"],width: 150,fit:BoxFit.cover,),
                    title: Text(photos[index]['title']),
                    subtitle: Text('photo id:${photos[index]['id']}'),
                  );
                },
              ),
      ),
    );
  }
}

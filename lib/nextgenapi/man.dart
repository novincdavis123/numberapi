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
    final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));
    final data = json.decode(response.body);
    setState(() {
      photos = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
                itemCount: photos.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: Image.network(photos[index]["image"],width: 150,fit:BoxFit.cover,),
                    title: Text(photos[index]['rating']['rate'].toString()),
                    subtitle: Text('photo id:${photos[index]['id']}'),
                  );
                },
              ),
      ),
    );
  }
}

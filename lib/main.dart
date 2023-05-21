import 'package:flutter/material.dart';
import 'package:numberapi/apis.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  final Controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(controller: Controller,keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'number'),
              ),
              ElevatedButton(
                  onPressed: () {
                    final n=Controller.text;
                    getnumfact(number: n);
                  },
                  child: Text('get result')),
            ],
          ),
        ),
      ),
    );
  }
}

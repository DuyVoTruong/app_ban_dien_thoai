import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget{
  const HistoryPage({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("screen1"),
          ],
        ),
      ),
    );
  }
}
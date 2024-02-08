import 'package:flutter/material.dart';
class CounterApp extends StatefulWidget {
  Color buttonColor;
  CounterApp({Key? key, required this.buttonColor}) : super(key: key);

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  int counter = 0;
  void incCounter(){
    setState(() {
      counter++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: widget.buttonColor,
          onPressed: (){incCounter();}, child: Icon(Icons.add),),
      body: Center(child: Text('$counter', style: TextStyle(fontSize: 20),)),
    );
  }
}

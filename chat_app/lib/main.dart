import 'package:chat_app/counter.dart';
import 'package:chat_app/login_page.dart';
import 'package:chat_app/chat_page.dart';
import 'package:flutter/material.dart';



void main() {
  runApp(ChatApp());
}


class ChatApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "Chat app!!!",
        theme: ThemeData(primarySwatch: Colors.deepPurple,appBarTheme: AppBarTheme(backgroundColor: Colors.blue, foregroundColor: Colors.black)),
        // home: CounterApp(buttonColor: Colors.redAccent,),
        // home: ChatPage(),
        home: LoginPage(),
      routes: {
        '/chat': (context) => ChatPage()
      },
    );
  }

}

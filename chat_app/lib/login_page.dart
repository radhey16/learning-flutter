import 'package:chat_app/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/link.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);


  final userNameController =TextEditingController();
  final passwordController =TextEditingController();
  final _formkey = GlobalKey<FormState>();



  void loginUser(context){
    if(_formkey.currentState!=null && _formkey.currentState!.validate()){
      print("login successful ${userNameController.text}");
      Navigator.pushReplacementNamed(context, '/chat', arguments: '${userNameController.text}');
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder:
          //             (context) => ChatPage(username: userNameController.text,)
          //     ));
    }
    else {
      print("login unsuccessful ${userNameController.text}");
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        // body: Text(
        //   'Let\'s sign you in',
        //   style: TextStyle(
        //       fontSize: 30,
        //       color: Colors.brown,
        //       fontWeight: FontWeight.bold,
        //       letterSpacing: 0.5),
        // )
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Let\'s sign you in',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5),
              ),
              Text(
              'Welcome back \nYou\'ve been missed!',
                textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.green,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.5),
                  ),
              Image.asset('resources/banner_image.png', height: 200,),

              Form(
                key: _formkey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value){
                        if(value != null && value.isNotEmpty && value.length < 5) {
                          return "Your username should be more than 5 characters";
                        }
                        else if (value!= null && value.isEmpty){
                          return "Please type your username";

                        }
                        return null;
                      },

                      controller: userNameController,
                      decoration: InputDecoration(
                        hintText: "Add your username",
                        hintStyle: TextStyle(color: Colors.blueGrey),
                        border: OutlineInputBorder()
                      ),
                    ),
                    SizedBox(height: 25,),
                    TextFormField(
                      obscureText: true,
                      controller: passwordController,
                      decoration: InputDecoration(
                          hintText: "Add your password",
                          hintStyle: TextStyle(color: Colors.blueGrey),
                          border: OutlineInputBorder()
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25,),
              ElevatedButton(onPressed: (){
                  loginUser(context);
                },
                  child: Text('Login', style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
              SizedBox(height: 10,),
              GestureDetector(
                onTap: ()async{
                  print("ho");
                  if (!await launchUrl("https://www.linkedin.com/in/radheypatel16/" as Uri)) {
                  throw Exception('Could not launch');
                  }
                  // Uri toLaunch = Uri(scheme: 'https', host: 'www.cylog.org', path: 'headers/');
                  // _launchInBrowser(toLaunch);
                },
                child: Column(
                  children: [
                    Text("Find us on"),
                    Text("LinkedIn"),
                  ],
                ),
              )


            ],
          ),
        ),
      )
    );
  }
}

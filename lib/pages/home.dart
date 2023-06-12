import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:check_in/pages/sign_up_page.dart';
import 'package:check_in/services/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:check_in/pages/login_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  //used for user input
  TextEditingController mail_phone = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Check In',
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold
        ),),
        centerTitle: true,
      ),

      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

        Card(
          elevation: 8.0,
          color: Colors.blueGrey,
          margin: EdgeInsets.all(12.0),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [

              Padding(padding: EdgeInsets.only(left: 50.0)),

              SizedBox(
                height: 100,
                width: 300,
                child: TextField(
                  //textAlign: TextAlign.right,
                  controller: mail_phone,
                  //textInputAction: TextInputAction.next,

                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter your email or phone',
                    icon: Icon(Icons.email),
                  ),
                ),
              ),

              //Padding(padding: EdgeInsets.only(bottom: 50.0)),
              SizedBox(
                height: 100,
                width: 300,
                child: TextField(
                  obscureText: true,
                  controller: password,

                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    icon: Icon(Icons.lock),
                  ),
                ),
              ),
              ElevatedButton(onPressed: () async {
                final User? user = (await auth.signInWithEmailAndPassword(
                email: mail_phone.text,
                password: password.text,
                )
                ).user;
                // Future<bool> user = SignIn.userSignIn(mail_phone.text, password.text);
                print(user.toString());
                if(user==null) {
                  TextButton(
                    child: Text(''),
                    onPressed: () => showDialog(context: context, builder: (BuildContext context) =>
                    AlertDialog(
                      content: const Text('Invalid User Password'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Cancel'),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'OK'),
                          child: const Text('OK'),
                        ),
                      ],
                    )
                    ),
                  );
                }
                else {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage()));
                }

              }, child: Text(
                'Log in',

              ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  )
                ),
              ),
              Text('Don'"'"'t hava a account?'),
              ElevatedButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUp()));
              },
                  child: Text(
                    'Sign up'
                  ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                    )
                ),
              )
            ],
          ),

      ),
      ],
      ),
    );
  }
}

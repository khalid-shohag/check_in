import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:mysql_client/mysql_client.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:check_in/shared/Option.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:check_in/services/register.dart';
import 'package:check_in/services/alertDialog.dart';
import 'package:check_in/pages/home.dart';




class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController occupation = TextEditingController();
  TextEditingController nationality = TextEditingController();
  TextEditingController phoneMail = TextEditingController();
  TextEditingController password = TextEditingController();


  void sendData() {
    Map<String, dynamic> userData = {
      "firstName": firstName.text,
      "lastName": lastName.text,
      "occupation": occupation.text,
      "nationality": nationality.text,
      "phone_mail": phoneMail.text,
      // "password": password.text
    };
    FirebaseFirestore.instance.collection("user_info").add(userData);
  }



  // Future senddata() async {
  //   final response = await http.post(Uri.parse("localhost/data_check/insertdata.php"), body: {
  //     "firstname": firstName.text,
  //     "lastname": lastName.text,
  //     "occupation":occupation.text,
  //     "nationality": nationality.text,
  //     "phone": phoneMail.text,aw
  //     // "pass": password.text
  //   });
  //   print("Body: "+response.statusCode.toString());
  // }

  void authUser() async{
    bool mailAlreadyUse = await Register.userRegistration(phoneMail.text, password.text);
    print("Value:"+mailAlreadyUse.toString());
    if(mailAlreadyUse!=true) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
          alertDialog('Email already in use.\nGo Back\nJust Click Here', 1)));    }
    else {
      sendData();
      Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
          Home()));
    }

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(


      //color: Colors.grey,
      body: SafeArea(
        //mainAxisAlignment: MainAxisAlignment.start,
        //crossAxisAlignment: CrossAxisAlignment.center,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Padding(padding: EdgeInsets.only(right: 220)),
              Text(
                'Registration Form',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,

                ),
                textAlign: TextAlign.center,
              )
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 100,
                    width: 200,
                    child: TextField(
                      controller: firstName,
                      decoration: InputDecoration(
                          labelText: 'First Name',
                          icon: Icon(Icons.person),
                          hintText: 'Enter your First Name',
                      ),

                    ),
                  ),

                  SizedBox(
                    height: 100,
                    width: 200,
                    child: TextField(
                      controller: lastName,
                      decoration: InputDecoration(
                          labelText: 'Last Name',
                          icon: Icon(Icons.person),
                          hintText: 'Enter your Last Name'
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                    width: 200,
                    child: TextField(
                      controller: occupation,
                      decoration: InputDecoration(
                          labelText: 'Occupation',
                          icon: Icon(Icons.work),
                          hintText: 'Occupation'
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                    width: 200,
                    child: TextField(
                      controller: nationality,
                      decoration: InputDecoration(
                          labelText: 'Nationality',
                          icon: Icon(Icons.flag),
                          hintText: 'Enter your nationality'
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                    width: 200,
                    child: TextField(
                      controller: phoneMail,
                      decoration: InputDecoration(
                          labelText: 'Phone/Email',
                          icon: Icon(Icons.email),
                          hintText: 'Enter your Phone or Email'
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                    width: 200,
                    child: TextField(
                      controller: password,
                      decoration: InputDecoration(
                          labelText: 'Password',
                          icon: Icon(Icons.lock),
                          hintText: 'Enter your password'
                      ),
                    ),
                  ),
                  ElevatedButton(onPressed: (){
                    authUser();
                  },
                      child: Text(
                        'submit'
                      ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    )
                  ),)
                ],
              )
            ],
          ),
        ],
          ),
      ),

    ),
    );
  }
}

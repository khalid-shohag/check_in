import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      //color: Colors.grey,
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
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
                          hintText: 'Enter your First Name'
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
                ],
              )
            ],
          ),
        ],
      ),

    );
  }
}

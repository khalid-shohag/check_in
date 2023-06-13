import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:check_in/services/dashboard.dart';

class LoginPage extends StatefulWidget {
  var mail;
  LoginPage(this.mail);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var name = "", occupation="", nationality="";
  void getUserData() async {
    var document = await FirebaseFirestore.instance.collection('user_info').doc(widget.mail).get();
    Map<String, dynamic> ?data = document.data();

    setState(() {
      name = data?["firstName"]+" "+data?["lastName"];
      occupation = data?["occupation"];
      nationality = data?["nationality"];
    });


  }

  initState() {
    getUserData();
    print(widget.mail);
    print("Values: "+ name+" "+occupation+" "+nationality);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: UserDashboard(name, occupation, nationality, widget.mail),
    );
  }
}

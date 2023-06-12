import 'package:flutter/material.dart';
import 'package:check_in/pages/sign_up_page.dart';

class alertDialog extends StatefulWidget {
  const alertDialog({Key? key}) : super(key: key);

  @override
  State<alertDialog> createState() => _alertDialogState();
}

class _alertDialogState extends State<alertDialog> {
  @override
  Widget build(BuildContext context) {
     return Container(
       color: Colors.white24,
       child: ElevatedButton(onPressed: (){
         Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUp()));
       },
           child: Text('Email already in use.\nGo Back\nJust Click Here'),
       style: ElevatedButton.styleFrom(
           primary: Colors.indigo
       ),),
     );
  }
}

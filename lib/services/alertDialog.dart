import 'package:flutter/material.dart';
import 'package:check_in/pages/sign_up_page.dart';
import 'package:check_in/pages/home.dart';

class alertDialog extends StatefulWidget {
  var text, value;
  alertDialog(this.text, this.value);

  @override
  State<alertDialog> createState() => _alertDialogState();
}

class _alertDialogState extends State<alertDialog> {
  @override
  Widget build(BuildContext context) {
     return Container(
       color: Colors.white24,
       height: 400,
       width: 400,
       child: Row(
         mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.center,
       children: [


         ElevatedButton(onPressed: (){
         if(widget.value==1)
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUp()));
         else if(widget.value==2)
           Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home()));
       },
           child: Text(widget.text),
       style: ElevatedButton.styleFrom(
           primary: Colors.indigo
       ),),
    ],
       ),
     );
  }
}

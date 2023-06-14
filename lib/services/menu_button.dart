import 'package:flutter/material.dart';
import 'package:check_in/pages/home.dart';
import 'package:check_in/services/meter/add_new_meter.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

class MenuButton extends StatefulWidget {
  var mail;
  MenuButton(this.mail);

  @override
  State<MenuButton> createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButton> {
  SampleItem? selectedMenu;
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) => [
        PopupMenuItem(child: Row(
          children: [
            ElevatedButton(
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddNewMeter(widget.mail, counter)));
                  setState(() {
                    counter++;
                  });
                }
                , child: Text('Add new meter')),
          ],
        ),),
        PopupMenuItem(child: Row(
          children: [
            ElevatedButton(
                onPressed: (){}
                , child: Text('Payment')),
          ],
        ),),
        PopupMenuItem(child: Row(
          children: [
            ElevatedButton(
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
                  Home()));
                }
                , child: Text('Sign Out')),
          ],
        ),),
      ],
      offset: Offset(0, 70),
      color: Colors.yellowAccent,
    );
  }
}

import 'package:flutter/material.dart';

class UserDashboard extends StatefulWidget {
  var name, occupation, nationality, mail;
   UserDashboard(this.name, this.occupation, this.nationality, this.mail);

  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Dashboard',
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold
          ),),
        centerTitle: true,

      ),

      body: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Container(
                  height: 300,
                  width: 300,
                  color: Colors.green,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Text('User Info.',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),),
                      Padding(padding: EdgeInsets.only(bottom: 10)),
                      Text('Name: ',style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                      Text(widget.name, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,
                      color: Colors.white),),
                      Padding(padding: EdgeInsets.only(bottom: 10)),
                      Text("Occupation: ",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                      Text(widget.occupation, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,
                          color: Colors.white),),
                      Padding(padding: EdgeInsets.only(bottom: 10)),
                      Text("Nationality: ",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                      Text(widget.nationality, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,
                          color: Colors.white),),
                      Padding(padding: EdgeInsets.only(bottom: 10)),
                      Text("Email: ",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                      Text(widget.mail, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,
                          color: Colors.white),),
                      Padding(padding: EdgeInsets.only(bottom: 10)),
                      Text("Meter No: ",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
                // Padding(padding: EdgeInsets.only(left: 10)),
                Container(
                  height: 150,
                  width: 300,
                  color: Colors.blueGrey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Current Meter Reading- ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),),
                    ],
                  ),
                ),
                Container(
                  height: 150,
                  width: 300,
                  color: Colors.white38,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Billing- ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  height: 300,
                  width: 300,
                  color: Colors.indigo,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Text('Billing History',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),),
                    ],
                  ),
                ),
                // Padding(padding: EdgeInsets.only(left: 10)),
                Container(
                  height: 150,
                  width: 300,
                  color: Colors.pinkAccent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Energy Usage ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),),
                    ],
                  ),
                ),
                Container(
                  height: 150,
                  width: 300,
                  color: Colors.yellow,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Recommendation ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

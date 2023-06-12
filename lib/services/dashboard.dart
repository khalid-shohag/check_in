import 'package:flutter/material.dart';

class UserDashboard extends StatefulWidget {
  const UserDashboard({Key? key}) : super(key: key);

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
                      Text('Name: '),
                      Padding(padding: EdgeInsets.only(bottom: 10)),
                      Text("Occupation: "),
                      Padding(padding: EdgeInsets.only(bottom: 10)),
                      Text("Nationality: "),
                      Padding(padding: EdgeInsets.only(bottom: 10)),
                      Text("Email: "),
                      Padding(padding: EdgeInsets.only(bottom: 10)),
                      Text("Meter No: "),
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

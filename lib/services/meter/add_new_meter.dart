import 'package:flutter/material.dart';

class AddNewMeter extends StatefulWidget {
  const AddNewMeter({Key? key}) : super(key: key);

  @override
  State<AddNewMeter> createState() => _AddNewMeterState();
}

class _AddNewMeterState extends State<AddNewMeter> {
  TextEditingController meterNo = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meter List'),
        centerTitle: true,
      ),

      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.only(bottom: 100)),
              SizedBox(
                height: 100,
                width: 400,
                child: TextField(
                  controller: meterNo,
                  decoration: InputDecoration(
                    labelText: 'Meter No',
                    hintText: 'Meter No',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                  ),
                ),
              ),
              ElevatedButton(onPressed: (){},
                  child: Text('submit'),
              )
            ],
          )
        ],
      ),
    );
  }
}

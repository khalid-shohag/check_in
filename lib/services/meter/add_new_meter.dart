import 'dart:html';
import 'dart:js_interop';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddNewMeter extends StatefulWidget {
  var mail, counter;
  AddNewMeter(this.mail, this.counter);

  @override
  State<AddNewMeter> createState() => _AddNewMeterState();
}

class _AddNewMeterState extends State<AddNewMeter> {
  TextEditingController meterNo = TextEditingController();
  TextEditingController previousReading = TextEditingController(); //initial or previous reading

  var noOne = "", prevReadOne="", currentReadOne="";
  var noTwo = "", prevReadTwo="", currentReadTwo="";
  var noThree= "", prevReadThree="", currentReadThree="";
  void getMeterData() async {
    var documentOne = await FirebaseFirestore.instance.collection('meter_data').doc(widget.mail).collection('all_meter').doc('1').get();
    Map<String, dynamic> ?data = documentOne.data();

    print("nsdjknfjlsen");
      setState(() {
        noOne = data?["meter_no"];
        prevReadOne = data?["previous_reading"];
        currentReadOne = data?["current_reading"];
      });

    var documentTwo = await FirebaseFirestore.instance.collection('meter_data').doc(widget.mail).collection('all_meter').doc('2').get();
    data = documentTwo.data();
    if(data?.isNotEmpty!=null) {
      setState(() {
        noTwo = data?["meter_no"];
        prevReadTwo = data?["previous_reading"];
        currentReadTwo= data?["current_reading"];
      });
    }
    var documentThree = await FirebaseFirestore.instance.collection('meter_data').doc(widget.mail).collection('all_meter').doc('3').get();
    data = documentThree.data();
    if(data?.isNotEmpty!=null) {
      setState(() {
        noThree = data?["meter_no"];
        prevReadThree = data?["previous_reading"];
        currentReadThree= data?["current_reading"];
      });
    }


  }

  void sendMeterData() async{
    Map<String, dynamic> meterData = {
      "meter_no": meterNo.text,
      "previous_reading": previousReading.text,
      "current_reading": previousReading.text,
    };


    // int len = await FirebaseFirestore.instance.collection('meter_data').snapshots().length;
    // print("length: "+len.toString());
    int len = 0;

    //find the length to give the document name for easy accessing later
    FirebaseFirestore.instance.collection("meter_data").doc(widget.mail).collection('all_meter').count().get().then(
          (res) {
            len = res.count;
            print(res.count) ;
          },
      onError: (e) => print("Error completing: $e"),
    );
    len = len+1;
    String length = (len+1) . toString();
    print("Len: "+length);
    FirebaseFirestore.instance.collection('meter_data').doc(widget.mail).collection('all_meter').doc(length).set(meterData);

  }

  initState() {
    getMeterData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            noOne!=null?'Meter List':'uuofew'),
        centerTitle: true,
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.only(bottom: 10)),
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
              SizedBox(
                height: 100,
                width: 200,
                child: TextField(
                  controller: previousReading,
                  decoration: InputDecoration(
                    labelText: 'Initial reading',
                    hintText: 'Initial reading',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                  ),
                ),
              ),
              ElevatedButton(onPressed: (){
                sendMeterData();
                getMeterData();
              },
                  child: Text('submit'),
              )
            ],
          ),
          Padding(padding: EdgeInsets.only(bottom: 30)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.white,
                padding: EdgeInsets.all(20.0),
                child: DataTable(
                  columns: const <DataColumn>[
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          'No.',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          'Meter No.',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          'Previous Readings',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          'Current Readings',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                    ),
                  ],
                  rows:  <DataRow>[
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text(
                            '1'), //remove const keyword if any, when add variable to Text widget
                        ),
                        DataCell(Text(
                          noOne!=null?noOne:''
                        )),
                        DataCell(Text(
                          prevReadOne!=null? prevReadOne:' Blank'
                        )),
                        DataCell(Text(
                          currentReadOne!=null?currentReadOne:'Blank'
                        )),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text(
                            '2'), //remove const keyword if any, when add variable to Text widget
                        ),
                        DataCell(Text(
                            noTwo!=null?noTwo:''
                        )),
                        DataCell(Text(
                            prevReadTwo!=null? prevReadTwo:' Blank'
                        )),
                        DataCell(Text(
                            currentReadTwo!=null?currentReadTwo:'Blank'
                        )),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text(
                            '3'), //remove const keyword if any, when add variable to Text widget
                        ),
                        DataCell(Text(
                            noThree!=null?noThree:''
                        )),
                        DataCell(Text(
                            prevReadThree!=null? prevReadThree:' Blank'
                        )),
                        DataCell(Text(
                            currentReadThree!=null?currentReadThree:'Blank'
                        )),
                      ],
                    ),
                  ],
                )
              )
        ],
          ),
        ],
      ),
    );
  }
}

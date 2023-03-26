import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("About"),
          backgroundColor: Colors.lightGreen,
          centerTitle: true,
        ),
        body: Container(
         
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                    child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "Plant species detection systems is an android vision and machine learning technique that allow the user to detect plant species.The system will provide the functionality of detecting plant using mobile camera in real time or choose plant image form mobile gallery.The system will help user to show the detailed information of the detected plant. Plant Species Detection system classified 100 different indoor and outdoor plants species based on their plant shape and plant leaves",
                 
                 textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 16.0,color: Colors.black.withOpacity(0.6)),
                  ),
                ))
              ]),
        ));
  }
}

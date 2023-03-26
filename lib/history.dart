import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class History extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("History")),
          backgroundColor: Colors.lightGreen,
          automaticallyImplyLeading: false,
        ),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            opacity: 0.8,
            image: AssetImage("images/b1.jpeg"),
            fit: BoxFit.cover,
          )),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [const Center(child: Text("Searching History of the user"))]),
        ));
  }
}

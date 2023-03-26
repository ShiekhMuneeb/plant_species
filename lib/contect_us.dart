import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
          title:  Text("Contact Us"),
          centerTitle: true,
          backgroundColor: Colors.lightGreen,
        
        ),
      body: Column(
        children: [
          Container(
                  height:MediaQuery.of(context).size.height * .25,
                  width:MediaQuery.of(context).size.height * .8,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                 
                  child: Card(
                    elevation: 4,
                    child: Column(
                      children: [
                         Padding(
                    padding: const EdgeInsets.only(top:30),
                    child: Text(
                      "Email",
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.teal,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(2.0),
                    child: Center(
                      child: Text("abc@gmail.com",
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                          )),
                    ),
                  ),
                     Padding(
                    padding: const EdgeInsets.only(top:30),
                    child: Text(
                      "Call Us",
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.teal,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(2.0),
                    child: Center(
                      child: Text("03111111111",
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                          )),
                    ),
                  ),
                      ],
                      
                    ),
                  ),
                 ),
        ],
      )
    );
  }
}
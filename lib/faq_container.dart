import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget faqContainer(String question,String answer,BuildContext context){
  return Container(
                //  height:MediaQuery.of(context).size.height * .25,
                  width:MediaQuery.of(context).size.height * .8,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  padding: EdgeInsets.only(bottom: 30),
                  child: Card(
                    elevation: 4,
                    child: Column(
                      children: [
                         Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text(
                      "Q1: How many Plant Species it Detect? ",
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
                      child: Text(" it will detect almost 100 species",
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                          )),
                    ),
                  ),
                  SizedBox(height:50)
                      ],
                    ),
                  ),
                 );
}
import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:plant_species/dashboard.dart';

class Result extends StatefulWidget {
  const Result({super.key});

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  File? imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Result",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w900,
              color: Colors.white,
              letterSpacing: 2,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.lightGreen,
        ),
        body: SingleChildScrollView(
          // decoration: const BoxDecoration(
          //     image: DecorationImage(
          //   opacity: 0.6,
          //   image: AssetImage("images/b1.jpeg"),
          //   fit: BoxFit.cover,
          // )
          // ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 250,
                child: Stack(children: [
                  Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                        margin: EdgeInsets.only(top: 3),
                        color: Colors.black.withOpacity(.5),
                        height: 240,
                        width: MediaQuery.of(context).size.width * 1,
                        child: Image.file(File(Dashboard.imageResult!.path),
                            fit: BoxFit.fill),
                      )),
                  Positioned(
                      top: 190,
                      left: 20,
                      child: Container(
                          margin: EdgeInsets.only(top: 3),
                          height: 240,
                          width: MediaQuery.of(context).size.width * 1,
                          child: Text(
                            'Ageratum ',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                              letterSpacing: 2,
                            ),
                          ))),
                ]),
              ),
              SizedBox(height: 5),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  'Family Name',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Colors.black.withOpacity(0.7),
                    // letterSpacing: 2,
                  ),
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  'Asteraceae',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    color: Colors.lightGreen.withOpacity(.8),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  'Description',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Colors.black.withOpacity(0.7),
                    // letterSpacing: 2,
                  ),
                ),
              ),
              SizedBox(height: 5),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                // alignment: Alignment.center,
                child: Text(
                  'Ageratum is prized for its blue flowers and is one of best blue-flowered annuals available. Ageratum performs best in the late spring and early summer and in the early fall. Some varieties have more heat tolerance especially the vegetatively propagated types.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                    color: Colors.lightGreen.withOpacity(.8),
                  ),
                ),
              )
              // SizedBox(
              //   height: 20,
              // ),
              // Padding(
              //   padding:EdgeInsets.only(left:20,right:20),
              //   child: RichText(
              //     text: TextSpan(
              //       style: TextStyle(color: Colors.lightGreen, fontSize: 25),
              //       children: [
              //         TextSpan(
              //           text: '  Ageratum ' + "(Plant Name)",

              //         ),
              //         WidgetSpan(
              //           child: Transform.translate(
              //             offset: const Offset(0.0, 4.0),
              //             child: Text(
              //               ' Ageratum is prized for its blue flowers and is one of best blue-flowered annuals available. Ageratum performs best in the late spring and early summer and in the early fall. Some varieties have more heat tolerance especially the vegetatively propagated types.',
              //               style: TextStyle(
              //                   color: Colors.lightGreen, fontSize: 16,)
              //             ),
              //           ),
              //         ),
              //         TextSpan(
              //           text: '  Asteraceae ' + " (Family Name)",
              //         ),
              //       ],
              //     ),
              //   ),
              // )
            ],
          ),
        ));
  }
}

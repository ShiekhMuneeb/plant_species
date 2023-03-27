import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plant_species/faq.dart';
import 'package:plant_species/result.dart';
import 'about.dart';
import 'action_card.dart';
import 'contect_us.dart';
import 'package:http/http.dart' as http;

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  static File? imageResult;

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  File? imageFile;
  int currentIndex = 0;

  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: Row(
        children: [
          const CircularProgressIndicator(
            color: Colors.lightGreen,
          ),
          Container(
              margin: const EdgeInsets.only(left: 7),
              child: const Text("Processing...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 250,
      maxHeight: 250,
    );
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      Dashboard.imageResult = File(pickedFile.path);

      setState(() {});
    }
  }

  _proceed() {
    if (Dashboard.imageResult == null) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('kindly select an Image')));
      return;
    } else {
      _uploadImage(imageFile as File);
      showLoaderDialog(context);
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.pop(context);
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Result(),
            ));
      });
    }
  }

  Future<String> _uploadImage(File imageFile) async {
    var stream = http.ByteStream(imageFile.openRead());
    var length = await imageFile.length();

    var uri = Uri.parse('http://yourdjangoserver.com/upload-image/'); // Replace with your Django server URL

    var request = http.MultipartRequest('POST', uri);
    var multipartFile = http.MultipartFile('image_file', stream, length,
        filename: (imageFile.path));

    request.files.add(multipartFile);
    var response = await request.send();

    if (response.statusCode == 200) {
      return await response.stream.transform(utf8.decoder).join();
    } else {
      return "Failed to Upload";
    }
  }

  /// Get from camera
  _getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 250,
      maxHeight: 250,
    );
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      Dashboard.imageResult = File(pickedFile.path);

      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Center(child: Text("Please Select the option")),
        elevation: 0,
        backgroundColor: Colors.lightGreen,
        //    actions: [
        //   PopupMenuButton(
        //       icon: Icon(Icons.more_vert_sharp),
        //       itemBuilder: (
        //         context,
        //       ) =>
        //           [
        //             PopupMenuItem(value: 1, child: Text("History")),
        //             PopupMenuItem(value: 2, child: Text("Setting")),
        //             PopupMenuItem(value: 3, child: Text("Frequently Question"))
        //           ])
        // ],
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: const Text(
                "Plant Species Detection",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                ),
              ),
              accountEmail: const Text(""),
              currentAccountPicture: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child:
                      Image.asset('images/logo.png', height: 150, width: 150)),
              decoration:
                  BoxDecoration(color: Colors.lightGreen.withOpacity(.7)),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.question_answer),
              title: const Text("FAQ's"),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: ((context) => FAQ())));
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text("About"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => About())));
              },
            ),
            ListTile(
              leading: const Icon(Icons.contacts),
              title: const Text("Contact Us"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => ContactUs())));
              },
            ),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          opacity: 0.7,
          image: AssetImage("images/b1.jpeg"),
          fit: BoxFit.cover,
        )),
        child: Container(
          margin: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Expanded(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (imageFile != null)
                          SizedBox(
                            height: 150,
                            width: 150,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.file(
                                File(imageFile!.path),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                      ]),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ActionCard(
                      // height: 120,
                      // width: 120,
                      title: 'Gallery',
                      anim: 'gallery',
                      voidCallback: () => _getFromGallery()),
                  // SizedBox.fromSize(
                  //   size: const Size(80, 80), // button width and height
                  //   child: ClipOval(
                  //     child: Material(
                  //       color: Colors.lightGreen, // button color
                  //       child: InkWell(
                  //         splashColor: Colors.green, // splash color
                  //         onTap: () => _getFromGallery(), // button pressed
                  //         child: Column(
                  //           mainAxisAlignment: MainAxisAlignment.center,
                  //           children: const <Widget>[
                  //             Icon(
                  //               Icons.image_search,
                  //               color: Colors.white,
                  //               size: 30.0,
                  //             ), // icon
                  //             Text(
                  //               "Gallery",
                  //               style: TextStyle(
                  //                 fontWeight: FontWeight.bold,
                  //                 color: Colors.white,
                  //               ),
                  //             ), // text
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(
                    width: 10,
                  ),
                  ActionCard(
                      title: 'Camera',
                      anim: 'camera',
                      voidCallback: () => _getFromCamera())
                  // SizedBox.fromSize(
                  //     size: const Size(80, 80), // button width and height
                  //     child: ClipOval(
                  //         child: Material(
                  //             color: Colors.lightGreen, // button color
                  //             child: InkWell(
                  //               splashColor: Colors.green, // splash color
                  //               onTap: () => _getFromCamera(), // button pressed
                  //               child: Column(
                  //                 mainAxisAlignment: MainAxisAlignment.center,
                  //                 children: const <Widget>[
                  //                   Icon(
                  //                     Icons.camera_alt,
                  //                     color: Colors.white,
                  //                     size: 30.0,
                  //                   ), // icon
                  //                   Text("Camera",
                  //                       style: TextStyle(
                  //                         fontWeight: FontWeight.bold,
                  //                         color: Colors.white,
                  //                       )), // text
                  //                 ],
                  //               ),
                  //             )))),
                ],
              ),
              const SizedBox(height: 10),
              ActionCard(
                  // height: 50,
                  // width: 200,
                  animOnly: true,
                  title: 'Proceed',
                  anim: 'procced',
                  voidCallback: () => _proceed())
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   children: [
              //     TextButton(
              //       onPressed: () {
              //         if (Dashboard.imageResult == null) {
              //           ScaffoldMessenger.of(context).showSnackBar(
              //               const SnackBar(content: Text('kindly select an Image')));
              //           return;
              //         } else {
              //           _uploadImage();
              //           showLoaderDialog(context);
              //           Future.delayed(const Duration(seconds: 3), () {
              //             Navigator.pop(context);
              //             Navigator.push(
              //                 context,
              //                 MaterialPageRoute(
              //                   builder: (context) => const Result(),
              //                 ));
              //           });
              //         }
              //       },
              //       child: Container(
              //         height: 50,
              //         width: 170,
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(25),
              //           color: Colors.lightGreen,
              //         ),
              //         child: const Center(
              //             child: Text(
              //           "DETECT",
              //           style: TextStyle(
              //               color: Colors.white,
              //               fontSize: 20,
              //               fontWeight: FontWeight.w900,
              //               letterSpacing: 3),
              //         )),
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

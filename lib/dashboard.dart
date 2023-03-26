import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plant_species/faq.dart';
import 'package:plant_species/home.dart';
import 'package:plant_species/result.dart';
import 'about.dart';
import 'contect_us.dart';
import 'navigation.dart';
import 'package:http/http.dart' as http;

class Dashboard extends StatefulWidget {
  Dashboard({super.key});
  static File? image_result;
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  File? imageFile;
  int _currentindex = 0;

  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          const CircularProgressIndicator(
            color: Colors.lightGreen,
          ),
          Container(
              margin: EdgeInsets.only(left: 7),
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
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      Dashboard.image_result = File(pickedFile.path);

      setState(() {});
    }
  }

  _uploadImage() async {
    var postUri = "http://127.0.0.1:8000";
    const String apiKey = "image_file";
    http.MultipartRequest req =
        http.MultipartRequest("POST", Uri.parse(postUri));
    http.MultipartFile mpf =
        await http.MultipartFile.fromString('file', imageFile!.path);
    req.files.add(mpf);
    req.fields['key'] = apiKey;
    http.StreamedResponse res = await req.send();
    
   
 }


  /// Get from camera
  _getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      Dashboard.image_result = File(pickedFile.path);

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
              accountName: Text(
                "Plant Species Detection",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                ),
              ),
              accountEmail: Text(""),
              currentAccountPicture: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child:
                      Image.asset('images/logo.png', height: 200, width: 200)),
              decoration:
                  BoxDecoration(color: Colors.lightGreen.withOpacity(.7)),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.question_answer),
              title: Text("FAQ's"),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: ((context) => FAQ())));
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text("About"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => About())));
              },
            ),
            ListTile(
              leading: Icon(Icons.contacts),
              title: Text("Contact Us"),
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
                          height: 200,
                          width: 200,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
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
                SizedBox.fromSize(
                  size: const Size(80, 80), // button width and height
                  child: ClipOval(
                    child: Material(
                      color: Colors.lightGreen, // button color
                      child: InkWell(
                        splashColor: Colors.green, // splash color
                        onTap: () => _getFromGallery(), // button pressed
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Icon(
                              Icons.image_search,
                              color: Colors.white,
                              size: 30.0,
                            ), // icon
                            const Text(
                              "Gallery",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ), // text
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox.fromSize(
                    size: const Size(80, 80), // button width and height
                    child: ClipOval(
                        child: Material(
                            color: Colors.lightGreen, // button color
                            child: InkWell(
                              splashColor: Colors.green, // splash color
                              onTap: () => _getFromCamera(), // button pressed
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  const Icon(
                                    Icons.camera_alt,
                                    color: Colors.white,
                                    size: 30.0,
                                  ), // icon
                                  const Text("Camera",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      )), // text
                                ],
                              ),
                            )))),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    if (Dashboard.image_result == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('kindly select an Image')));
                      return;
                    } else {
                      _uploadImage();
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
                  },
                  child: Container(
                    height: 50,
                    width: 170,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.lightGreen,
                    ),
                    child: const Center(
                        child: Text(
                      "DETECT",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 3),
                    )),
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

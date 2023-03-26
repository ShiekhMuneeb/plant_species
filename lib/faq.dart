import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'faq_container.dart';

class FAQ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:  Text("FAQ"),
          centerTitle: true,
          backgroundColor: Colors.lightGreen,
        
        ),
        body: Container(
           
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:  [
                 faqContainer("Q1: What is the purpose of the plant species detection and classification system? ","Answer: The system is designed to identify and classify plant species using an Android device. \n",context),
                 faqContainer("Q2: How accurate is the system in identifying plant species? ","Answer: The system has an accuracy rate of up to 90% in identifying plant species. \n",context),
                 faqContainer("Q3: What kind of images can the system analyze? ","Answer: The system can analyze images of various parts of the plant, including leaves, and whole plant. \n",context),
                 faqContainer("Q4: How does the system classify different plant species? ","Answer: The system uses machine learning algorithms to analyze the unique features of each plant species and classify them accordingly. \n",context),
                 faqContainer("Q5: Can the system be used for plant species identification in the wild? ","Answer: Yes, the system can be used for plant species identification in the wild as long as there is a clear image of the plant. \n",context),
                 faqContainer("Q6: Does the system require an internet connection to function? ","Answer: Yes, the system requires an internet connection to function. \n",context),
                 faqContainer("Q7: What is the minimum Android version required to use the system? ","Answer: The system requires Android version 9.0 or above to function. \n",context),
                 faqContainer("Q8: Can the system be used by non-experts in botany? ","Answer: Yes, the system is designed to be user-friendly and can be used by anyone with basic knowledge of how to operate an Android device. \n",context),
                 faqContainer("Q9: How many plant species can the system identify? ","Answer: The system can identify and classify more than 20 different plant species. \n",context),
                 faqContainer("Q10: Is the system available for download on the Google Play Store? ","Answer: No, the system is not available for download on the Google Play Store yet. \n",context),
               
                ],
              ),
            )));
  }
}

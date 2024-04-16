import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:g4c/presentation/components/btn_black.dart';
import 'package:g4c/presentation/components/g4c_drawer.dart';
import 'package:g4c/presentation/components/text_fields.dart';
import 'package:g4c/presentation/components/txt_input.dart';
import 'package:g4c/presentation/components/txt_input_large.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();
  int starIndex = 0;

  changeStars(int index) {
    setState(() {
      starIndex = index;
    });
  }

  saveFeedBack() async {
    try {
      // validate before save feedback
      if (nameController.text.trim().isEmpty) {
        return ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Please fill your name"),
        ));
      }
      if (emailController.text.trim().isEmpty) {
        return ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Please fill email"),
        ));
      }
      if (messageController.text.trim().isEmpty) {
        return ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Please fill message"),
        ));
      }
      if (starIndex == 0) {
        return ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Please Rate Us"),
        ));
      }

      // save on firebase
      final db = FirebaseFirestore.instance;

      final data = {
        "name": nameController.text.trim(),
        "email": emailController.text.trim(),
        "message": messageController.text.trim(),
        "rate": starIndex,
        "timestamp": Timestamp.now().millisecondsSinceEpoch,
      };

      await db.collection("feedback").add(data).then((value) {
        // feedback saved complete
        clearText();
        return ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Thank you submit the feedback."),
        ));
      });
    } catch (exception) {
      print(exception);
      return ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Something went wrong! Try Again."),
      ));
    }
  }

  clearText() {
    setState(() {
      nameController.clear();
      emailController.clear();
      messageController.clear();
      starIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: G4CAppBar('Contact us', true),
      drawer: const G4CDrawer(),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              const SizedBox(
                height: 20,
              ),
              Center(child: heading("Send Us Your Feedback !")),
              const SizedBox(
                height: 10,
              ),
              TxtInput(
                fieldName: "Your Name *",
                controller: nameController,
              ),
              const SizedBox(
                height: 20,
              ),
              TxtInput(
                fieldName: "Email *",
                controller: emailController,
              ),
              const SizedBox(
                height: 20,
              ),
              subheading("Message *", hrPadding: 0),
              const SizedBox(
                height: 8,
              ),
              TxtInputLarge(
                fieldName: "Type here.......",
                controller: messageController,
                maxLines: 6,
              ),
              const SizedBox(
                height: 20,
              ),
              subheading("How Do You Rate Us ! *", hrPadding: 0),
              SizedBox(
                height: 50,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          changeStars(index + 1);
                        },
                        child: Icon(
                            size: 35,
                            index < starIndex ? Icons.star : Icons.star_border,
                            color: index < starIndex
                                ? Colors.deepOrangeAccent
                                : Colors.black),
                      );
                    }),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: BtnBlack(
                  onpressed: () {
                    saveFeedBack();
                  },
                  btnText: 'Send Feedback',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

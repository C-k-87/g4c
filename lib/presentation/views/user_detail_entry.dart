import 'dart:io';
import 'dart:typed_data';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:g4c/domain/use_cases/routing.dart';
import 'package:image_picker/image_picker.dart';
import 'package:g4c/presentation/components/btn_black.dart';
import 'package:g4c/presentation/components/btn_arrow_icon.dart';
import 'package:g4c/presentation/components/top_card.dart';
import 'package:g4c/presentation/views/extra_activity.dart';
import 'package:g4c/presentation/views/extra_course.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UserDetails extends StatefulWidget {
  final String? username; // Add username as a parameter

  const UserDetails({super.key, this.username});

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  String? dropdownValue;
  Uint8List? _image;

  @override
  void initState() {
    super.initState();
    dropdownValue = null;
  }

  @override
  Widget build(BuildContext context) {
    var items = ['BCS General Degree', "Other"];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 195, 255, 195),
        toolbarHeight: 35.0,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          clipBehavior: Clip.hardEdge,
          shrinkWrap: true,
          children: [
            const SizedBox(
              child: TopCard(
                content: Center(
                  child: Image(
                    image: AssetImage(
                      'asset_lib/images/G4C_logo_transparent.png',
                    ),
                    width: 200.0,
                  ),
                ),
                color: Color.fromARGB(255, 195, 255, 195),
              ),
            ),
            const SizedBox(height: 40.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Hi",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.username ?? "user",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "PERSONAL INFO",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                  ),
                ),
                const SizedBox(height: 20),
                imageProfile(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Degree Program',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(width: 20),
                    DropdownButton<String>(
                      value: dropdownValue,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: items.map((String items) {
                        return DropdownMenuItem<String>(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const SizedBox(width: 35),
                    const Text(
                      'Extra Activities',
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(width: 75),
                    BtnNavigation1(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ExtraActivity()),
                        );
                      },
                      iconData: Icons.arrow_forward,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const SizedBox(width: 35),
                    const Text(
                      'Extra Courses',
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(width: 83),
                    BtnNavigation1(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ExtraCourse(),
                          ),
                        );
                      },
                      iconData: Icons.arrow_forward,
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                BtnBlack(
                  btnText: 'Save',
                  onpressed: () {
                    // TODO : SAVE VARIABLES TO FIRESTORE AND SET SHARED PREFERENCES
                    if (dropdownValue != null) {
                      saveUserDetails(file: _image);
                      navtoWelcomePage(context);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Please select a degree program.',
                          ),
                        ),
                      );
                    }
                  },
                ),
                const SizedBox(height: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget imageProfile() {
    return Stack(
      children: [
        _image != null
            ? CircleAvatar(
                radius: 80.0,
                backgroundImage: MemoryImage(_image!),
              )
            : const CircleAvatar(
                radius: 80.0,
                backgroundImage: AssetImage('asset_lib/images/pofile.png'),
              ),
        Positioned(
          bottom: -10,
          right: 10.0,
          child: IconButton(
            onPressed: () {
              bottomSheet(context);
            },
            icon: const Icon(Icons.camera_alt),
          ),
        ),
      ],
    );
  }

  void bottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (builder) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 4.5,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      "Choose Profile Photo",
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: _pickImageFromGallery,
                      child: const SizedBox(
                        child: Column(
                          children: [
                            Icon(Icons.image, size: 50),
                            Text("Gallery"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _pickImageFromGallery() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path).readAsBytesSync();
      });
    }
    mounted ? Navigator.of(context).pop() : null;
  }

  final FirebaseStorage _storage = FirebaseStorage.instance;
  Future<String> uploadImageToStorage(String childName, Uint8List? file) async {
    if (file != null) {
      Reference ref = _storage.ref().child(childName);
      UploadTask uploadTask = ref.putData(file);
      TaskSnapshot snapshot = await uploadTask;
      String downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    }
    return '';
  }

  Future<void> saveUserDetails({
    required Uint8List? file,
  }) async {
    try {
      // Upload the image to Firebase Storage

      String? imageUrl = await uploadImageToStorage('profileImage', file);

      final db = FirebaseFirestore.instance;
      final user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        final data = {
          "degreeProgram": dropdownValue,
          "profileImage": imageUrl, // Add the image URL to the user details
        };

        // Use user's UID as document ID
        await db
            .collection("Users")
            .doc(user.uid)
            .set(data, SetOptions(merge: true));
      }
    } catch (e) {
      mounted
          ? ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Failed to save user details: $e'),
              ),
            )
          : null;
    }
  }
}

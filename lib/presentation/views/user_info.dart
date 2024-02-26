import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:g4c/presentation/components/btn_black.dart';
import 'package:g4c/presentation/components/btn_arrow_icon.dart';
import 'package:g4c/presentation/components/top_card.dart';
import 'package:g4c/presentation/views/personality_quizes_main.dart';
import 'package:image_picker/image_picker.dart';

class UserDetails extends StatefulWidget {
  final String username; // Add username as a parameter

  const UserDetails({Key? key, required this.username}) : super(key: key);

  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  String? dropdownValue;
  Uint8List? _image;
  File? selectedIMage;

  @override
  void initState() {
    super.initState();
    dropdownValue = null;
  }

  @override
  Widget build(BuildContext context) {
    final col1 = const Color.fromARGB(255, 195, 255, 195);
    var items = ['BCS General Degree', "Other"];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: col1,
        toolbarHeight: 35.0,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          clipBehavior: Clip.hardEdge,
          shrinkWrap: true,
          padding: null,
          children: [
            SizedBox(
              child: TopCard(
                content: const Center(
                  child: Image(
                    image: AssetImage(
                      'asset_lib/images/G4C_logo_transparent.png',
                    ),
                    width: 200.0,
                  ),
                ),
                color: col1,
              ),
            ),
            const SizedBox(
              height: 40.0,
            ),
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
                  widget.username,
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
                const SizedBox(
                  height: 20,
                ),
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
                    const SizedBox(
                      width: 20,
                    ),
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
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 35,
                    ),
                    const Text(
                      'Extra Activities',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 75,
                    ),
                    BtnNavigation1(
                      onPressed: () {
                        // Define onPressed behavior here
                      },
                      iconData: Icons.arrow_forward,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 35,
                    ),
                    const Text(
                      'Extra Courses',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 83,
                    ),
                    BtnNavigation1(
                      onPressed: () {
                        // Define onPressed behavior here
                      },
                      iconData: Icons.arrow_forward,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                BtnBlack(
                  btnText: 'Save',
                  onpressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PersonalityMain(),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  imageProfile() {
    return Stack(
      children: [
        _image != null
            ? CircleAvatar(radius: 80.0, backgroundImage: MemoryImage(_image!))
            : const CircleAvatar(
                radius: 80.0,
                backgroundImage: AssetImage(
                  'asset_lib/images/pofile.png',
                ),
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

  // ignore: non_constant_identifier_names
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
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Choose Profile Photo",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        _PickImageFromGallery();
                      },
                      child: const SizedBox(
                        child: Column(
                          children: [
                            Icon(
                              Icons.image,
                              size: 50,
                            ),
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

  // ignore: non_constant_identifier_names
  Future _PickImageFromGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {
      var selectedIMage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    // ignore: use_build_context_synchronously
    Navigator.of(context).pop();
  }
}

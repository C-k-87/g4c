// ignore: file_names
import 'package:flutter/material.dart';

class JobDescription extends StatelessWidget {
  const JobDescription({super.key});

  @override
  Widget build(BuildContext context) {
    const String jobtitle = 'JOB TITLE';
    const String description = 'Description';
    return const Scaffold(
      body: Stack(
        children: [
          Image(
            image: AssetImage('asset_lib/images/imagebg.png'),
            width: 1700,
            fit: BoxFit.cover,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  // ignore: unnecessary_string_interpolations
                  jobtitle,
                  style: TextStyle(color: Colors.black, fontSize: 40),
                ),
              ),
              SizedBox(height: 40),
              Align(
                alignment: Alignment.center,
                child: Text(
                  description,
                  style: TextStyle(color: Colors.white, fontSize: 35),
                ),
              ),
              SizedBox(
                height: 80,
              ),
              Padding(
                padding: EdgeInsets.only(left: 30.0),
                child: Text(
                  "Responsibilities",
                  style: TextStyle(color: Colors.black, fontSize: 35),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Padding(
                padding: EdgeInsets.only(left: 30.0),
                child: Text(
                  "Skills",
                  style: TextStyle(color: Colors.black, fontSize: 35),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: EdgeInsets.only(left: 50.0),
                child: Text(
                  'Technical Skills',
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
              ),
              SizedBox(
                height: 220,
              ),
              Padding(
                padding: EdgeInsets.only(left: 50.0),
                child: Text(
                  'Soft Skills',
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

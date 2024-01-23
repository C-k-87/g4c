import 'package:flutter/material.dart';

class JobDescription extends StatelessWidget {
  const JobDescription({super.key});

    


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          Image(
            image: AssetImage('asset_lib/images/imagebg.png'),
            width: 1700,
            fit: BoxFit.cover,
          ),
          Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  // ignore: unnecessary_string_interpolations
                  'JOB TITLE',
                  style: TextStyle(color: Colors.black, fontSize: 40),
                ),
              ),
              SizedBox(height: 60),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Description',
                  style: TextStyle(color: Colors.white, fontSize: 35),
                ),
              ),
              SizedBox(
                height: 80,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Responsibility",
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.0),
                child: Text(
                  'Technical Skills',
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
              SizedBox(
                height: 120,
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.0),
                child: Text(
                  'Soft Skills',
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

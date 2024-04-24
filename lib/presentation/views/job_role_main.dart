import 'package:flutter/material.dart';
import 'package:g4c/domain/use_cases/data_handler.dart';
import 'package:g4c/presentation/components/g4c_drawer.dart';
import 'package:g4c/presentation/components/job_role_list.dart';
import 'package:g4c/presentation/components/top_card.dart';
import 'package:g4c/presentation/components/txt_search.dart';
import 'package:g4c/presentation/views/loader.dart';

class JobRoleMain extends StatefulWidget {
  const JobRoleMain({super.key});

  @override
  State<JobRoleMain> createState() => _JobRoleMainState();
}

class _JobRoleMainState extends State<JobRoleMain> {
  String _searchParam = "";

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DataHandler().getRolesList(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Loader();
        } else if (snapshot.hasError) {
          print(snapshot.error);
          return const ErrorScreen();
        } else {
          return Scaffold(
            backgroundColor: const Color.fromARGB(255, 253, 254, 253),
            appBar: G4CAppBar('Job Roles', false),
            drawer:
                const G4CDrawer(), // Use 'color' instead of 'backgroundColor
            body: ListView(
              children: [
                const TopCard(
                  content: Image(
                    fit: BoxFit.fill,
                    image: AssetImage('asset_lib/images/JobRolesBackdrop.png'),
                  ),
                  color: Color.fromARGB(255, 195, 255, 195),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      const Text(
                        "FIND YOUR",
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            color: Colors.black,
                            fontSize: 38,
                            fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        "CALLING",
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            color: Colors.black,
                            fontSize: 55,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      TxtSearch(
                        fieldName: 'Search your role',
                        onChanged: (text) {
                          setState(() {
                            _searchParam = text;
                          });
                        },
                      ),
                      const SizedBox(height: 30.0),
                      JobRoleList(searchParam: _searchParam),
                      // ...createRolesList(snapshot.data, _searchParam),
                      const SizedBox(height: 20.0),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}

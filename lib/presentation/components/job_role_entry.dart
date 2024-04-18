import 'package:flutter/material.dart';
import 'package:g4c/domain/use_cases/routing.dart';

class JobRoleEntry extends StatelessWidget {
  const JobRoleEntry({
    super.key,
    required this.role,
  });

  final dynamic role;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navtoJobDescription(context, role);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 20.0,
        ),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                blurRadius: 10.0,
                offset: Offset.zero,
              )
            ]),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Image(
                image:
                    AssetImage('asset_lib/images/roleimages/${role["image"]}'),
              ),
            ),
            Expanded(
              child: Text(
                role["name"],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

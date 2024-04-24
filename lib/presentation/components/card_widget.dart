import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String title;
  final Widget content;
  final Function()? onPressed;

  const CardWidget(
      {super.key,
      required this.content,
      required this.title,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      child: Container(
        width: MediaQuery.of(context).size.width - 100,
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 0), // changes position of shadow
            ),
          ],
          color: Colors.black87,
          borderRadius: const BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0),
                ),
                color: Colors.green[100],
              ),
              width: double.maxFinite,
              clipBehavior: Clip.antiAlias,
              child: content,
            )
          ],
        ),
      ),
    );
  }
}

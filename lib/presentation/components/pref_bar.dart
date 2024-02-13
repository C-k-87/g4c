import 'package:flutter/material.dart';
import 'package:g4c/data/entities/pref_record.dart';
import 'package:g4c/domain/repositories/enumerations.dart';

class PrefBar extends StatefulWidget {
  final PrefRecord prefList;
  final int index;
  final String question;
  const PrefBar(
      {super.key,
      required this.prefList,
      required this.index,
      required this.question});

  @override
  State<PrefBar> createState() => _PrefBarState();
}

class _PrefBarState extends State<PrefBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            widget.question,
            style: const TextStyle(
              fontWeight: FontWeight.w300,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'DISAGREE',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14.0,
              ),
            ),
            Radio(
              value: Preference.disagree,
              groupValue: widget.prefList.getRec(widget.index),
              onChanged: (Preference? value) {
                setState(() {
                  widget.prefList.updateRec(widget.index, value!);
                });
              },
            ),
            Radio(
              value: Preference.avoid,
              groupValue: widget.prefList.getRec(widget.index),
              onChanged: (Preference? value) {
                setState(() {
                  widget.prefList.updateRec(widget.index, value!);
                });
              },
            ),
            Radio(
              value: Preference.neutral,
              groupValue: widget.prefList.getRec(widget.index),
              onChanged: (Preference? value) {
                setState(() {
                  widget.prefList.updateRec(widget.index, value!);
                });
              },
            ),
            Radio(
              value: Preference.tolerate,
              groupValue: widget.prefList.getRec(widget.index),
              onChanged: (Preference? value) {
                setState(() {
                  widget.prefList.updateRec(widget.index, value!);
                });
              },
            ),
            Radio(
              value: Preference.agree,
              groupValue: widget.prefList.getRec(widget.index),
              onChanged: (Preference? value) {
                setState(() {
                  widget.prefList.updateRec(widget.index, value!);
                });
              },
            ),
            const Text(
              'AGREE',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14.0,
              ),
            ),
          ],
        ),
        // Text(widget.question),
        // Row(
        //   children: [
        //     Radio(
        //         value: Preference.agree,
        //         groupValue: widget.prefList.getRec(widget.index),
        //         onChanged: (value) {
        //           setState(() {
        //             widget.prefList.updateRec(widget.index, value!);
        //           });
        //         }),
        //     Radio(
        //         value: Preference.disagree,
        //         groupValue: widget.prefList.getRec(widget.index),
        //         onChanged: (value) {
        //           setState(() {
        //             widget.prefList.updateRec(widget.index, value!);
        //           });
        //         }),
        //   ],
        // ),
      ],
    );
  }
}

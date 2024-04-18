import 'package:flutter/material.dart';

enum Preference { disagree, avoid, neutral, tolerate, agree }

class QuizPrefBar extends StatefulWidget {
  final String question;
  const QuizPrefBar({
    super.key,
    required this.question,
  });

  @override
  State<QuizPrefBar> createState() => _QuizPrefBarState();
}

class _QuizPrefBarState extends State<QuizPrefBar> {
  Preference? _preference = Preference.neutral;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      margin: const EdgeInsets.symmetric(
        //horizontal: 13.0,
        vertical: 5.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(10.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(100),
            blurRadius: 7.0,
            offset: const Offset(1.0, 1.0),
          ),
        ],
      ),
      child: Column(
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
                groupValue: _preference,
                onChanged: (Preference? value) {
                  setState(() {
                    _preference = value;
                  });
                },
              ),
              Radio(
                value: Preference.avoid,
                groupValue: _preference,
                onChanged: (Preference? value) {
                  setState(() {
                    _preference = value;
                  });
                },
              ),
              Radio(
                value: Preference.neutral,
                groupValue: _preference,
                onChanged: (Preference? value) {
                  setState(() {
                    _preference = value;
                  });
                },
              ),
              Radio(
                value: Preference.tolerate,
                groupValue: _preference,
                onChanged: (Preference? value) {
                  setState(() {
                    _preference = value;
                  });
                },
              ),
              Radio(
                value: Preference.agree,
                groupValue: _preference,
                onChanged: (Preference? value) {
                  setState(() {
                    _preference = value;
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
          )
        ],
      ),
    );
  }
}

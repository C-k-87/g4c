import 'package:flutter/material.dart';

class BtnSignInGoogle extends StatelessWidget {
  const BtnSignInGoogle({
    super.key,
    required this.onPressed,
  });
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
          side: const BorderSide(
            width: 2.0,
            color: Colors.black87,
          )),
      child: const SizedBox(
          width: 160,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: Image(
                  image: AssetImage('asset_lib/images/glogo.png'),
                  width: 20.0,
                ),
              ),
              Text('Sign in with Google'),
            ],
          )),
    );
  }
}

class BtnNavigation extends StatelessWidget {
  const BtnNavigation({
    super.key,
    required this.btnText,
    required this.onPressed,
    required this.iconData,
  });

  final String btnText;
  final Function()? onPressed;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0)),
            side: const BorderSide(
              width: 2.0,
              color: Colors.black87,
            )),
        child: SizedBox(
            width: 160,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5.0,
                    ),
                    child: Icon(iconData)),
                Text(btnText),
              ],
            )),
      ),
    );
  }
}

class BtnBlack extends StatelessWidget {
  final Function()? onpressed;
  final String btnText;

  const BtnBlack({
    super.key,
    required this.onpressed,
    required this.btnText,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 20.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
      ),
      child: Text(btnText),
    );
  }
}

class BtnBlackIcon extends StatelessWidget {
  final Function()? onpressed;
  final String btnText;
  final IconData iconData;

  const BtnBlackIcon({
    super.key,
    required this.onpressed,
    required this.btnText,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 12.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
      ),
      child: SizedBox(
        width: 100.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(btnText),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Icon(iconData),
            ),
          ],
        ),
      ),
    );
  }
}

class BtnWhite extends StatelessWidget {
  final Function()? onpressed;
  final String btnText;

  const BtnWhite({
    super.key,
    required this.onpressed,
    required this.btnText,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          padding: const EdgeInsets.symmetric(
            horizontal: 80.0,
            vertical: 20.0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
          ),
          side: const BorderSide(
            color: Colors.black,
            width: 2.0,
          )),
      child: Text(btnText),
    );
  }
}

class TxtInput extends StatelessWidget {
  final String fieldName;
  final TextEditingController controller;

  const TxtInput({
    super.key,
    required this.fieldName,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: fieldName,
        border: const UnderlineInputBorder(),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 50.0,
        ),
      ),
    );
  }
}

class PwdInput extends StatelessWidget {
  final String fieldName;
  final bool isPasswordVisible;
  final TextEditingController controller;
  final Function()? onpressed;

  const PwdInput({
    super.key,
    required this.fieldName,
    required this.isPasswordVisible,
    this.onpressed,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: !isPasswordVisible,
      controller: controller,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 50.0,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            color: Colors.black,
          ),
          onPressed: onpressed,
        ),
        hintText: fieldName,
      ),
    );
  }
}

class TxtSearch extends StatelessWidget {
  final String fieldName;
  final Function(String)? onChanged;

  const TxtSearch({
    super.key,
    required this.fieldName,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        hintText: fieldName,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        constraints: const BoxConstraints(
          maxWidth: 400.0,
        ),
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  final String title;
  final Widget content;
  final double fontsize;

  const CardWidget(
      {super.key,
      required this.content,
      required this.title,
      required this.fontsize});

  @override
  Widget build(BuildContext context) {
    return Container(
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
        border: null,
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
              style: TextStyle(
                color: Colors.white,
                fontSize: fontsize,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(10.0),
                bottomLeft: Radius.circular(10.0),
              ),
              color: Colors.green[100],
            ),
            width: double.maxFinite,
            child: content,
          )
        ],
      ),
    );
  }
}

class TopCard extends StatelessWidget {
  final Widget content;
  final Color color;
  const TopCard({
    super.key,
    required this.content,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      height: MediaQuery.of(context).size.height / 3.7,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: color,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 0),
          )
        ],
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(50.0),
          bottomRight: Radius.circular(50.0),
        ),
      ),
      child: content,
    );
  }
}

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
              const SizedBox(
                width: 10.0,
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
              const SizedBox(
                width: 10.0,
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
        //TODO : Implement navigation to Job Role Description page
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

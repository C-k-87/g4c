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

  const TxtInput({
    super.key,
    required this.fieldName,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        decoration: InputDecoration(
          hintText: fieldName,
          border: const UnderlineInputBorder(),
          constraints: const BoxConstraints(
            maxWidth: 400.0,
          ),
        ),
      ),
    );
  }
}

class PwdInput extends StatelessWidget {
  final String fieldName;
  final bool isPasswordVisible;
  final Function()? onpressed;

  const PwdInput({
    super.key,
    required this.fieldName, required this.isPasswordVisible, this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
                obscureText: !isPasswordVisible,
                decoration: InputDecoration(
                  border: const UnderlineInputBorder(),
                  constraints: const BoxConstraints(
                    maxWidth: 400.0,
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
              ),
    );
  }
}

class TxtSearch extends StatelessWidget {
  final String fieldName;

  const TxtSearch({
    super.key,
    required this.fieldName,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
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

  const CardWidget({super.key, required this.content, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0,
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
              style: const TextStyle(
                color: Colors.white,
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

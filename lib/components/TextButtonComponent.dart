import 'package:flutter/material.dart';

class TextButtonComponent extends StatelessWidget {
  final String buttonText;
  final VoidCallback navigatePage;
  TextButtonComponent({
    super.key,
    required this.buttonText,
    required this.navigatePage,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(
              EdgeInsets.symmetric(vertical: 20, horizontal: 30)),
          backgroundColor:
              MaterialStateProperty.all(Color.fromARGB(255, 226, 226, 226)),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
          overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered))
                return Color.fromARGB(255, 192, 192, 192).withOpacity(0.04);
              if (states.contains(MaterialState.focused) ||
                  states.contains(MaterialState.pressed))
                return Color.fromARGB(255, 173, 173, 173).withOpacity(0.12);
              return null; // Defer to the widget's default.
            },
          ),
        ),
        onPressed: navigatePage,
        // () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => navigatePage),
          // );
          
        // },
        child: Text(buttonText));
  }
}

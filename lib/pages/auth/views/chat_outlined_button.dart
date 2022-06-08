import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatOutlinedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;

  const ChatOutlinedButton({
    Key? key,
    required this.onPressed,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 15),
          child: Text(
            "Terms and conditions",
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';

class ArrowButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;

  const ArrowButton({
    Key? key,
    required this.onPressed,
    required this.title,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(CupertinoIcons.right_chevron,
              color: CupertinoColors.white.withOpacity(0.7)),
          Text(
            title,
            style: TextStyle(
              color: CupertinoColors.white.withOpacity(0.7),
              fontSize: 25,
            ),
          )
        ],
      ),
    );
  }
}

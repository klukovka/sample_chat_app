import 'package:flutter/material.dart';
import 'package:sample_chat_app/resources/app_image_assets.dart';

class Logo extends StatelessWidget {
  final double width;
  final double height;
  final double radius;

  const Logo({
    Key? key,
    required this.width,
    required this.height,
    required this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          shape: BoxShape.rectangle,
          color: Colors.white.withOpacity(0.8)),
      child: const Padding(
        padding: EdgeInsets.all(2.0),
        child: Image(
          image: AssetImage(AppImageAssets.iconImage),
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}

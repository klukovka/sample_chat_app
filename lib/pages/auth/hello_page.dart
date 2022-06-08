import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sample_chat_app/pages/auth/views/arrow_button.dart';
import 'package:sample_chat_app/resources/app_image_assets.dart';
import 'package:sample_chat_app/router/chat_app_router.dart';
import 'package:sample_chat_app/utils/extensions/build_context_ext.dart';

import 'views/chat_outlined_button.dart';
import 'views/logo.dart';

class HelloPage extends StatelessWidget {
  const HelloPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImageAssets.backgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            color: Theme.of(context).backgroundColor.withOpacity(0),
            child: _buildContent(context),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Logo(
          height: 150.0,
          width: 150.0,
          radius: 50.0,
        ),
        Text(
          context.strings.hello,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white.withOpacity(0.7),
            fontSize: 60,
          ),
        ),
        Text(
          context.strings.helloDescription,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white.withOpacity(0.7),
            fontSize: 20,
          ),
        ),
        ChatOutlinedButton(
          onPressed: () {},
          title: context.strings.termsAndConditions,
        ),
        ArrowButton(
          onPressed: router.pushEditPhoneNumberPage,
          title: context.strings.letsStart,
        )
      ],
    );
  }
}

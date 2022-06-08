import 'package:flutter/material.dart';
import 'package:sample_chat_app/sample_chat_app.dart';

import 'config/di.dart';

Future<void> main() async {
  await configureDependencies();
  runApp(const SampleChatApp());
}

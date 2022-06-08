import 'package:flutter/material.dart';

import '../../l10n/sample_chat_localizations.dart';

extension BuildContextExt on BuildContext {
  SampleChatLocalizations get strings => SampleChatLocalizations.of(this);
}

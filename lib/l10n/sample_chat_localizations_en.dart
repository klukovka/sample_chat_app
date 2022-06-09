


import 'sample_chat_localizations.dart';

/// The translations for English (`en`).
class SampleChatLocalizationsEn extends SampleChatLocalizations {
  SampleChatLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Firebase Chat';

  @override
  String get chats => 'Chats';

  @override
  String get calls => 'Calls';

  @override
  String get people => 'People';

  @override
  String get settings => 'Settings';

  @override
  String get signUpWithGoogle => 'Sign up with Google';
}

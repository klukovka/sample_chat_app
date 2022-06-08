import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample_chat_app/resources/app_image_assets.dart';
import 'package:sample_chat_app/router/chat_app_router.dart';
import 'package:sample_chat_app/utils/extensions/build_context_ext.dart';

class EditPhoneNumberPage extends StatefulWidget {
  const EditPhoneNumberPage({Key? key}) : super(key: key);

  @override
  State<EditPhoneNumberPage> createState() => _EditPhoneNumberPageState();
}

class _EditPhoneNumberPageState extends State<EditPhoneNumberPage> {
  late final TextEditingController _enterPhoneNumber;
  Map<String, dynamic> data = {"name": "Portugal", "code": "+351"};

  @override
  void initState() {
    super.initState();
    _enterPhoneNumber = TextEditingController();
  }

  @override
  void dispose() {
    _enterPhoneNumber.dispose();
    super.dispose();
  }

  void _updateData(Map<String, dynamic> value) {
    setState(() {
      data = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text(context.strings.editNumber),
        previousPageTitle: context.strings.back,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Image.asset(
                AppImageAssets.iconImage,
                width: 80.0,
                height: 80.0,
              ),
              Text(
                context.strings.verification,
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
          Text(
            context.strings.enterPhoneNumber,
            style: Theme.of(context).textTheme.headline5,
          ),
          ListTile(
            onTap: () {
              router.pushSelectCountryPage(_updateData);
            },
            title: Text(data['name']),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Text(
                  data['code'],
                  style: const TextStyle(
                    fontSize: 25,
                    color: CupertinoColors.secondaryLabel,
                  ),
                ),
                Expanded(
                  child: CupertinoTextField(
                    placeholder: context.strings.enterPhoneNumber,
                    controller: _enterPhoneNumber,
                    keyboardType: TextInputType.number,
                  ),
                )
              ],
            ),
          ),
          Text(
            context.strings.activationCode,
            style: const TextStyle(
              color: CupertinoColors.systemGrey,
              fontSize: 15,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: CupertinoButton.filled(
              child: Text(context.strings.requestCode),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}

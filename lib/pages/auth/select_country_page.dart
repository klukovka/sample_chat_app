import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sample_chat_app/router/chat_app_router.dart';

class SelectCountryPage extends StatefulWidget {
  final ValueSetter<Map<String, dynamic>> onSelected;

  const SelectCountryPage({
    Key? key,
    required this.onSelected,
  }) : super(key: key);

  @override
  State<SelectCountryPage> createState() => _SelectCountryPageState();
}

class _SelectCountryPageState extends State<SelectCountryPage> {
  late final TextEditingController _searchController;
  List<dynamic>? dataRetrieved; // data decoded from the json file
  List<dynamic>? data; // data to display on the screen
  var searchValue = "";

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _getData();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future _getData() async {
    final String response =
        await rootBundle.loadString('assets/country_codes.json');
    dataRetrieved = await json.decode(response) as List<dynamic>;
    setState(() {
      data = dataRetrieved;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            largeTitle: Text("Select Country"),
            previousPageTitle: "Edit Number",
          ),
          SliverToBoxAdapter(
            child: CupertinoSearchTextField(
              onChanged: (value) {
                setState(() {
                  searchValue = value;
                });
              },
              controller: _searchController,
            ),
          ),
          _buildCodes()
        ],
      ),
    );
  }

  Widget _buildCodes() {
    return SliverList(
      delegate: SliverChildListDelegate((data != null)
          ? data!
              .where((e) => e['name']
                  .toString()
                  .toLowerCase()
                  .contains(searchValue.toLowerCase()))
              .map((e) => ListTile(
                    onTap: () {
                      widget.onSelected(
                          {"name": e['name'], "code": e['dial_code']});
                      router.pop();
                    },
                    title: Text(e['name']),
                    trailing: Text(e['dial_code']),
                  ))
              .toList()
          : [Center(child: Text("Loading"))]),
    );
  }
}

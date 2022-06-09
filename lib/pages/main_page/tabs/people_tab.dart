import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_chat_app/config/locator.dart';
import 'package:sample_chat_app/pages/main_page/views/user_tile.dart';

import '../../../bloc/main_page/people_tab/people_tab_cubit.dart';

class PeopleTab extends StatefulWidget implements AutoRouteWrapper {
  const PeopleTab({Key? key}) : super(key: key);

  @override
  State<PeopleTab> createState() => _PeopleTabState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<PeopleTabCubit>(),
      child: this,
    );
  }
}

class _PeopleTabState extends State<PeopleTab> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PeopleTabCubit, PeopleTabState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return ListView.separated(
          itemBuilder: (_, index) => UserTile(user: state.users[index]),
          separatorBuilder: (_, __) => const Divider(),
          itemCount: state.users.length,
        );
      },
    );
  }
}

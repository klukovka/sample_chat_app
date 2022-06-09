import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_chat_app/config/locator.dart';
import 'package:sample_chat_app/utils/extensions/build_context_ext.dart';

import '../../bloc/login_page/login_page_cubit.dart';

class LoginPage extends StatefulWidget implements AutoRouteWrapper {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();

  @override
  Widget wrappedRoute(Object context) {
    return BlocProvider(
      create: (_) => locator<LoginPageCubit>(),
      child: this,
    );
  }
}

class _LoginPageState extends State<LoginPage> {
  LoginPageCubit get cubit => context.read();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoginPageCubit, LoginPageState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: cubit.loginWithGoogle,
                child: Text(
                  context.strings.signUpWithGoogle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

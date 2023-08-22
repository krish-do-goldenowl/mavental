import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mavental/src/features/authentication/logic/sign_in_bloc.dart';
import 'package:mavental/src/features/authentication/view/sign_in_view.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignInBloc(),
      child: const SignInView(),
    );
  }
}

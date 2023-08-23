import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:mavental/src/features/authentication/logic/sign_up_bloc.dart';
import 'package:mavental/src/features/authentication/widget/sign_title.dart';
import 'package:mavental/src/localization/localization_utils.dart';
import 'package:mavental/widgets/button/button.dart';
import 'package:mavental/widgets/forms/input.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignUpBloc(),
      child: BlocBuilder<SignUpBloc, SignUpState>(
        builder: (context, SignUpState state) {
          return Scaffold(
            body: Container(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 20),
              child: SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: _builder(context, state),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _builder(BuildContext context, SignUpState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SignTitle('Sigup'),
        const SizedBox(height: 24.0),
        XInput(
          key: const Key('loginForm_NameInput_textField'),
          value: state.name.value,
          onChanged: context.read<SignUpBloc>().onNameChanged,
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
            labelText: 'Username',
            hintText: 'Username',
            errorText: state.name.errorOf(context),
          ),
        ),
        const SizedBox(height: 8.0),
        XInput(
          key: const Key('loginForm_emailInput_textField'),
          value: state.email.value,
          onChanged: context.read<SignUpBloc>().onEmailChanged,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'Email',
            hintText: 'Email',
            errorText: state.email.errorOf(context),
          ),
        ),
        const SizedBox(height: 8.0),
        XInput(
          value: state.password.value,
          key: const Key('loginForm_passwordInput_textField'),
          onChanged: context.read<SignUpBloc>().onPasswordChanged,
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'Password',
            errorText: state.password.errorOf(context),
          ),
        ),
        const SizedBox(height: 32.0),
        XButton(
          busy: state.status.isInProgress,
          // enabled: state.isValidated,
          title: S.of(context).common_next,
          onPressed: () => context.read<SignUpBloc>().signUpWithEmail(context),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }
}

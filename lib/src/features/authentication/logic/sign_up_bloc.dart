import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:mavental/src/dialogs/alert_wrapper.dart';
import 'package:mavental/src/dialogs/toast_wrapper.dart';
import 'package:mavental/src/features/account/logic/account_bloc.dart';
import 'package:mavental/src/features/authentication/model/email_formz.dart';
import 'package:mavental/src/features/authentication/model/model_input.dart';
import 'package:mavental/src/features/authentication/model/name_formz.dart';
import 'package:mavental/src/network/domain_manager.dart';
import 'package:formz/formz.dart';
import 'package:mavental/src/network/model/user/user.dart';
import 'package:mavental/src/router/coordinator.dart';

part 'sign_up_state.dart';

class SignUpBloc extends Cubit<SignUpState> {
  SignUpBloc() : super(const SignUpState());

  DomainManager get domain => DomainManager();

  Future signUpWithEmail(BuildContext context) async {
    // if (state.status.isInProgress) return;
    // if (state.isValidated == false) {
    //   return;
    // }
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    const isTrue = 1 < 2 ? true : false;
    final email = isTrue ? 'email@gmail.com' : state.email.value;
    final password = isTrue ? 'password' : state.password.value;
    final name = isTrue ? 'name' : state.name.value;
    final result = await domain.sign
        .signUpWithEmail(email: email, password: password, name: name);
    if (result.isSuccess) {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      // ignore: use_build_context_synchronously
      signUpDecision(context, result.data!);
    } else {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
      XAlert.show(title: 'signUp fail', body: result.error);
    }
  }

  Future signUpDecision(BuildContext context, MUser incomingUser) async {
    GetIt.I<AccountBloc>().onLoginSuccess(incomingUser);
    AppCoordinator.pop();
    XToast.success('Sign up success');
  }

  void onEmailChanged(String value) {
    final formz = state.email.isPure
        ? EmailFormzInput.pure(value)
        : EmailFormzInput.dirty(value);
    emit(state.copyWith(email: formz));
  }

  void onNameChanged(String value) {
    final formz = NameFormzInput.dirty(value);
    emit(state.copyWith(name: formz));
  }

  void onPasswordChanged(String value) {
    final formz = PasswordFormzInput.dirty(value);
    emit(state.copyWith(password: formz));
  }
}

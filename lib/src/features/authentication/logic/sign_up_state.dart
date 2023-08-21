part of 'sign_up_bloc.dart';

class SignUpState extends Equatable {
  const SignUpState({
    this.email = const EmailFormzInput.pure(),
    this.password = const PasswordFormzInput.pure(),
    this.name = const NameFormzInput.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.message = '',
  });

  final EmailFormzInput email;
  final PasswordFormzInput password;
  final NameFormzInput name;
  final FormzSubmissionStatus status;
  final String message;

  bool get isValidated {
    return Formz.validate([email, password]);
  }

  @override
  List<Object> get props => [
        email,
        password,
        status,
        name,
      ];

  SignUpState copyWith({
    EmailFormzInput? email,
    PasswordFormzInput? password,
    FormzSubmissionStatus? status,
    NameFormzInput? name,
    String? message,
  }) {
    return SignUpState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      name: name ?? this.name,
      message: message ?? this.message,
    );
  }
}

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void emit(LoginState state) {
    if (!isClosed) super.emit(state);
  }
}

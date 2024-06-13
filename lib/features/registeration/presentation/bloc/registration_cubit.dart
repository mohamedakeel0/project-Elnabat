import 'package:bloc/bloc.dart';
import 'package:final_project/main.dart';
import 'package:flutter/material.dart';

import '../../../../config/routes/routes.dart';

part 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit() : super(RegistrationInitial());

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController parPhoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passWordController = TextEditingController();
  final TextEditingController noteController = TextEditingController();

  confirmForm() {
    if (formKey.currentState!.validate()) {
      FocusManager.instance.primaryFocus?.unfocus();
      Navigator.pushNamed(
        navigatorKey.currentState!.context,
        AppRoutes.login,
      );
    } else {
      return;
    }
  }

  @override
  void emit(RegistrationState state) {
    if (!isClosed) super.emit(state);
  }
}

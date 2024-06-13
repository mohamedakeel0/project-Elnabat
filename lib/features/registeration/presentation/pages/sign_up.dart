import 'package:final_project/config/routes/routes.dart';
import 'package:final_project/features/registeration/presentation/bloc/registration_cubit.dart';
import 'package:final_project/features/registeration/presentation/widgets/field_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<RegistrationCubit>();
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Padding(
          padding: const EdgeInsets.all(6.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Center(
                  child: Text(
                    'SignUp',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Form(
                  key: cubit.formKey,
                  child: Column(
                    children: [
                      TextFieldItem(
                        txt: 'First Name',
                        controller: cubit.nameController,
                        obscureText: false,
                        textInputType: TextInputType.text,
                        warningMessage: 'Please Enter First Name',
                        sufIcon: null,
                        postIcon: null,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      TextFieldItem(
                        txt: 'Last Name',
                        controller: cubit.lastNameController,
                        obscureText: false,
                        textInputType: TextInputType.text,
                        warningMessage: 'Please Enter Last Name',
                        sufIcon: null,
                        postIcon: null,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      TextFieldItem(
                        txt: 'Phone Number',
                        controller: cubit.phoneController,
                        obscureText: false,
                        textInputType: TextInputType.phone,
                        warningMessage: 'Please Enter Phone Number',
                        postIcon: null,
                        sufIcon: null,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      TextFieldItem(
                        txt: 'Nationality',
                        controller: cubit.parPhoneController,
                        obscureText: false,
                        textInputType: TextInputType.phone,
                        warningMessage: 'Please Enter Your Nationality',
                        postIcon: null,
                        sufIcon: null,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      TextFieldItem(
                        txt: 'Email',
                        controller: cubit.emailController,
                        obscureText: false,
                        textInputType: TextInputType.emailAddress,
                        warningMessage: 'Please Enter Your Email',
                        postIcon: null,
                        sufIcon: null,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      TextFieldItem(
                        txt: 'Password',
                        controller: cubit.passWordController,
                        obscureText: true,
                        textInputType: TextInputType.text,
                        warningMessage: 'Please Enter Your Password',
                        postIcon: null,
                        sufIcon: null,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      TextFieldItem(
                        txt: 'Address',
                        warningMessage: 'Please Enter Your Address',
                        controller: cubit.noteController,
                        obscureText: false,
                        textInputType: TextInputType.text,
                        required: false,
                        postIcon: null,
                        sufIcon: null,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green.shade300,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          onPressed: () {
                            cubit.confirmForm();
                          },
                          child: const Text(
                            'Done',
                            style: TextStyle(
                              fontSize: 25.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('You Already have an account'),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.login);
                        },
                        child: const Text(
                          ' Login Now',
                          style: TextStyle(color: Color(0xff087884)),
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

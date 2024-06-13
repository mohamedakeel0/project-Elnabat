import 'package:final_project/features/settings/presentation/widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/settings_cubit.dart';

class UpdatePassword extends StatefulWidget {
  @override
  State<UpdatePassword> createState() => _UpdatePasswordState();
}

class _UpdatePasswordState extends State<UpdatePassword> {
  TextStyle style = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  late TextEditingController oldPass;
  late TextEditingController newPass;
  late TextEditingController confirmPass;

  bool readOnly = false;
  late SettingsCubit bloc;

  void initState() {
    bloc = BlocProvider.of<SettingsCubit>(context);
    oldPass = TextEditingController(text: bloc.OldGet.text);
    newPass = TextEditingController(text: bloc.NewGet.text);
    confirmPass = TextEditingController(text: bloc.ConfirmGet.text);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<SettingsCubit>(context);
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return Container(
          height: MediaQuery.of(context).size.height * .45,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Update Password..",
                    style: style.copyWith(fontSize: 25),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Old Password", style: style),
                  MyTextField(
                    txt: oldPass,
                    r: readOnly,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("New Password", style: style),
                  MyTextField(
                    txt: newPass,
                    r: readOnly,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Confirm Password", style: style),
                  MyTextField(
                    txt: confirmPass,
                    r: readOnly,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            readOnly = true;
                            bloc.Old(oldPass);
                            bloc.Neww(newPass);
                            bloc.Confirm(confirmPass);
                            Navigator.of(context).pop();
                          },
                          child: Text("Update", style: style)),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("Discard", style: style)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

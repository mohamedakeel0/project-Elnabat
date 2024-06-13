import 'package:final_project/features/settings/presentation/widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/settings_cubit.dart';

class AccountBottomSheet extends StatefulWidget {
  @override
  State<AccountBottomSheet> createState() => _AccountBottomSheetState();
}

class _AccountBottomSheetState extends State<AccountBottomSheet> {
  TextStyle style = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  late TextEditingController Fname;
  late TextEditingController Lname;
  late TextEditingController Uname;
  late TextEditingController Email;
  bool readOnly = false;
  late SettingsCubit bloc;

  void initState() {
    bloc = BlocProvider.of<SettingsCubit>(context);
    Fname = TextEditingController(text: bloc.fNameGet.text);
    Lname = TextEditingController(text: bloc.lNameGet.text);
    Uname = TextEditingController(text: bloc.uNameGet.text);
    Email = TextEditingController(text: bloc.eMailGet.text);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<SettingsCubit>(context);
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return Container(
          height: MediaQuery.of(context).size.height * .57,
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
                    "Update Account Information",
                    style: style.copyWith(fontSize: 25),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("First Name", style: style),
                  MyTextField(
                    txt: Fname,
                    r: readOnly,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Last Name", style: style),
                  MyTextField(
                    txt: Lname,
                    r: readOnly,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("User Name", style: style),
                  MyTextField(
                    txt: Uname,
                    r: readOnly,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Email", style: style),
                  MyTextField(
                    txt: Email,
                    r: readOnly,
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
                            bloc.fName(Fname);
                            bloc.lName(Lname);
                            bloc.uName(Uname);
                            bloc.eMail(Email);
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

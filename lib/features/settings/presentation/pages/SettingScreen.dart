import 'package:final_project/config/routes/routes.dart';
import 'package:final_project/features/settings/presentation/widgets/bottom_sheets/personal_bottom_sheet.dart';
import 'package:final_project/features/settings/presentation/widgets/bottom_sheets/update_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/styles/colors.dart';
import '../bloc/settings_cubit.dart';
import '../widgets/alert_dialogs/loading_alert_dialog.dart';
import '../widgets/bottom_sheets/account_bottom_sheet.dart';
import '../widgets/bottom_sheets/contact_bottom_sheet.dart';
import '../widgets/bottom_sheets/edit_bottom_sheet.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  late SettingsCubit bloc;
  TextStyle txtStyle = TextStyle(
      fontWeight: FontWeight.bold, fontSize: 20, color: MyColors.mainColor);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        bloc = BlocProvider.of<SettingsCubit>(context);
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(children: [
            Image.asset(
              "assets/images/12.jpg",
              fit: BoxFit.fill,
              height: double.infinity,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                        color: Colors.white70),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        CircleAvatar(
                          radius: 100,
                          backgroundImage: bloc.pickedImage == null
                              ? Image.asset('assets/images/download.png').image
                              : Image.file(bloc.pickedImage!).image,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        InkWell(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) => DispalyBottomSheet());
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 30, right: 30, bottom: 10),
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.edit),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Edit Photo",
                                    style: txtStyle.copyWith(
                                        fontSize: 25,
                                        color: MyColors.mainColor),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Edit Account",
                      textAlign: TextAlign.start,
                      style: txtStyle.copyWith(
                        fontSize: 30,
                        color: Colors.white,
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      displayPersonalBottomSheet();
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.info_outline,
                          size: 30,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Personal Information", style: txtStyle),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      displayAccountBottomSheet();
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.person,
                          size: 30,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Account information", style: txtStyle),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      displayContactBottomSheet();
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 30,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Contact information", style: txtStyle),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      updatePassword();
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.lock,
                          size: 30,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Update Password", style: txtStyle),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.login);
                      dialog();
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.exit_to_app,
                          size: 30,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Sign Out", style: txtStyle),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  // Text(
                  //   "Theme",
                  //   style: txtStyle.copyWith(fontSize: 30),
                  // ),
                  // Row(
                  //   children: [
                  //     Text("Dark Mode", style: txtStyle),
                  //     Spacer(),
                  //     Switch(
                  //       value: bloc.darkSwitch,
                  //       activeColor: Colors.green,
                  //       onChanged: (newValue) {
                  //         bloc.darkSwitch = newValue;
                  //         if (bloc.darkSwitch) {
                  //           bloc.setCurrentMode(ThemeMode.dark);
                  //         } else {
                  //           bloc.setCurrentMode(ThemeMode.light);
                  //         }
                  //       },
                  //     ),
                  //   ],
                  // )
                ],
              ),
            ),
          ]),
        );
      },
    );
  }

  void displayPersonalBottomSheet() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) => Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: PersonalBottomSheet(),
            ));
  }

  void displayAccountBottomSheet() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) => Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: AccountBottomSheet(),
            ));
  }

  void displayContactBottomSheet() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) => Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: ContactBottomSheet(),
            ));
  }

  void updatePassword() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) => Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: UpdatePassword(),
            ));
  }

  void dialog() {
    showDialog(
        // barrierDismissible: false,
        context: context,
        builder: (context) => LoadingAlertDialog());
    Navigator.pop(context);
    //Navigator.of(context).pushReplacementNamed(routeName);
  }
}

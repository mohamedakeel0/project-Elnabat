import 'dart:io';

import 'package:final_project/features/settings/presentation/bloc/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DispalyBottomSheet extends StatefulWidget {
  @override
  State<DispalyBottomSheet> createState() => _DispalyBottomSheetState();
}

class _DispalyBottomSheetState extends State<DispalyBottomSheet> {
  // XFile? image;
  late SettingsCubit bloc;
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        bloc = BlocProvider.of<SettingsCubit>(context);
        return Container(
          height: MediaQuery.of(context).size.height * .15,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                InkWell(
                  onTap: () async => await bloc.getImageFromCamera(),
                  child: Row(
                    children: [
                      Icon(Icons.camera_alt),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Take a photo",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () async {
                    File? temp = await bloc.getImageFromGallery();
                    if (temp != null) bloc.pickedImage = temp;
                  },
                  child: Row(
                    children: [
                      Icon(Icons.image),
                      SizedBox(
                        width: 10,
                      ),
                      Text("From Gallery",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  // Future getImageFromCamera() async {
  //   image = await ImagePicker().pickImage(source: ImageSource.camera);
  //
  //   if (image == null) return;
  //   final temp = XFile(image!.path);
  //   setState(() {
  //     image = temp;
  //   });
  // }

  // Future getImageFromGallery() async {
  //   image = await ImagePicker().pickImage(source: ImageSource.gallery);
  //
  //   if (image == null) return;
  //   final temp = XFile(image!.path);
  //   setState(() {
  //     image = temp;
  //   });
  // }
}

import 'dart:io';

import 'package:final_project/config/routes/routes.dart';
import 'package:final_project/core/di/di_manager.dart';
import 'package:final_project/features/Community/presentation/pages/community_tab.dart';
import 'package:final_project/features/control/presentation/manager/control_cubit.dart';
import 'package:final_project/features/control/presentation/pages/control_screen.dart';
import 'package:final_project/features/home/presentation/pages/home_screen.dart';
import 'package:final_project/features/home/presentation/widgets/model.dart';
import 'package:final_project/features/settings/presentation/pages/SettingScreen.dart';
import 'package:final_project/layout/presentation/logic/home_layout_cubit.dart';
import 'package:final_project/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {


  int index = 0;
  List<Widget> tabs = [
    const HomeTap(),
    const CommunityTab(),
    BlocProvider(
      create: (context) => serviceLocator<ControlCubit>(),
      child: const ControlScreen(),
    ),
    const SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return
     BlocBuilder<HomeLayoutCubit, HomeLayoutState>(
          builder: (context, selectedCountryState) {
            var cubit = HomeLayoutCubit.get(context);
          return Stack(
            children: [
              Image.asset(
                "assets/images/12.jpg",
                width: double.infinity,
                fit: BoxFit.fitHeight,
              ),
              Scaffold(
                backgroundColor: Colors.transparent,
                extendBody: true,
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerDocked,
                floatingActionButton: FloatingActionButton(
                  onPressed: () async {
                 cubit.getImage(context);


                  },
                  backgroundColor: Colors.teal,
                  shape: const CircleBorder(
                      side: BorderSide(color: Colors.white, width: 1.0)),
                  child: const Icon(
                    Icons.document_scanner_outlined,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                bottomNavigationBar: BottomAppBar(
                  elevation: 0,
                  color: Colors.white,
                  notchMargin: 8.0,
                  shape: const CircularNotchedRectangle(),
                  child: SingleChildScrollView(
                    child: BottomNavigationBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      type: BottomNavigationBarType.fixed,
                      currentIndex: index,
                      onTap: (idx) {
                        index = idx;
                        setState(() {});
                      },
                      items: [
                        BottomNavigationBarItem(
                          icon: Icon(
                            Icons.home,
                            color: index == 0
                                ? MyColors.tapBarIconColor
                                : MyColors.grayColor,
                          ),
                          backgroundColor: Colors.transparent,
                          label: "Home",
                        ),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.chat,
                                color: index == 1
                                    ? MyColors.tapBarIconColor
                                    : MyColors.grayColor),
                            backgroundColor: Colors.transparent,
                            label: "Community"),
                        BottomNavigationBarItem(
                            icon: ImageIcon(AssetImage("assets/images/plant.png"),
                                color: index == 2
                                    ? MyColors.tapBarIconColor
                                    : MyColors.grayColor),
                            label: "Control"),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.person,
                                color: index == 3
                                    ? MyColors.tapBarIconColor
                                    : MyColors.grayColor),
                            label: "Profile"),
                      ],
                    ),
                  ),
                ),
                body: tabs[index],
              ),
            ],
          );
        }
      );
  }
}

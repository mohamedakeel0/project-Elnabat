// import 'package:final_project/firebase_options.dart';
import 'package:final_project/config/routes/routes.dart';
import 'package:final_project/core/cach/cache_helper.dart';
import 'package:final_project/core/di/service_initializer.dart';
import 'package:final_project/features/settings/presentation/bloc/settings_cubit.dart';
import 'package:final_project/layout/presentation/logic/home_layout_cubit.dart';

// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/di/di_manager.dart';
import 'core/observers/bloc_observer.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  await ServiceInitializer.instance.initializeSettings();
  // WidgetsFlutterBinding.ensureInitialized();
  await dependencyInjectionInit();
  Bloc.observer = MyBlocObserver();
  // await Firebase.initializeApp(
  //
  //   options: DefaultFirebaseOptions.currentPlatform,
  //
  // );
  runApp(BlocProvider(
    create: (context) => SettingsCubit(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  late SettingsCubit bloc;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<SettingsCubit>(context);
    sharedPrefs();
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) =>  BlocProvider(
        create: (context) => serviceLocator<HomeLayoutCubit>(),
        child: MaterialApp(
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          initialRoute: "HomeLayout",
          onGenerateRoute: (settings) => Routes.onGenerate(settings),
        ),
      ),
    );
  }

  Future<void> sharedPrefs() async {
    var prefs = await SharedPreferences.getInstance();
    bloc.getUserData();
    var isDark = prefs.getBool("isDark");
    if (isDark == true)
      bloc.setCurrentMode(ThemeMode.dark);
    else if (isDark == false) bloc.setCurrentMode(ThemeMode.light);
  }
}

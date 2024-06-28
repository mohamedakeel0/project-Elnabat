
import 'package:final_project/core/cach/cache_helper.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServiceInitializer {
  ServiceInitializer._();

  static final ServiceInitializer instance = ServiceInitializer._();

  factory ServiceInitializer() => instance;

  /// TODO: init dependency injection, init app flavor, init Firebase
  initializeSettings() async {
    List futures = [

      initScreenUtils(),
      initCacheHelper(),

    ];
    await Future.wait<dynamic>([...futures]);
  }



  initScreenUtils() async {
    await ScreenUtil.ensureScreenSize();
  }

  initCacheHelper() async {
    await CacheStorage.init();
  }


}

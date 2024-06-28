import 'package:final_project/core/cach/cache_helper.dart';
import 'package:final_project/core/network/dio_service.dart';
import 'package:final_project/core/network/network_service.dart';
import 'package:final_project/features/Community/presentation/controller/community_cubit.dart';
import 'package:final_project/features/control/presentation/manager/control_cubit.dart';
import 'package:final_project/features/login/presentation/bloc/login_cubit.dart';
import 'package:final_project/features/registeration/presentation/bloc/registration_cubit.dart';
import 'package:final_project/layout/data/data_sources/process_image_remote_data_source.dart';
import 'package:final_project/layout/data/repositories/process_image_repo_impl.dart';
import 'package:final_project/layout/domain/repositories/process_image_repo.dart';
import 'package:final_project/layout/domain/use_cases/process_image_usecase.dart';
import 'package:final_project/layout/presentation/logic/home_layout_cubit.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

Future<void> dependencyInjectionInit() async {

// registration cubit
  serviceLocator.registerFactory(() => RegistrationCubit());
// =================================================================// registration cubit
  serviceLocator.registerFactory(() => CommunityCubit());
// =================================================================
// login cubit
  serviceLocator.registerFactory(() => LoginCubit());
// =================================================================
// control cubit
  serviceLocator.registerFactory(() => ControlCubit());
  // =================================================================
// home layouy cubit
  serviceLocator.registerFactory(() => HomeLayoutCubit(serviceLocator()));
  //Repository
  serviceLocator.registerLazySingleton<BaseProcessImageRepository>(
          () => ProcessImageRepository(serviceLocator()));
  //Use Cases
  serviceLocator
      .registerLazySingleton(() => ProcessImageUseCase(serviceLocator()));


  //DATA SOURCE
  serviceLocator.registerLazySingleton<BaseProcessImageRemoteDataSource>(
          () => ProcessImageRemoteDataSource());
// =================================================================
// experts cubit
  serviceLocator.registerFactory<NetworkService>(() => DioService());




}

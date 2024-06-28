
import 'dart:io';


import 'package:dio/dio.dart';
import 'package:final_project/core/di/di_manager.dart';
import 'package:final_project/core/network/api_endpoints.dart';
import 'package:final_project/core/network/network_request.dart';
import 'package:final_project/core/network/network_service.dart';
import 'package:final_project/layout/data/models/ProcessImageModel.dart';
import 'package:final_project/layout/domain/use_cases/process_image_usecase.dart';

abstract class BaseProcessImageRemoteDataSource {
  Future<ProcessImageModel> fetahProcessImage( ProcessImageParameter processImageParameter);
}

class ProcessImageRemoteDataSource extends BaseProcessImageRemoteDataSource {
  @override
  Future<ProcessImageModel> fetahProcessImage( ProcessImageParameter processImageParameter) async {


    try {
      final request = NetworkRequest(
          method: RequestMethod.post,
          path: ApiEndpoints.process_image,isFormData: true,
        body: processImageParameter.toJson()
        );

      final responseHome = await serviceLocator<NetworkService>()
          .callApi(
        request,
        mapper: (json) => ProcessImageModel.fromJson(json),
      )
          .catchError((e) {
        print('catchError RemoteData');
        print(e.toString());
      });
      return responseHome;
    } catch (e) {
      rethrow;
    }
  }
}

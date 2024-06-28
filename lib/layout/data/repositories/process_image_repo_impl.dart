import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:final_project/core/error/exeptions.dart';
import 'package:final_project/core/error/failuers.dart';
import 'package:final_project/layout/data/data_sources/process_image_remote_data_source.dart';
import 'package:final_project/layout/data/models/ProcessImageModel.dart';
import 'package:final_project/layout/domain/entities/ProcessImageEntity.dart';
import 'package:final_project/layout/domain/repositories/process_image_repo.dart';
import 'package:final_project/layout/domain/use_cases/process_image_usecase.dart';

class ProcessImageRepository extends BaseProcessImageRepository {
  final BaseProcessImageRemoteDataSource baseProcessImageRemoteDataSource;

  ProcessImageRepository(this.baseProcessImageRemoteDataSource);



  @override
  Future<Either<Failure, ProcessImageEntity>> fetaProcessImage
      (ProcessImageParameter processImageParameter)async {
    final result =
    await baseProcessImageRemoteDataSource.fetahProcessImage(processImageParameter);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      throw ServerException(failure.toString());
    }
  }
}

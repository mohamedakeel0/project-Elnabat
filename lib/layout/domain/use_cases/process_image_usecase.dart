import 'dart:io';


import 'package:dartz/dartz.dart';

import 'package:final_project/core/error/failuers.dart';
import 'package:final_project/core/usecase/base_usecase.dart';
import 'package:final_project/layout/domain/entities/ProcessImageEntity.dart';
import 'package:final_project/layout/domain/repositories/process_image_repo.dart';

class  ProcessImageUseCase extends BaseUseCase< ProcessImageEntity, ProcessImageParameter> {
  final BaseProcessImageRepository baseProcessImageRepository;

  ProcessImageUseCase(this.baseProcessImageRepository);

  @override
  Future<Either<Failure, ProcessImageEntity>> call(
      ProcessImageParameter processImageParameter) async {
    return await baseProcessImageRepository.fetaProcessImage(processImageParameter);
  }
}

class ProcessImageParameter{
  File file;
  ProcessImageParameter(this.file);
  Map<String, dynamic> toJson() {
    return {
      'image': file,
    };
  }
}

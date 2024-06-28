

import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:final_project/core/error/failuers.dart';
import 'package:final_project/layout/domain/entities/ProcessImageEntity.dart';
import 'package:final_project/layout/domain/use_cases/process_image_usecase.dart';

abstract class BaseProcessImageRepository {
  Future<Either<Failure, ProcessImageEntity>> fetaProcessImage(
      ProcessImageParameter processImageParameter);
}

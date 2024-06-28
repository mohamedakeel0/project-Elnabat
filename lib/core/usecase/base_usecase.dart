
import 'package:dartz/dartz.dart';
import 'package:final_project/core/error/failuers.dart';

abstract class BaseUseCase<T, Parameters> {
  Future<Either<Failure, T>> call(Parameters parameters);
}

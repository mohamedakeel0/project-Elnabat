import 'package:equatable/equatable.dart';

class ProcessImageEntity extends Equatable {
  final String? predictedDisease;

  const ProcessImageEntity({this.predictedDisease});

  @override
  List<Object?> get props => [predictedDisease];
}

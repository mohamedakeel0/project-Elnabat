part of 'control_cubit.dart';

abstract class ControlState extends Equatable {
  const ControlState();
}

class ControlInitial extends ControlState {
  @override
  List<Object> get props => [];
}

class WateringState extends ControlState {
  final bool watering;

  const WateringState({required this.watering});

  @override
  List<Object> get props => [watering];
}
// class ControlInitial extends ControlState {
//   @override
//   List<Object> get props => [];
// }

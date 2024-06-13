import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'control_state.dart';

class ControlCubit extends Cubit<ControlState> {
  ControlCubit() : super(ControlInitial());
  int txt = 0;

  setTxt(int txt) {
    this.txt = txt;
  }

  bool watering = false;

  void water() {
    watering = !watering;
    emit(WateringState(watering: watering));
  }

  @override
  void emit(ControlState state) {
    if (!isClosed) super.emit(state);
  }
}

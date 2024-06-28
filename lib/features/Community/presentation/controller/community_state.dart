
import 'package:equatable/equatable.dart';

class CommunityState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialCommunityState extends CommunityState {}
//--------------------------SavaProcessImage------------------------

class LoadingSavaPostState extends CommunityState {}

class SuccessSavaPostState extends CommunityState {}
//--------------------------SavaProcessImage------------------------

class LoadingFetchPostState extends CommunityState {}

class SuccessFetchPostState extends CommunityState {}
//--------------------------changeLike------------------------

class LoadingChangeLikeState extends CommunityState {}

class SuccessChangeLikeState extends CommunityState {}
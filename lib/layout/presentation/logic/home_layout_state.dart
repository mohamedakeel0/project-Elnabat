part of 'home_layout_cubit.dart';

 class HomeLayoutState extends Equatable {
  @override
  List<Object> get props => [];
}

//------------Pick Image------------------------------------------------
class InitialGetImageStates extends HomeLayoutState {

}

class SuccessGetImageState extends HomeLayoutState {}

class FailedGetImageState extends HomeLayoutState {}
//--------------------------FetaProcessImage------------------------

class LoadingFetaProcessImageState extends HomeLayoutState {}

class SuccessFetaProcessImageState extends HomeLayoutState {}

class ErrorFetaProcessImageState extends HomeLayoutState {}
//--------------------------SavaProcessImage------------------------

class LoadingSavaProcessImageState extends HomeLayoutState {}

class SuccessSavaProcessImageState extends HomeLayoutState {}
//--------------------------SavaProcessImage------------------------

class LoadingFetchProcessImageLocalState extends HomeLayoutState {}

class SuccessFetchProcessImageLocalState extends HomeLayoutState {}
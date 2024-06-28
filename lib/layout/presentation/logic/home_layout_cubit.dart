import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:final_project/core/cach/cache_helper.dart';
import 'package:final_project/core/cach/cache_helper_keys.dart';
import 'package:final_project/features/home/presentation/widgets/historyDetails.dart';

import 'package:final_project/layout/domain/entities/ProcessImageEntity.dart';
import 'package:final_project/layout/domain/use_cases/process_image_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:final_project/core/utils/constants.dart';

part 'home_layout_state.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutState> {
  HomeLayoutCubit(this.processImageUseCase) : super(HomeLayoutState());
  final ProcessImageUseCase processImageUseCase;

  static HomeLayoutCubit get(context) => BlocProvider.of(context);
  File? image;
  List<ProcessImage> listProcessImage = [];
  final picker = ImagePicker();

  Future getImage(context) async {
    if (!isClosed) {
      emit(InitialGetImageStates());
    }

    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      if (processImageEntity != null) {}

          // Navigator.of(context).push(MaterialPageRoute(
          //     builder: (context) => HistoryDetails(image!.path,
          //         processImageEntity!.predictedDisease!, '${DateTime.now()}')));
      // savaProcessImage(ProcessImage(
      //     date: '${DateTime.now()}',
      //     title: 'processImageEntity!.predictedDisease!',
      //     path: image!.path));
      fetaProcessImage(context, ProcessImageParameter(image!));
      if (!isClosed) {
        emit(SuccessGetImageState());
      }
    } else {
      if (!isClosed) {
        emit(FailedGetImageState());
      }
    }
  }

  ProcessImageEntity? processImageEntity;

  Future<void> fetaProcessImage(
      context, ProcessImageParameter processImageParameter) async {
    if (!isClosed) {
      emit(LoadingFetaProcessImageState());
    }

    final resultLogin =
        await processImageUseCase(processImageParameter).catchError((error) {
      if (!isClosed) {
        emit(ErrorFetaProcessImageState());
      }
    });
    resultLogin.fold((l) {
      if (!isClosed) {
        emit(ErrorFetaProcessImageState());
      }
    }, (date) {
      processImageEntity = date;
      print('ssssss');
      print(processImageParameter.file.path);
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => HistoryDetails(processImageParameter.file.path,
              processImageEntity!.predictedDisease!, '${DateTime.now()}')));
      savaProcessImage(ProcessImage(
          date: '${DateTime.now()}',
          title: processImageEntity!.predictedDisease!,
          path: processImageParameter.file.path));
      if (!isClosed) {
        emit(SuccessFetaProcessImageState());
      }
    });
  }

  List<String> images = [];

  void savaProcessImage(ProcessImage processImage) {
    if (!isClosed) {
      emit(SuccessSavaProcessImageState());
    }
    listProcessImage.add(processImage);
    String teacherCovet = jsonEncode(processImage.toJson());
    images.add(teacherCovet);
    images.forEach((element) {
      print(element);
    });
    CacheStorage.write(key: CacheStorageKeys.listImage, value: images);
    fetchProcessImageLocal();
    if (!isClosed) {
      emit(SuccessSavaProcessImageState());
    }
  }

  ProcessImage? processImage;

  Future<void> fetchProcessImageLocal() async {
    if (!isClosed) {
      emit(LoadingFetchProcessImageLocalState());
    }
    List<String> userDataProfile =
        await CacheStorage.read(key: CacheStorageKeys.listImage);

    if (userDataProfile != null) {
      userDataProfile.forEach((element) {
        listProcessImage.add(ProcessImage.fromJson(jsonDecode(element)));
      });
      for (var value in listProcessImage) {
        print('66666');
        print(value.path);
      }
    }
    if (!isClosed) {
      emit(SuccessFetchProcessImageLocalState());
    }
  }
}

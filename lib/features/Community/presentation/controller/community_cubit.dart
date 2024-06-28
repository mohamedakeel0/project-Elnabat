

import 'dart:convert';

import 'package:final_project/core/cach/cache_helper.dart';
import 'package:final_project/core/cach/cache_helper_keys.dart';
import 'package:final_project/core/utils/constants.dart';
import 'package:final_project/features/Community/presentation/controller/community_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommunityCubit extends Cubit<CommunityState> {
  CommunityCubit()
      : super(InitialCommunityState());
List<String>named=[

];
  List<PostCommit> postCommit=[];
  TextEditingController textController = TextEditingController();
   void initData(){
     named=[
       'ADDDEL',
       'MONA',
       'yARA',
       'MOAHMED'
     ];
     postCommit=[
       PostCommit(title: 'Habiba',id: DateTime.now().millisecondsSinceEpoch,isLike: false,time: '${DateTime.now().hour}:${DateTime.now().minute}',comment:'Good' ),
       PostCommit(title: 'Sara',id: DateTime.now().millisecondsSinceEpoch,isLike: true,time: '${DateTime.now().hour}:${DateTime.now().minute}',comment:'Bad' ),
     ];
     if(CacheStorage.read(key: CacheStorageKeys.post)!=null){
       fetchPost();
     }

}
  List <String>postString=[];
  static CommunityCubit get(context) => BlocProvider.of(context);
  int index=0;
  void savaPost(PostCommit postCommit0) {
    if (!isClosed) {
      emit(SuccessSavaPostState());
    }
    index++;



    String teacherCovet = jsonEncode(postCommit0.toJson());
    postString.add(teacherCovet);
    postString.forEach((element) {
      print(element);
    });
    CacheStorage.write(key: CacheStorageKeys.post, value: postString);
     textController.text='';
    fetchPost();
    if (!isClosed) {
      emit(SuccessSavaPostState());
    }
  }
  ProcessImage? processImage;

  Future<void> fetchPost() async {
    if (!isClosed) {
      emit(LoadingFetchPostState());
    }
    List<String> userDataProfile =
    await CacheStorage.read(key: CacheStorageKeys.post);

    if (userDataProfile != null) {
      userDataProfile.forEach((element) {
        postCommit.add(PostCommit.fromJson(jsonDecode(element)));
      });
      for (var value in postCommit) {
        print('66666');
        print(value.id);
      }
    }
    if (!isClosed) {
      emit(SuccessFetchPostState());
    }

  }
  void changeLike(index){

    if (!isClosed) {
      emit(LoadingChangeLikeState());
    }

    postCommit[index].isLike = !postCommit[index].isLike;

    if (!isClosed) {
      emit(SuccessChangeLikeState());
    }
  }
}

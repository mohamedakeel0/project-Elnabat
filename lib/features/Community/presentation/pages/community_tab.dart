import 'package:final_project/core/di/di_manager.dart';
import 'package:final_project/core/utils/constants.dart';
import 'package:final_project/features/Community/presentation/controller/community_cubit.dart';
import 'package:final_project/features/Community/presentation/controller/community_state.dart';
import 'package:final_project/features/Community/presentation/widgets/PostCard_Item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommunityTab extends StatelessWidget {
  const CommunityTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<CommunityCubit>()..initData(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            'AI NABTA',
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: BlocBuilder<CommunityCubit, CommunityState>(
                  builder: (context, selectedCountryState) {
                var cubit = CommunityCubit.get(context);
                return Column(
                  children: [
                Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.blueGrey,
                                  radius: 20.0,
                                  child: Icon(
                                    Icons.person,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Row(
                                  children: [
                                    Text(
                                     cubit.named[cubit.index],
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle2!
                                          .copyWith(height: 1.3),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            TextFormField(
                              controller: cubit.textController,
                              decoration: InputDecoration(
                                  hintText: 'what is on your mind ...',
                                  border: InputBorder.none),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      cubit.savaPost(PostCommit(title:  cubit.named[cubit.index],id: DateTime.now().millisecondsSinceEpoch,isLike: false,time: '${DateTime.now().hour}:${DateTime.now().minute}',comment:cubit.textController.text ),);
                                    },
                                    child: Row(
                                      children: [
                                        Icon(Icons.add_box_outlined),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text('add Post'),
                                      ],
                                    )),
                                Expanded(
                                  child: TextButton(
                                      onPressed: () {}, child: Text('# tags')),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height ,
                      child: ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return PostCardItem(
                            like: () {
                              cubit.changeLike(index);
                            },
                            isLike: cubit.postCommit[index].isLike,
                            name: cubit.postCommit[index].title,
                            comment: cubit.postCommit[index].comment,
                            time: cubit.postCommit[index].time,
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(),
                        scrollDirection: Axis.vertical,
                        itemCount: cubit.postCommit.length,
                      ),
                    ),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:final_project/features/home/presentation/widgets/history.dart';
import 'package:final_project/layout/presentation/logic/home_layout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryColumn extends StatelessWidget {
  String date = " Sat, 13 Apr 2024  10:33:57 AM ";

  HistoryColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<HomeLayoutCubit, HomeLayoutState>(
        builder: (context, selectedCountryState) {
          var cubit = HomeLayoutCubit.get(context);
        return Container(
          color: Colors.transparent,
          child: SingleChildScrollView(
            child:cubit.listProcessImage.isNotEmpty&&cubit.listProcessImage!=null? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height-200,
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return History(cubit.listProcessImage[index].path, cubit.listProcessImage[index].date,cubit.listProcessImage[index].title);
                    },
                    separatorBuilder: (context, index) => const SizedBox(),
                    scrollDirection: Axis.vertical,
                    itemCount: cubit.listProcessImage.length,
                  ),
                ),
                const SizedBox(height: 20),

              ],
            ):SizedBox(),
          ),
        );
      }
    );
  }
}

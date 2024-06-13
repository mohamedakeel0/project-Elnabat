import 'package:final_project/config/routes/routes.dart';
import 'package:final_project/features/control/presentation/manager/control_cubit.dart';
import 'package:final_project/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ControlScreen extends StatefulWidget {
  const ControlScreen({super.key});

  @override
  State<ControlScreen> createState() => _ControlScreenState();
}

class _ControlScreenState extends State<ControlScreen> {
  @override
  Widget build(BuildContext context) {
    final ControlCubit cubitControl = context.read<ControlCubit>();
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text(
          "Control Page",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.bluetooth);
            },
            icon: Icon(
              Icons.bluetooth,
              size: 30,
              color: Colors.white,
            ),
            color: Colors.white,
          ),
          SizedBox(
            width: 12,
          )
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 70,
          ),
          Center(
            child: Container(
              width: 250,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Humidity ",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    cubitControl.txt.toString(),
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    // "Number"
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          BlocBuilder<ControlCubit, ControlState>(
            builder: (context, state) {
              return Material(
                //Wrap with Material
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22.0)),
                elevation: 18.0,
                color: const Color(0xFF801E48),
                clipBehavior: Clip.antiAlias,
                // Add This
                child: MaterialButton(
                  minWidth: 200.0,
                  height: 95,
                  color: state is WateringState && state.watering
                      ? Colors.grey
                      : MyColors.mainColor,
                  onPressed: context.read<ControlCubit>().water,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                          state is WateringState && state.watering
                              ? 'Stop Watering'
                              : 'Start Watering',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                            color: Colors.white,
                          )),
                      const SizedBox(
                        width: 12,
                      ),
                      const Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    ));
  }
}

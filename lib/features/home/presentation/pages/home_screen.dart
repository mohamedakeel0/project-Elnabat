import 'package:final_project/features/home/presentation/widgets/history_column.dart';
import 'package:final_project/shared/styles/colors.dart';
import 'package:flutter/material.dart';

class HomeTap extends StatefulWidget {
  const HomeTap({
    super.key,
  });

  @override
  State<HomeTap> createState() => _HomeTapState();
}

class _HomeTapState extends State<HomeTap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      //extendBody: true,
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      //   title: const Text(
      //     'AI NABTA',
      //     style: TextStyle(
      //         fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
      //   ),
      // ),
      body: Stack(children: [
        Image.asset(
          "assets/images/12.jpg",
          fit: BoxFit.fill,
          height: double.infinity,
          width: double.infinity,
        ),
        Container(
          width: double.infinity,
          margin:
              const EdgeInsets.only(top: 50, bottom: 10, right: 20, left: 20),
          /* decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('images/77.jpg'),
              fit: BoxFit.cover,
            )),*/
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //const FirstRow(),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  'Welcome to AI NAPTA!',
                  style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.w500,
                      color: MyColors.mainColor),
                ),
              ),
              //const SearchBox(),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: const Text(
                  'History',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              Expanded(child: HistoryColumn()),
            ],
          ),
        ),
      ]),
    );
  }
}
//Column(
//         children: [
//           if (GetIt.instance<HomeLayoutCubit>().img != null)
//             Image(
//               image: FileImage(GetIt.instance<HomeLayoutCubit>().img!.image),
//               width: double.infinity,
//               height: 300,
//             )
//         ],
//       ),

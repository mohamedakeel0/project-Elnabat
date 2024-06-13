import 'package:final_project/features/settings/presentation/widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/settings_cubit.dart';

class ContactBottomSheet extends StatefulWidget {
  @override
  State<ContactBottomSheet> createState() => _ContactBottomSheetState();
}

class _ContactBottomSheetState extends State<ContactBottomSheet> {
  TextStyle style = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  late TextEditingController phoneNum;
  late TextEditingController streetName;
  late TextEditingController city;
  late TextEditingController country;

  bool readOnly = false;
  late SettingsCubit bloc;

  void initState() {
    bloc = BlocProvider.of<SettingsCubit>(context);
    phoneNum = TextEditingController(text: bloc.PhoneGet.text);
    streetName = TextEditingController(text: bloc.StreetGet.text);
    city = TextEditingController(text: bloc.CityGet.text);
    country = TextEditingController(text: bloc.CountryGet.text);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<SettingsCubit>(context);
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return Container(
          height: MediaQuery.of(context).size.height * .57,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Contact Information..",
                    style: style.copyWith(fontSize: 25),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Phone Number", style: style),
                  MyTextField(
                    txt: phoneNum,
                    r: readOnly,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Street Name", style: style),
                  MyTextField(
                    txt: streetName,
                    r: readOnly,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("City", style: style),
                  MyTextField(
                    txt: city,
                    r: readOnly,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Country", style: style),
                  MyTextField(
                    txt: country,
                    r: readOnly,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            readOnly = true;
                            bloc.Phone(phoneNum);
                            bloc.Street(streetName);
                            bloc.City(city);
                            bloc.Country(country);
                            Navigator.of(context).pop();
                          },
                          child: Text("Update", style: style)),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("Discard", style: style)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

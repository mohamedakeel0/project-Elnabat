import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());

  bool arSwitch = false;
  bool darkSwitch = false;
  String currentLocale = "en";
  ThemeMode currentMode = ThemeMode.light;
  TextEditingController _roleText = TextEditingController();
  TextEditingController _workText = TextEditingController();
  TextEditingController _usageText = TextEditingController();
  TextEditingController _fName = TextEditingController();
  TextEditingController _lName = TextEditingController();
  TextEditingController _uName = TextEditingController();
  TextEditingController _eMail = TextEditingController();
  TextEditingController _Phone = TextEditingController();
  TextEditingController _Street = TextEditingController();
  TextEditingController _City = TextEditingController();
  TextEditingController _Country = TextEditingController();
  TextEditingController _Old = TextEditingController();
  TextEditingController _New = TextEditingController();
  TextEditingController _Confirm = TextEditingController();
  File? pickedImage;

  Future<void> getImageFromCamera() async {
    emit(SettingsInitial());
    var image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      pickedImage = File(image.path);
      final prefs = await SharedPreferences.getInstance();
      prefs.setString("image_path", image.path);
      debugPrint('picked image updated: ${pickedImage?.path}');
    }
    emit(ChangeProfileImage());
  }

  Future getImageFromGallery() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      pickedImage = File(image.path);
      final prefs = await SharedPreferences.getInstance();
      prefs.setString("image_path", image.path);
      debugPrint('picked image updated: ${pickedImage?.path}');
    }
    emit(ChangeProfileImage());
  }

  bool isDark() {
    return currentMode == ThemeMode.dark;
  }

  void setCurrentLocale(String newLocale) async {
    currentLocale = newLocale;
    emit(SettingsLocale());
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("locale", currentLocale);
  }

  void setCurrentMode(ThemeMode newThemeMode) async {
    currentMode = newThemeMode;
    emit(SettingsTheme());
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("isDark", currentMode == ThemeMode.dark);
  }

  void usageText(TextEditingController value) async {
    emit(SettingsInitial());
    _usageText = value;
    emit(TextFieldState());
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("usage", _usageText.text);
  }

  void workText(TextEditingController value) async {
    emit(SettingsInitial());
    _workText = value;
    emit(TextFieldState());
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("work", _workText.text);
  }

  void roleText(TextEditingController value) async {
    emit(SettingsInitial());
    _roleText = value;
    emit(TextFieldState());
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("role", _roleText.text);
  }

  void fName(TextEditingController value) async {
    emit(SettingsInitial());
    _fName = value;
    emit(TextFieldState());
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("fname", _fName.text);
  }

  void lName(TextEditingController value) async {
    emit(SettingsInitial());
    _lName = value;
    emit(TextFieldState());
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("lname", _lName.text);
  }

  void uName(TextEditingController value) async {
    emit(SettingsInitial());
    _uName = value;
    emit(TextFieldState());
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("uname", _uName.text);
  }

  void eMail(TextEditingController value) async {
    emit(SettingsInitial());
    _eMail = value;
    emit(TextFieldState());
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("email", _eMail.text);
  }

  void Street(TextEditingController value) async {
    emit(SettingsInitial());
    _Street = value;
    emit(TextFieldState());
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("street", _Street.text);
  }

  void City(TextEditingController value) async {
    emit(SettingsInitial());
    _City = value;
    emit(TextFieldState());
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("city", _City.text);
  }

  void Country(TextEditingController value) async {
    emit(SettingsInitial());
    _Country = value;
    emit(TextFieldState());
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("country", _Country.text);
  }

  void Phone(TextEditingController value) async {
    emit(SettingsInitial());
    _Phone = value;
    emit(TextFieldState());
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("phone", _Phone.text);
  }

  void Old(TextEditingController value) async {
    emit(SettingsInitial());
    _Old = value;
    emit(TextFieldState());
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("old", _Old.text);
  }

  void Neww(TextEditingController value) async {
    emit(SettingsInitial());
    _New = value;
    emit(TextFieldState());
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("new", _New.text);
  }

  void Confirm(TextEditingController value) async {
    emit(SettingsInitial());
    _Confirm = value;
    emit(TextFieldState());
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("confirm", _Confirm.text);
  }

  void getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    String? path = prefs.getString("image_path");
    pickedImage = path != null ? File(path) : null;
    usageText(TextEditingController(text: prefs.getString("usage")));
    roleText(TextEditingController(text: prefs.getString("role")));
    workText(TextEditingController(text: prefs.getString("work")));
    fName(TextEditingController(text: prefs.getString("fname")));
    lName(TextEditingController(text: prefs.getString("lname")));
    uName(TextEditingController(text: prefs.getString("uname")));
    eMail(TextEditingController(text: prefs.getString("email")));
    Phone(TextEditingController(text: prefs.getString("phone")));
    Street(TextEditingController(text: prefs.getString("street")));
    City(TextEditingController(text: prefs.getString("city")));
    Country(TextEditingController(text: prefs.getString("country")));
    Old(TextEditingController(text: prefs.getString("old")));
    Neww(TextEditingController(text: prefs.getString("New")));
    Confirm(TextEditingController(text: prefs.getString("confirm")));
    emit(GetUserDataState());
  }

  TextEditingController get usageTextGet => _usageText;

  TextEditingController get workTextGet => _workText;

  TextEditingController get roleTextGet => _roleText;

  TextEditingController get lNameGet => _lName;

  TextEditingController get uNameGet => _uName;

  TextEditingController get eMailGet => _eMail;

  TextEditingController get fNameGet => _fName;

  TextEditingController get CountryGet => _Country;

  TextEditingController get CityGet => _City;

  TextEditingController get StreetGet => _Street;

  TextEditingController get PhoneGet => _Phone;

  TextEditingController get ConfirmGet => _Confirm;

  TextEditingController get NewGet => _New;

  TextEditingController get OldGet => _Old;
}

part of 'settings_cubit.dart';

@immutable
abstract class SettingsState {}

class SettingsInitial extends SettingsState {}

class SettingsLocale extends SettingsState {}

class SettingsTheme extends SettingsState {}

class TextFieldState extends SettingsState {}

class GetUserDataState extends SettingsState {}

class ChangeProfileImage extends SettingsState {}

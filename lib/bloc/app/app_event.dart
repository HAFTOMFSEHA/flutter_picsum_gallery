part of 'app_bloc.dart';

class AppEvent {}

class OnLogin extends AppEvent {
  final String user;
  final String password;

  OnLogin({required this.user,required this.password});
}

class OnChangeTheme extends AppEvent {
 
}

class OnLogOut extends AppEvent {

}
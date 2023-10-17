part of 'app_bloc.dart';

class AppState {
final bool isLoading;
final bool isThemeLight;
final String ?user;
final bool isAuth;

AppState({this.isAuth=false,this.isThemeLight=true, this.isLoading=false, this.user});


AppState copyWith ({
final bool? isLoading,
final bool ? isThemeLight,
final String? user,
final bool? isAuth,
})=>AppState(isAuth:isAuth?? this.isAuth, isLoading: isLoading?? this.isLoading,isThemeLight: isThemeLight??this.isThemeLight,user: user??this.user);

 }


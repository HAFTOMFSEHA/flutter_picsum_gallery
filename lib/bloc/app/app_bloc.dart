import 'package:bloc/bloc.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppState(isLoading: false)) {
    on<OnLogin>((event, emit) {
     emit(state.copyWith(isLoading: true));
    // Validate the password using regex for uppercase, lowercase, and special characters
      bool isValidPassword = _isPasswordCompliant(event.password);
     if(isValidPassword){
      final i=event.user.indexOf('@');
      final user=event.user.substring(0,i);
      final userCapitalize= user[0].toUpperCase() + user.substring(1);
     
      emit(state.copyWith(user:userCapitalize,isLoading: false,isAuth: true));
     }else{
     
      emit(state.copyWith(isLoading: false,isAuth: false));
     }
    });
   
   on <OnChangeTheme>((event, emit) {
state.isThemeLight? emit(state.copyWith(isThemeLight: false)) : emit(state.copyWith(isThemeLight: true));
   });

  on<OnLogOut> ((event, emit) {
   emit(state.copyWith(isAuth: false,user: null,isThemeLight: true));
  });
  }

   bool _isPasswordCompliant(String password, [int minLength = 6]) {
    // Minimum eight characters, at least one uppercase letter, one lowercase letter and one special character:
    Pattern pattern = r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\W).{' + minLength.toString() + r',}$';
    RegExp regex = RegExp(pattern as String);
    if (!regex.hasMatch(password))
      return false;
    else
      return true;
  }
}

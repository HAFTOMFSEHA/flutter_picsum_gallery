import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picsum_photos/bloc/pics/pics_bloc.dart';
import 'package:picsum_photos/screens/screens.dart';
import 'package:provider/provider.dart';

import 'bloc/app/app_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await FlutterDownloader.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(create: (_) => AppBloc()),
        BlocProvider(create: (_) => PicsBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData().copyWith(
          textTheme: GoogleFonts.aBeeZeeTextTheme(
              const TextTheme() 
              ),
        ),
        initialRoute: 'login',
        routes: {
          'login': (_) => const SigninScreen(),
          'home': (_) => const HomeScreen()
        },
      ),
    );
  }
}

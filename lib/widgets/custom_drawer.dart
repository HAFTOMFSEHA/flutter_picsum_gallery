import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/app/app_bloc.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  late bool _value;

  @override
  void initState() {
    super.initState();
    _value = BlocProvider.of<AppBloc>(context).state.isThemeLight;
  }

  @override
  Widget build(BuildContext context) {
    final appBloc = BlocProvider.of<AppBloc>(context);

    return BlocBuilder<AppBloc, AppState>(builder: (context, state) {
      return Drawer(
        shadowColor: Colors.white,
        backgroundColor: appBloc.state.isThemeLight
            ? Color(0xFF07abcc)
            : Color(0xFF07abcc),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/app_logo.png',
                      width: 100,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        appBloc.state.user!,
                        style: TextStyle(
                            color: appBloc.state.isThemeLight
                                ? const Color(0xFFA9D6E5)
                                : const Color(0xFF013A63),
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                color: Color(0xFFA9D6E5),
                thickness: 1,
                indent: 16,
                endIndent: 16,
              ),
            
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: () {
                    appBloc.add(OnLogOut());
                    Navigator.pushReplacementNamed(context, 'login');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Log out',
                          style: TextStyle(
                              color: appBloc.state.isThemeLight
                                  ? const Color(0xFFA9D6E5)
                                  : const Color(0xFF013A63))),
                      Icon(Icons.logout,
                          color: appBloc.state.isThemeLight
                              ? const Color(0xFFA9D6E5)
                              : const Color(0xFF013A63)),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}

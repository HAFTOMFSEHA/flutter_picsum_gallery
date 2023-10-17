import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picsum_photos/bloc/app/app_bloc.dart';
import 'package:picsum_photos/widgets/custom_alert.dart';

class CustomForm extends StatefulWidget {
  const CustomForm({Key? key}) : super(key: key);

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool autoValidate = false;
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final login = BlocProvider.of<AppBloc>(context);
    return Form(
      key: formKey,
      autovalidateMode:
          autoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextFormField(
              style: const TextStyle(color:  Color(0xFF012A4A)),
              controller: usernameController,
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: formInputDecoration(
                  label: 'Email',
                  icon: Icons.email,
                  hintText: 'Yogesh@lennar.com'),
              validator: (value) {
                String pattern =
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp = RegExp(pattern);
                return regExp.hasMatch(value ?? '')
                    ? null
                    : 'Please enter a valid email';
              },
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              style: const TextStyle(color:  Color(0xFF013A63)),
              controller: passwordController,
              obscureText: true,
              autocorrect: false,
              decoration: formInputDecoration(
                  label: 'Password', icon: Icons.lock, hintText: '******'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a password';
                }
                if (value.length < 6) {
                  return 'Password should be at least 6 characters';
                }
                return null; // El valor es válido
              },
            ),
            const SizedBox(
              height: 30,
            ),
            MaterialButton(
              onPressed: login.state.isLoading
                  ? null
                  : () async {
                      FocusScope.of(context).unfocus();
                      setState(() {
                        autoValidate = true;
                      });

                      if (formKey.currentState!.validate()) {
                        login.add(OnLogin(
                            user: usernameController.text,
                            password: passwordController.text));
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          final state = context.read<AppBloc>().state;
                          if (!state.isAuth) {
                            customAlert(
                                context, "Password must contain at least one uppercase letter, one lowercase letter and one special character.");
                          } else {
                            Navigator.pushReplacementNamed(context, 'home');
                          }
                        });
                      } else {
                        return;
                      }
                    },
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(21)),
              elevation: 0,
              disabledColor: const Color(0xFF07abcc),
              color: const Color(0xFF07abcc),
              minWidth: 200,
              child: Text(
                !login.state.isLoading ? 'SIGN IN' : 'LOADING',
                style: const TextStyle(fontSize: 20),
              ), //Loading disabled.
            )
          ],
        ),
      ),
    );
  }

  InputDecoration formInputDecoration(
      {required String label,
      required IconData icon,
      required String hintText}) {
    return InputDecoration(
        label: Text(label), icon: Icon(icon), hintText: hintText);
  }
}

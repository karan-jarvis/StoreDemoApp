import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_demo_app/navigation/routes_key.dart';
import 'package:store_demo_app/screens/login/bloc/bloc.dart';
import 'package:store_demo_app/widgets/loader.dart';
import 'package:store_demo_app/widgets/toast.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoginWidget();
  }
}

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool userValidate = false;
  bool passValidate = false;
  bool isLoading = false;
  bool secureText = true;

  LoginBloc loginBloc = LoginBloc();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginScreenState>(
      bloc: loginBloc,
      listener: (context, state) {
        // TODO: implement listener
        if (state is LoginLoadingState) {
          isLoading = true;
        } else {
          isLoading = false;
        }
      },
      child: BlocBuilder<LoginBloc, LoginScreenState>(
        bloc: loginBloc,
        builder: (context, state) {
          return PopScope(
            canPop: false,
            child: GestureDetector(
              onTap: () {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: Scaffold(
                resizeToAvoidBottomInset: false, //new line
                body: Stack(
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: <Widget>[
                              const SizedBox(
                                height: 100,
                              ),
                              const Text(
                                "Login",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontFamily: "Tw Cen MT",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              TextField(
                                keyboardType: TextInputType.text,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                ),
                                controller: _userNameController,
                                textAlign: TextAlign.left,
                                decoration: InputDecoration(
                                  filled: true,
                                  counterText: "",
                                  hintText: 'UserName',
                                  hintStyle: const TextStyle(
                                    fontFamily: "Tw Cen MT",
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                  contentPadding:
                                      const EdgeInsets.only(left: 20),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(),
                                    borderRadius: BorderRadius.circular(19.5),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(),
                                    borderRadius: BorderRadius.circular(19.5),
                                  ),
                                  errorText: userValidate
                                      ? 'User Can\'t Be Empty'
                                      : null,
                                  errorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.redAccent),
                                    borderRadius: BorderRadius.circular(19.5),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(),
                                    borderRadius: BorderRadius.circular(19.5),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextField(
                                obscureText: secureText,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                ),
                                controller: _passwordController,
                                textAlign: TextAlign.left,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      secureText = !secureText;
                                      setState(() {});
                                    },
                                    icon: secureText
                                        ? const Icon(
                                            Icons.visibility_off_outlined,
                                            color: Colors.black)
                                        : const Icon(Icons.remove_red_eye,
                                            color: Colors.black),
                                  ),
                                  filled: true,
                                  hintText: 'Password',
                                  hintStyle: const TextStyle(
                                    fontFamily: "Tw Cen MT",
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                  contentPadding:
                                      const EdgeInsets.only(left: 20),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(),
                                    borderRadius: BorderRadius.circular(19.5),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(),
                                    borderRadius: BorderRadius.circular(19.5),
                                  ),
                                  errorText: passValidate
                                      ? 'Password Can\'t Be Empty'
                                      : null,
                                  errorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.redAccent),
                                    borderRadius: BorderRadius.circular(19.5),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(),
                                    borderRadius: BorderRadius.circular(19.5),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              InkWell(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 50, vertical: 10),
                                  decoration: const BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(19)),
                                  ),
                                  child: const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Login",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  log(_userNameController.text);
                                  log(_passwordController.text);
                                  if (_userNameController.text != '' &&
                                      _passwordController.text != '') {
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                    log('data');
                                    loginBloc.add(LoginEvent(
                                        context: context,
                                        userName:
                                            _userNameController.text.trim(),
                                        password:
                                            _passwordController.text.trim()));
                                  } else {
                                    log('no data');
                                    showToast(
                                        "Please enter your username and password before proceeding");
                                  }
                                },
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("Don't have an account?"),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, Routes.signup);
                                    },
                                    child: const Text('Sign up'),
                                  ),
                                ],
                              )
                              // Expanded(
                              //   flex: 1,
                              //     child : Spacer(),
                              // ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    isLoading
                        ? SizedBox(
                            height: double.infinity,
                            width: double.infinity,
                            child: Loader(),
                          )
                        : const SizedBox()
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

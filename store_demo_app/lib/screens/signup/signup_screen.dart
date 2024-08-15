import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_demo_app/screens/signup/bloc/bloc.dart';
import 'package:store_demo_app/widgets/loader.dart';
import 'package:store_demo_app/widgets/toast.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SignUpWidget();
  }
}

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({super.key});

  @override
  _SignUpWidgetState createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  final _userNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool userValidate = false;
  bool emailValidate = false;
  bool passValidate = false;
  bool isLoading = false;
  bool secureText = true;

  SignUpBloc signUpBloc = SignUpBloc();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpBloc, SignUpScreenState>(
      bloc: signUpBloc,
      listener: (context, state) {
        if (state is SignUpLoadingState) {
          setState(() {
            isLoading = true;
          });
        } else {
          setState(() {
            isLoading = false;
          });
        }
      },
      child: BlocBuilder<SignUpBloc, SignUpScreenState>(
        bloc: signUpBloc,
        builder: (context, state) {
          return GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 100,
                        ),
                        const Text(
                          "Sign Up",
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
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                          controller: _emailController,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            filled: true,
                            counterText: "",
                            hintText: 'Email',
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
                            errorText: emailValidate
                                ? 'Email Can\'t Be Empty'
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
                                setState(() {
                                  secureText = !secureText;
                                });
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
                                  "Sign Up",
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
                            log(_emailController.text);
                            log(_passwordController.text);
                            if (_userNameController.text.isNotEmpty &&
                                _emailController.text.isNotEmpty &&
                                _passwordController.text.isNotEmpty) {
                              FocusManager.instance.primaryFocus?.unfocus();
                              log('data');
                              signUpBloc.add(SignUpEvent(
                                  context: context,
                                  userName:
                                  _userNameController.text.trim(),
                                  email: _emailController.text.trim(),
                                  password:
                                  _passwordController.text.trim()));
                            } else {
                              log('no data');
                              showToast(
                                  "Please fill all fields before proceeding");
                            }
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Already have an account?"),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Login'),
                            ),
                          ],
                        )
                      ],
                    ),
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
          );
        },
      ),
    );
  }
}

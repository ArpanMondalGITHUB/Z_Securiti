import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:khanakhazana/features/auth/presentation/bloc/auth_bloc_bloc.dart';
import 'package:khanakhazana/features/auth/presentation/pages/login_page.dart';
import 'package:khanakhazana/features/auth/presentation/widgets/auth_gradient_button.dart';
import 'package:khanakhazana/features/auth/presentation/widgets/authform.dart';
import 'package:khanakhazana/features/map/presentation/pages/map_page.dart';
import 'package:khanakhazana/global/common/widget/loader.dart';
import 'package:khanakhazana/global/utils/show_snackbar.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final namecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  void dispose() {
    namecontroller.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authbloc = GetIt.I<AuthBlocBloc>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocConsumer<AuthBlocBloc, AuthBlocState>(
          bloc: authbloc,
          listener: (context, state) {
            if (state is AuthFailure) {
              return showSnakBar(context,state.message);
            } else if (state is AuthSuccess) {
              // Navigate to HomePage after successful signup
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MapScreen()),
              );
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return const Loader();
            }
            return Form(
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Signup',
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  AuthForm(
                    controller: namecontroller,
                    hint: 'Name',
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  AuthForm(
                    controller: emailcontroller,
                    hint: 'Email',
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  AuthForm(
                    controller: passwordcontroller,
                    hint: 'Password',
                    isObscureText: true,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  AuthButton(
                    text: 'Sign up',
                    ontap: () {
                      if (formkey.currentState!.validate()) {
                        authbloc.add(Signup(
                              email: emailcontroller.text,
                              name: namecontroller.text,
                              password: passwordcontroller.text,
                            ));
                      }
                    },
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>const LoginPage(),
                          ));
                    },
                    child: RichText(
                      text: TextSpan(
                          text: "have an account? ",
                          style: Theme.of(context).textTheme.titleSmall,
                          children: [
                            TextSpan(
                                text: ' Login',
                                style: Theme.of(context).textTheme.titleMedium)
                          ]),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

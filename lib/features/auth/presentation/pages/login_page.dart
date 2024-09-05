import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:khanakhazana/features/auth/presentation/bloc/auth_bloc_bloc.dart';
import 'package:khanakhazana/features/auth/presentation/pages/signup_page.dart';
import 'package:khanakhazana/features/auth/presentation/widgets/auth_gradient_button.dart';
import 'package:khanakhazana/features/auth/presentation/widgets/authform.dart';
import 'package:khanakhazana/global/common/widget/loader.dart';
import 'package:khanakhazana/global/utils/show_snackbar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authBloc = GetIt.I<AuthBlocBloc>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocConsumer<AuthBlocBloc, AuthBlocState>(
          bloc: authBloc,
          listener: (context, state) {
            if(state is AuthFailure){
              return showSnakBar(context,state.message);
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
                    'Login',
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
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
                    text: 'Login ',
                    ontap: () {
                      if (formkey.currentState!.validate()) {
                        authBloc.add(Signin(
                              email: emailcontroller.text,
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
                            builder: (context) => const SignupPage(),
                          ));
                    },
                    child: RichText(
                      text: TextSpan(
                          text: "don't have an account? ",
                          style: Theme.of(context).textTheme.titleSmall,
                          children: [
                            TextSpan(
                                text: ' Sign up',
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

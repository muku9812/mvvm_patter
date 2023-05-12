import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../resources/components/reusableButton.dart';
import '../utility/utilities.dart';
import '../viewModel/authViewModel.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Welcome novel reader !",
              style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic),
            ),
            const SizedBox(
              height: 40,
            ),
            const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/2048px-User-avatar.svg.png'),
              radius: 30,
              backgroundColor: Colors.white,
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                focusNode: emailFocusNode,
                controller: emailController,
                decoration: InputDecoration(
                    hintText: 'Email',
                    prefixIcon: const Icon(
                      Icons.email,
                      color: Color.fromARGB(255, 235, 233, 233),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.amber),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.amber),
                    )),
                onFieldSubmitted: (value) {
                  // Focus.of(context).requestFocus(passwordFocusNode);
                  Utilities.fieldFocusChange(
                      context, emailFocusNode, passwordFocusNode);
                },
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: ValueListenableBuilder(
                    valueListenable: _obsecurePassword,
                    builder: (context, value, child) {
                      return TextFormField(
                        focusNode: passwordFocusNode,
                        controller: passwordController,
                        obscureText: _obsecurePassword.value,
                        decoration: InputDecoration(
                            hintText: 'Password',
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Color.fromARGB(255, 235, 233, 233),
                            ),
                            suffixIcon: InkWell(
                              onTap: () {
                                _obsecurePassword.value =
                                    !_obsecurePassword.value;
                              },
                              child: Icon(
                                _obsecurePassword.value
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: const Color.fromARGB(255, 235, 233, 233),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.amber),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.amber),
                            )),
                      );
                    })),
            ReusableBotton(
                loading: authViewModel.loading,
                title: 'Login',
                onPress: () {
                  if (emailController.text.isEmpty) {
                    Utilities.flushBarErrorMessage(
                        'Please enter email address.', context);
                  } else if (passwordController.text.isEmpty) {
                    Utilities.flushBarErrorMessage(
                        'Please enter password.', context);
                  } else if (passwordController.text.length < 6) {
                    Utilities.flushBarErrorMessage(
                        'Password must be of 6 letter.', context);
                  } else {
                    Map data = {
                      'email': emailController.text.toString(),
                      'password': passwordController.text.toString(),
                    };
                    authViewModel.loginApi(data, context);

                    if (kDebugMode) {
                      print('success');
                    }
                  }
                }),
            const SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {
                // Navigator.pushReplacementNamed(context, RoutesName.register);
              },
              child: const Text("Don't have an account ? Register now."),
            )
          ],
        ),
      ),
    );
  }
}

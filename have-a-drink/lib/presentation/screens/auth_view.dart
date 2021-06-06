import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:have_a_drink/application/providers/auth_state_notifier_provider.dart';
import 'package:have_a_drink/application/providers/authviewmodel_provider.dart';
import 'package:have_a_drink/domain/entity/auth_state.dart';
import 'package:have_a_drink/presentation/components/button_1.dart';
import 'package:have_a_drink/presentation/components/button_text.dart';

class AuthView extends StatefulWidget {
  AuthView();

  @override
  _AuthViewState createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  DisplyedScreen displayedScreen = DisplyedScreen.login;

  StreamSubscription? streamSubscription;

  @override
  void initState() {
    super.initState();
    final viewModel = context.read(authViewModelProvider);

    // Message
    streamSubscription = viewModel.messageStream?.listen((message) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message)));
    });
  }

  @override
  void dispose() {
    streamSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ProviderListener(
      provider: authStateNotifierProvider,
      onChange: (context, authState) {
        if (authState is UserLoggedIn) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            // Message
            /*Builder(builder: (context) {
              streamSubscription = viewModel.messageStream?.listen((message) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(message)));
              });
              return SizedBox.shrink();
            }),*/

            displayedScreen == DisplyedScreen.login
                ? _LoginScreen()
                : _RegisterScreen(),
            // witch screen button
            Align(
              alignment: Alignment(0, 0.9),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    displayedScreen == DisplyedScreen.login
                        ? "I don't have an account ? "
                        : "I already have an account ? ",
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          displayedScreen == DisplyedScreen.login
                              ? displayedScreen = DisplyedScreen.register
                              : displayedScreen = DisplyedScreen.login;
                        });
                      },
                      child: Text(
                        displayedScreen == DisplyedScreen.login
                            ? "register"
                            : "login",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            ?.copyWith(color: Colors.black87),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum DisplyedScreen { login, register }

// Login Screen
class _LoginScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  _LoginScreen();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read(authViewModelProvider);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 60),
      child: Stack(
        children: [
          // Inputs
          Form(
            key: formKey,
            child: Column(
              children: [
                // Title
                Align(
                  alignment: Alignment.topLeft,
                  child: RichText(
                    text: TextSpan(
                        text: 'Welcome,\nhere you can ',
                        style: Theme.of(context).textTheme.headline4,
                        children: [
                          TextSpan(
                              text: 'login',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4
                                  ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary))
                        ]),
                  ),
                ),
                SizedBox(height: 50),

                // Address email
                inputText(
                  context: context,
                  hintText: 'Email',
                  controller: viewModel.loginEmailController,
                  icon: Icons.email,
                  validator: (String? str) {
                    return str?.contains('@') ?? false
                        ? null
                        : 'Enter a valide email address';
                  },
                ),
                // Password
                inputText(
                  context: context,
                  hintText: 'Password',
                  obscure: true,
                  controller: viewModel.loginPasswordController,
                  icon: Icons.lock_outline_rounded,
                  validator: (String? str) {
                    return (str?.length ?? 0) > 0 ? null : 'Enter a password';
                  },
                ),
              ],
            ),
          ),

          Align(
            alignment: Alignment(0, 0.6),
            child: ButtonText(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    viewModel.login();
                  }
                },
                text: 'login'),
          ),
        ],
      ),
    );
  }
}

// Register Screen
class _RegisterScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  _RegisterScreen();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read(authViewModelProvider);

    return Stack(
      children: [
        // Inputs
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 60),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                //Title
                Align(
                  alignment: Alignment.topLeft,
                  child: RichText(
                    text: TextSpan(
                        text: 'Not yet ',
                        style: Theme.of(context).textTheme.headline4,
                        children: [
                          TextSpan(
                              text: 'registered ?',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4
                                  ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary))
                        ]),
                  ),
                ),
                SizedBox(height: 50),
                // Address email
                inputText(
                  context: context,
                  hintText: 'Email...',
                  controller: viewModel.registerEmailController,
                  icon: Icons.email,
                  validator: (String? str) {
                    return str?.contains('@') ?? false
                        ? null
                        : 'Enter a valid email address';
                  },
                ),

                // Password
                inputText(
                  context: context,
                  hintText: 'Password...',
                  obscure: true,
                  controller: viewModel.registerPasswordController,
                  icon: Icons.lock_outline_rounded,
                  validator: (String? str) {
                    return (str?.length ?? 0) > 0
                        ? null
                        : 'Entrez un mot de passe';
                  },
                ),
                // Password
                inputText(
                  context: context,
                  hintText: 'Repeat the password...',
                  obscure: true,
                  controller: viewModel.registerRepeatedPasswordController,
                  icon: Icons.lock_outline_rounded,
                  validator: (String? str) {
                    return str == viewModel.registerPasswordController.text
                        ? null
                        : 'The passwords do not correspond';
                  },
                ),
              ],
            ),
          ),
        ),

        Align(
          alignment: Alignment(0, 0.6),
          child: ButtonText(
            onTap: () {
              if (formKey.currentState!.validate()) {
                viewModel.register();
              }
            },
            text: 'register',
          ),
        )
      ],
    );
  }
}

Widget inputText({
  bool obscure = false,
  @required TextEditingController? controller,
  @required String hintText = '',
  @required IconData icon = Icons.description,
  @required String? Function(String?)? validator,
  @required BuildContext? context,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: TextFormField(
        controller: controller,
        style: Theme.of(context!).textTheme.bodyText1,
        obscureText: obscure,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            fillColor: Theme.of(context).cardColor,
            filled: true,
            hintText: hintText,
            /*prefixIcon: Icon(
              icon,
              color: kTextColor,
            ),*/
            hintStyle: Theme.of(context).textTheme.bodyText1,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide.none)),
        validator: validator),
  );
}

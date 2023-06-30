import 'package:flutter/material.dart';
import 'package:mvvm/res/components/round_button.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ValueNotifier<bool> _obsecurePassword = ValueNotifier(true);
  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _obsecurePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewMode = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
                keyboardType: TextInputType.emailAddress,
                focusNode: emailFocus,
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email, nerd!',
                  prefixIcon: Icon(
                    Icons.email_outlined,
                  ),
                ),
                onFieldSubmitted: (value) {
                  Utils.focusChange(
                    context,
                    emailFocus,
                    passwordFocus,
                  );
                }),
            ValueListenableBuilder(
                valueListenable: _obsecurePassword,
                builder: (context, value, child) {
                  return TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    focusNode: passwordFocus,
                    controller: _passwordController,
                    obscureText: _obsecurePassword.value,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter your password, nerd!',
                      prefixIcon: const Icon(
                        Icons.lock_outline,
                      ),
                      suffixIcon: InkWell(
                          onTap: () {
                            _obsecurePassword.value = !_obsecurePassword.value;
                          },
                          child: _obsecurePassword.value
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility)),
                    ),
                  );
                }),
            SizedBox(
              height: height * .1,
            ),
            RoundButton(
                title: 'Login',
                loading: authViewMode.loading,
                onPress: () {
                  if (_emailController.text.isEmpty) {
                    Utils.FlushbarErrorMessage("Enter email please", context);
                  } else if (_passwordController.text.isEmpty) {
                    Utils.FlushbarErrorMessage(
                        "Enter password please", context);
                  } else if (_passwordController.text.length < 6) {
                    Utils.FlushbarErrorMessage(
                        "Password length is short", context);
                  } else {
                    Map data = {
                      'email': _emailController.text.toString(),
                      'password': _passwordController.text.toString(),
                    };
                    authViewMode.loginApi(data, context);
                  }
                }),
          ],
        ),
      ),
    );
  }
}

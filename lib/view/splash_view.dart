import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mvvm/view_model/splash_services/splash_services.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashServices sp = SplashServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      sp.userAuthentication(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Splash Splash Screen",
              style: TextStyle(fontSize: 24),
            ),
          )
        ],
      ),
    );
  }
}

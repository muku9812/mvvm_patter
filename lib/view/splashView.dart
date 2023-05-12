import 'package:flutter/material.dart';

import '../viewModel/services/splashViewServices.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashServices splashServices = SplashServices();
  @override
  void initState() {
    super.initState();
    splashServices.chechAuthentication(context);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "SplashScreen",
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}

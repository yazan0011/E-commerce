import 'package:e_co/app/modules/onboarding/onboarding_view.dart';
import 'package:e_co/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => OnboardingView()));
      },
    );
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [AppColors.primary, Color.fromARGB(255, 180, 153, 142)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Styliq',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 44,
                    fontFamily: 'Caveat',
                    letterSpacing: 0),
              )
            ],
          ),
        ),
      ),
    );
  }
}

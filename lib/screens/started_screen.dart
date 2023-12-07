import 'package:flutter/material.dart';
import 'package:ease_neura/screens/signin_screen.dart';

class StartedScreen extends StatelessWidget {
  const StartedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: StartedScreenBody(),
    );
  }
}

class StartedScreenBody extends StatelessWidget {
  const StartedScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Image.asset('assets/images/white_background.png'),
        const SafeArea(
          child: Center(
            child: StartedScreenContent(),
          ),
        ),
      ],
    );
  }
}

class StartedScreenContent extends StatelessWidget {
  const StartedScreenContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;
    double horizontalPadding = 90;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (platform == TargetPlatform.iOS) ...{
          const SizedBox(height: 290),
          const LogoEaseneura(),
          const SizedBox(height: 250),
        } else ...{
          const SizedBox(height: 230),
          const LogoEaseneura(),
          const SizedBox(height: 200),
        },
        GetStartedButton(horizontalPadding: horizontalPadding),
      ],
    );
  }
}

class LogoEaseneura extends StatelessWidget {
  const LogoEaseneura({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Image(
      image: AssetImage('assets/images/logo_easeneura.png'),
      height: 120,
    );
  }
}

class GetStartedButton extends StatelessWidget {
  final double horizontalPadding;

  const GetStartedButton({Key? key, required this.horizontalPadding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SigninScreen(),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: 10,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.0),
          side: const BorderSide(color: Colors.black, width: 1),
        ),
      ),
      child: const Text(
        "Get Started",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ease_neura/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SigninScreen(),
    );
  }
}

class SigninScreen extends StatelessWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SigninForm(),
        ),
      ),
    );
  }
}

class SigninForm extends StatelessWidget {
  const SigninForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 120),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Logo(),
          const SizedBox(height: 10),
          RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: const <TextSpan>[
                TextSpan(
                  text: "Let's get started! ",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: "Create your account here.",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            label: "Email, phone & username",
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: "Email, phone & username",
            ),
            validator: (value) {
              return null;
              // Add validation logic if needed
            },
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            label: "Password",
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: "Password",
            ),
            obscureText: true,
            validator: (value) {
              return null;
              // Add validation logic if needed
            },
          ),
          const SizedBox(height: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AnimatedSignupButton(
                text: "Sign Up",
                backgroundColor: Colors.black,
                textColor: Colors.white,
                onPressed: () => navigateToHome(context),
                buttonWidth: 200,
              ),
              const SizedBox(height: 8),
              const DividerWithText(text: "or"),
              const SizedBox(height: 8),
              AnimatedSignupButton(
                text: "Sign Up with Google",
                backgroundColor: Colors.white,
                textColor: Colors.black,
                onPressed: () => navigateToHome(context),
                leftIcon: Image.asset(
                  'assets/images/google_logo.png',
                  height: 20,
                ),
                buttonWidth: 200,
              ),
              const SizedBox(height: 8),
              AnimatedSignupButton(
                text: "Sign Up with Apple",
                backgroundColor: Colors.white,
                textColor: Colors.black,
                onPressed: () => navigateToHome(context),
                leftIcon: Image.asset(
                  'assets/images/apple_logo.png',
                  height: 21,
                ),
                buttonWidth: 200,
              ),
              const SizedBox(height: 8),
              AnimatedSignupButton(
                text: "Sign Up with Facebook",
                backgroundColor: Colors.white,
                textColor: Colors.black,
                onPressed: () => navigateToHome(context),
                leftIcon: Image.asset(
                  'assets/images/facebook_logo.png',
                  height: 20,
                ),
                buttonWidth: 200,
              ),
            ],
          ),
          const SizedBox(height: 63),
        ],
      ),
    );
  }

  void navigateToHome(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ),
    );
  }
}

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/logo_easeneura.png',
      height: 100,
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  final String label;
  final InputDecoration decoration;
  final bool obscureText;
  final String? Function(String?)? validator;

  const CustomTextFormField({
    required this.label,
    required this.decoration,
    this.obscureText = false,
    this.validator,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3.5),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
      ),
      child: TextFormField(
        decoration: decoration,
        obscureText: obscureText,
        validator: validator,
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Widget? leftIcon;
  final Color textColor;
  final Color backgroundColor;
  final double buttonWidth;

  const CustomButton({
    required this.text,
    this.onPressed,
    this.leftIcon,
    required this.textColor,
    required this.backgroundColor,
    required this.buttonWidth,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: buttonWidth,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            if (leftIcon != null) leftIcon!,
            if (leftIcon != null) const SizedBox(width: 8),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  color: textColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(width: leftIcon != null ? 8 : 0),
          ],
        ),
      ),
    );
  }
}

class SignupButton extends StatelessWidget {
  const SignupButton(
      {Key? key, required this.buttonWidth, required this.onPressed})
      : super(key: key);

  final double buttonWidth;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: "Sign Up",
      backgroundColor: Colors.black,
      textColor: Colors.white,
      onPressed: onPressed,
      buttonWidth: buttonWidth,
    );
  }
}

class SignupWithGoogleButton extends StatelessWidget {
  const SignupWithGoogleButton({
    Key? key,
    required this.textColor,
    required this.backgroundColor,
    required this.buttonWidth,
    required this.onPressed,
  }) : super(key: key);

  final Color textColor;
  final Color backgroundColor;
  final double buttonWidth;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: "Sign Up with Google",
      backgroundColor: backgroundColor,
      textColor: textColor,
      onPressed: onPressed,
      leftIcon: Image.asset(
        'assets/images/google_logo.png',
        height: 20,
      ),
      buttonWidth: buttonWidth,
    );
  }
}

class SignupWithAppleButton extends StatelessWidget {
  const SignupWithAppleButton({
    Key? key,
    required this.textColor,
    required this.backgroundColor,
    required this.buttonWidth,
    required this.onPressed,
  }) : super(key: key);

  final Color textColor;
  final Color backgroundColor;
  final double buttonWidth;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: "Sign Up with Apple",
      backgroundColor: backgroundColor,
      textColor: textColor,
      onPressed: onPressed,
      leftIcon: Image.asset(
        'assets/images/apple_logo.png',
        height: 21,
      ),
      buttonWidth: buttonWidth,
    );
  }
}

class SignupWithFacebookButton extends StatelessWidget {
  const SignupWithFacebookButton({
    Key? key,
    required this.textColor,
    required this.backgroundColor,
    required this.buttonWidth,
    required this.onPressed,
  }) : super(key: key);

  final Color textColor;
  final Color backgroundColor;
  final double buttonWidth;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: "Sign Up with Facebook",
      backgroundColor: backgroundColor,
      textColor: textColor,
      onPressed: onPressed,
      leftIcon: Image.asset(
        'assets/images/facebook_logo.png',
        height: 20,
      ),
      buttonWidth: buttonWidth,
    );
  }
}

class DividerWithText extends StatelessWidget {
  final String text;

  const DividerWithText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          const Expanded(
            child: Divider(
              color: Colors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Expanded(
            child: Divider(
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class AnimatedSignupButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final Widget? leftIcon;
  final Color textColor;
  final Color backgroundColor;
  final double buttonWidth;

  const AnimatedSignupButton({
    required this.text,
    this.onPressed,
    this.leftIcon,
    required this.textColor,
    required this.backgroundColor,
    required this.buttonWidth,
    Key? key,
  }) : super(key: key);

  @override
  _AnimatedSignupButtonState createState() => _AnimatedSignupButtonState();
}

class _AnimatedSignupButtonState extends State<AnimatedSignupButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      onTapDown: (details) {
        setState(() {
          isPressed = true;
        });
      },
      onTapCancel: () {
        setState(() {
          isPressed = false;
        });
      },
      onTapUp: (details) {
        setState(() {
          isPressed = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: widget.buttonWidth,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isPressed ? Colors.grey : widget.backgroundColor,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            if (widget.leftIcon != null) widget.leftIcon!,
            if (widget.leftIcon != null) const SizedBox(width: 8),
            Expanded(
              child: Text(
                widget.text,
                style: TextStyle(
                  color: widget.textColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(width: widget.leftIcon != null ? 8 : 0),
          ],
        ),
      ),
    );
  }
}

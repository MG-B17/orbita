import 'package:flutter/material.dart';
import '../../../../../core/utils/widgets/auth_logo.dart';
import '../../../../../core/utils/widgets/background_image.dart';
import '../../../sign_up/presentation/widgets/sign_up_form.dart';
import '../widgets/login_form.dart';


class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundImage(),
          SafeArea(
            child: AuthHeaderWithTabs(
              signUpContent:SignUpForm(),
              signInContent: LoginForm(),
            ),
          ),
        ],
      ),
    );
  }
}
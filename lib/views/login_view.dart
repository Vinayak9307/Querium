import 'package:flutter/material.dart';
import 'package:querium/activities/studentHomeScreen.dart';
import 'package:querium/utils/global_colors.dart';
import 'package:querium/views/signup_view.dart';
import 'package:querium/views/widgets/button_global.dart';
import 'package:querium/views/widgets/text_field_global.dart';

import '../resources/auth_methods.dart';
import '../utils/utils.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  bool isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void loginUser() async {
    setState(() {
      isLoading = true;
    });
    String res = await AuthMethods().loginUser(
      email: _emailController.text,
      password: _passwordController.text,
    );
    setState(() {
      isLoading = false;
    });
    if (res != "Log In Success") {
      // ignore: use_build_context_synchronously
      showSnackBar(context, res);
    } else {
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const StudentHomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Container(
          //color: Colors.black,
          width: double.infinity,
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 35,
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  "Querium",
                  style: TextStyle(
                    color: GlobalColor.mainColor,
                    fontSize: 45,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                "Login to your account",
                style: TextStyle(
                  color: GlobalColor.textColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              TextFormGlobal(
                controller: _emailController,
                text: 'Email',
                obscure: false,
                textInputType: TextInputType.emailAddress,
                icon: Icons.email,
              ),
              const SizedBox(
                height: 40,
              ),
              TextFormGlobal(
                controller: _passwordController,
                text: 'Password',
                obscure: true,
                textInputType: TextInputType.text,
                icon: Icons.lock,
              ),
              const SizedBox(
                height: 60,
              ),
              ButtonGlobal(
                text: "Sign In",
                onTap: loginUser,
                isLoading: isLoading,
              ),
            ],
          ),
        )),
      ),
      bottomNavigationBar: Container(
        height: 50,
        color: Colors.white,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Don't have an account ? ",
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUpView()),
                );
              },
              child: Text(
                "Sign Up",
                style: TextStyle(
                  color: GlobalColor.mainColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:querium/utils/global_colors.dart';
import 'package:querium/views/widgets/button_global.dart';
import 'package:querium/views/widgets/text_field_global.dart';

class LoginViewAdmin extends StatefulWidget {
  const LoginViewAdmin({super.key});

  @override
  State<LoginViewAdmin> createState() => _LoginViewAdminState();
}

class _LoginViewAdminState extends State<LoginViewAdmin> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
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
                controller: emailController,
                text: 'Email',
                obscure: false,
                textInputType: TextInputType.emailAddress,
                icon: Icons.email,
              ),
              const SizedBox(
                height: 40,
              ),
              TextFormGlobal(
                controller: passwordController,
                text: 'Password',
                obscure: true,
                textInputType: TextInputType.text,
                icon: Icons.lock,
              ),
              const SizedBox(
                height: 60,
              ),
              const ButtonGlobal(
                text: "Sign In",
              ),
            ],
          ),
        )),
      ),
      // bottomNavigationBar: Container(
      //   height: 50,
      //   color: Colors.white,
      //   alignment: Alignment.center,
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       const Text(
      //         "Don\'t have an account ? ",
      //       ),
      //       InkWell(
      //         onTap: () {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(builder: (context) => SignUpView()),
      //           );
      //         },
      //         child: Text(
      //           "Sign Up",
      //           style: TextStyle(
      //             color: GlobalColor.mainColor,
      //             fontWeight: FontWeight.bold,
      //           ),
      //         ),
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}
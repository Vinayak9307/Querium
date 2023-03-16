import 'package:flutter/material.dart';
import 'package:querium/utils/global_colors.dart';
import 'package:querium/views/widgets/button_global.dart';
import 'package:querium/views/widgets/text_field_global.dart';
import 'package:querium/resources/auth_methods.dart';

import '../utils/utils.dart';
import 'login_view.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void signUpUser() async {
    setState(() {
      isLoading = true;
    });
    String res = await AuthMethods().signUpUser(
      email: _emailController.text,
      password: _passwordController.text,
      username: "vinayak",
    );
    setState(() {
      isLoading = false;
    });
    if (res != "Sign Up Success") {
      // ignore: use_build_context_synchronously
      showSnackBar(context, res);
    } else {
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginView()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
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
                height: 13,
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
                "Create your account",
                style: TextStyle(
                  color: GlobalColor.textColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 40,
              ),

              //Email Box
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

              //Password Box
              TextFormGlobal(
                controller: _passwordController,
                text: 'Password',
                obscure: true,
                textInputType: TextInputType.text,
                icon: Icons.lock,
              ),
              const SizedBox(
                height: 40,
              ),

              //Confirm Password Box
              TextFormGlobal(
                controller: _confirmPasswordController,
                text: 'Confirm Password',
                obscure: true,
                textInputType: TextInputType.text,
                icon: Icons.lock,
              ),
              const SizedBox(
                height: 60,
              ),
              ButtonGlobal(
                text: "Sign Up",
                onTap: signUpUser,
                isLoading: isLoading,
              ),
            ],
          ),
        )),
      ),
    );
  }
}

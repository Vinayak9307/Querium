import 'package:flutter/material.dart';
import 'package:querium/utils/global_colors.dart';
import 'package:querium/views/widgets/button_global.dart';
import 'package:querium/views/widgets/text_field_global.dart';

class SignUpView extends StatefulWidget {
 const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: const Icon( Icons.arrow_back_ios, color: Colors.black,  ),
          onTap: () {
            Navigator.pop(context);
          } ,
        ) ,
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
                const SizedBox(height: 13,),
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
                const SizedBox(height: 50,),
                Text(
                  "Create your account",
                  style: TextStyle(
                    color: GlobalColor.textColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 40,),
                TextFormGlobal(
                  controller: emailController,
                  text: 'Email',
                  obscure: false,
                  textInputType: TextInputType.emailAddress,
                  icon: Icons.email,
                ),
                const SizedBox(height: 40,),
                TextFormGlobal(
                  controller: passwordController,
                  text: 'Password',
                  obscure: true,
                  textInputType: TextInputType.text,
                  icon: Icons.lock,
                ),
                const SizedBox(height: 40,),
                TextFormGlobal(
                  controller: confirmPasswordController,
                  text: 'Confirm Password',
                  obscure: true,
                  textInputType: TextInputType.text,
                  icon: Icons.lock,
                ),
                const SizedBox(height: 60,),
                const ButtonGlobal(text: "Sign Up",),
              ],
            ),
          )
        ),
      ),
    );
  }
}
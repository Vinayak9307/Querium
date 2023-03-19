import 'dart:math';

import 'package:flutter/material.dart';
import 'package:querium/views/widgets/button_global.dart';
import 'package:querium/resources/auth_methods.dart';

import '../../utils/drop_down_items.dart';
import '../../utils/global_colors.dart';
import '../../utils/utils.dart';
import 'login_view_admin.dart';

class SignUpViewAdmin extends StatefulWidget {
  const SignUpViewAdmin({super.key});

  @override
  State<SignUpViewAdmin> createState() => _SignUpViewAdminState();
}

class _SignUpViewAdminState extends State<SignUpViewAdmin> {
  String? email = "";
  String? username = "";
  String? password = "";
  String? confirmPassword = "";
  String? category = "";

  final formKey = GlobalKey<FormState>();

  bool isLoading = false;

  void signUpUser() async {
    setState(() {
      isLoading = true;
    });
    String res = await AuthMethods().signUpAdmin(
      email: email!,
      password: password!,
      username: username!,
      category: category!,
    );
    setState(() {
      isLoading = false;
    });
    if (res != "Sign Up Success") {
      // ignore: use_build_context_synchronously
      showSnackBar(context, res);
    } else {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginViewAdmin()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onTap: () => {
            FocusScope.of(context).requestFocus(
              FocusNode(),
            ),
          },
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Container(
                padding: const EdgeInsets.only(left: 18, right: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 50,
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
                      "Add a new account",
                      style: TextStyle(
                        color: GlobalColor.textColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      minLines: 1,
                      maxLines: 1,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Username can't be left empty.";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          username = value;
                        });
                      },
                      decoration: InputDecoration(
                        prefixIcon: const Align(
                          heightFactor: 1.0,
                          widthFactor: 1.0,
                          child: Icon(Icons.person_2_outlined),
                        ),
                        hintText: "Username",
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 159, 158, 158),
                            width: 1.1,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 159, 158, 158),
                            width: 1.1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 159, 158, 158),
                            width: 1.1,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 159, 158, 158),
                            width: 1.1,
                          ),
                        ),
                        contentPadding: const EdgeInsets.only(top: 13, left: 8),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      minLines: 1,
                      maxLines: 1,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Email can't be left empty.";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                      decoration: InputDecoration(
                        prefixIcon: const Align(
                          heightFactor: 1.0,
                          widthFactor: 1.0,
                          child: Icon(Icons.email_outlined),
                        ),
                        hintText: "Email",
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 159, 158, 158),
                            width: 1.1,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 159, 158, 158),
                            width: 1.1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 159, 158, 158),
                            width: 1.1,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 159, 158, 158),
                            width: 1.1,
                          ),
                        ),
                        contentPadding: const EdgeInsets.only(top: 13, left: 8),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      minLines: 1,
                      maxLines: 1,
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password can't be left empty.";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                      decoration: InputDecoration(
                        prefixIcon: const Align(
                          heightFactor: 1.0,
                          widthFactor: 1.0,
                          child: Icon(Icons.password_outlined),
                        ),
                        hintText: "Password",
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 159, 158, 158),
                            width: 1.1,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 159, 158, 158),
                            width: 1.1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 159, 158, 158),
                            width: 1.1,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 159, 158, 158),
                            width: 1.1,
                          ),
                        ),
                        contentPadding: const EdgeInsets.only(top: 13, left: 8),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      minLines: 1,
                      maxLines: 1,
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty || value.toString() != password) {
                          return "Password don't match";
                        }
                        return null;
                      },
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        prefixIcon: const Align(
                          heightFactor: 1.0,
                          widthFactor: 1.0,
                          child: Icon(Icons.key_outlined),
                        ),
                        hintText: "Confirm Password",
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 159, 158, 158),
                            width: 1.1,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 159, 158, 158),
                            width: 1.1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 159, 158, 158),
                            width: 1.1,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 159, 158, 158),
                            width: 1.1,
                          ),
                        ),
                        contentPadding: const EdgeInsets.only(top: 13, left: 8),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    DropdownButtonFormField<String>(
                      items: categories,
                      menuMaxHeight: 200,
                      elevation: 0,
                      decoration: InputDecoration(
                        hintText: "Category",
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 159, 158, 158),
                            width: 1.1,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 159, 158, 158),
                            width: 1.1,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 159, 158, 158),
                            width: 1.1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 159, 158, 158),
                            width: 1.1,
                          ),
                        ),
                      ),
                      //width: MediaQuery.of(context).size.width*0.91,
                      validator: (value) =>
                          value == null ? "Please select a category" : null,
                      onChanged: (value) {
                        setState(() {
                          category = value;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    ButtonGlobal(
                      text: "Sign Up",
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          signUpUser();
                        }
                      },
                      isLoading: isLoading,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:querium/views/about_page_view.dart';
import 'package:querium/views/comment_box.dart';
import 'package:querium/views/student_home_screen.dart';
import 'package:querium/providers/user_provider.dart';
import 'package:querium/views/login_view.dart';
import 'package:querium/views/onboarding.dart';
import 'package:querium/views/signup_view.dart';
import 'package:querium/views/splash_view.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Querium',
        routes: {
          '/onBoard': (context) => const OnBoarding(),
          '/login': (context) => const LoginView(),
          '/signup': (context) => const SignUpView(),
          '/stHomeScreen': (context) => const StudentHomeScreen(),
        },
        theme: ThemeData(
          fontFamily: GoogleFonts.poppins().fontFamily,
          scaffoldBackgroundColor: Colors.white,
        ),
        debugShowCheckedModeBanner: false,
        home:  splashView(),
      ),
    );
  }
}

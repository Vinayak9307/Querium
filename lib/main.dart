import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:querium/providers/admin_provider.dart';
import 'package:querium/providers/user_provider.dart';
import 'package:querium/views/admin/login_view_admin.dart';
import 'package:querium/views/onboarding.dart';
import 'package:querium/views/splash_view.dart';
import 'package:provider/provider.dart';
import 'package:querium/views/user/login_view.dart';
import 'package:querium/views/user/notification_view.dart';
import 'package:querium/views/user/querry_detail.dart';
import 'package:querium/views/user/signup_view.dart';
import 'package:querium/views/user/student_home_screen.dart';

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
        ChangeNotifierProvider(
          create: (_) => AdminProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Querium',
        routes: {
          '/onBoard': (context) => const OnBoarding(),
          '/login': (context) => const LoginView(),
          '/signup': (context) => const SignUpView(),
          '/stHomeScreen': (context) => const StudentHomeScreen(),
          '/loginAdmin': (context) => const LoginViewAdmin(),
        },
        theme: ThemeData(
          fontFamily: GoogleFonts.poppins().fontFamily,
          scaffoldBackgroundColor: Colors.white,
        ),
        debugShowCheckedModeBanner: false,
        home: const splashView(),
        
      ),
    );
  }
}
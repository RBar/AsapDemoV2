// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:google_fonts/google_fonts.dart';

// Project imports:
import 'package:asapdemo/ui/screens/home.dart';
import 'package:asapdemo/ui/screens/landing.dart';
import 'package:asapdemo/ui/screens/login.dart';
import 'package:asapdemo/ui/screens/order.dart';
import 'package:asapdemo/ui/screens/signup.dart';
import 'package:asapdemo/ui/screens/splash.dart';
import 'package:asapdemo/ui/shared/auth/forgot_password/forgot_password_page.dart';

class Myapp extends StatelessWidget {
  const Myapp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Asap Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        iconTheme: Theme.of(context).iconTheme.copyWith(
              color: Colors.white,
            ),
        textTheme: GoogleFonts.ralewayTextTheme(
          Theme.of(context).textTheme.apply(
                bodyColor: Colors.white,
                displayColor: Colors.white,
              ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/landing': (context) => const LandingScreen(),
        '/home': (context) => const HomeScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/order': (context) => const OrderScreen(),
        '/forgot': (context) => const ForgotPasswordScreen(),
      },
    );
  }
}

import 'package:ecommerce_project/core/store.dart';
import 'package:ecommerce_project/pages/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'pages/home.dart';
import 'pages/login_page.dart';
// import 'package:google_fonts/google_fonts.dart';
import '/utils/routes.dart';
import 'widgets/themes.dart';

void main() {
  runApp(VxState(store: MyStore(),
  child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => const LoginPage(),
        MyRoutes.homeRoute: (context) => const HomePage(),
        MyRoutes.loginRoute: (context) => const LoginPage(),
        MyRoutes.cartRoute: (context) => const CartPage(),
      },
    );
  }
}

// import 'package:cookie_jar/generate_quotes.dart';
// import 'package:flutter/material.dart';

// class SplashScreen extends StatefulWidget {
//   final Widget? child;

//   const SplashScreen({super.key, this.child});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     Future.delayed(const Duration(seconds: 6), () {
//       Navigator.pushAndRemoveUntil(
//         context,
//         MaterialPageRoute(builder: (context) => (CookieJar())),
//         (route) => false,
//       );
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Image.asset(
//           'assets/images/Cookie Bites.png',
//           width: 400,
//           height: 400,
//         ),
//       ),
//     );
//   }
// }

import 'package:cookie_jar/screens/home_page.dart';
import 'package:cookie_jar/screens/sign_up_page.dart';
import 'package:cookie_jar/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:cookie_jar/screens/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyBtkE9UUOTRVsYRlafw-U-H7vwKE2Jw89o",
        appId: "1:112443059158:android:8a028cfcaf7bb2d9dcd277",
        messagingSenderId: "112443059158",
        projectId: "cookie-jar-f77ca",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cookie Jar',
      home: SplashScreen(
        child: LoginPage(),
      ),
      routes: {
        '/': (context) => SplashScreen(
              child: LoginPage(),
            ),
        '/login': (context) => LoginPage(),
        '/signUp': (context) => SignUpPage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}



// Future main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   if (kIsWeb) {
//     await Firebase.initializeApp(
//       options: FirebaseOptions(
//         apiKey: "AIzaSyBtkE9UUOTRVsYRlafw-U-H7vwKE2Jw89o",
//         appId: "1:112443059158:android:8a028cfcaf7bb2d9dcd277",
//         messagingSenderId: "112443059158",
//         projectId: "cookie-jar-f77ca",
//       ),
//     );
//   } else {
//     await Firebase.initializeApp();
//   }
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Cookie Jar',
//       home: SplashScreen(
//         child: LoginPage(),
//       ),
//       routes: {
//         '/': (context) => SplashScreen(
//               child: LoginPage(),
//             ),
//         '/login': (context) => LoginPage(),
//         '/signUp': (context) => SignUpPage(),
//         '/home': (context) => HomePage(),
//       },
//     );
//   }
// }




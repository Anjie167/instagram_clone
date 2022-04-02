import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/signup_screen.dart';
import 'package:instagram_clone/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBP1PHtAhuJuisdKvmbqPWMlCvmWR19XCg",
            //authDomain: "instagram-clone-c0800.firebaseapp.com",
            projectId: "instagram-clone-c0800",
            storageBucket: "instagram-clone-c0800.appspot.com",
            messagingSenderId: "824159911524",
            appId: "1:824159911524:web:e22b0f98a6b6bb4d432971"
        ));

  }else{
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      title: 'Instagram clone',
      // home: const ResponsiveLayout(
      //   webScreenLayout: WebScreenLayout(),
      //   mobileScreenLayout: MobileScreenLayout(),
      // ),
      home: const SignupScreen(),
    );
  }
}

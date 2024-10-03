import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/Responsive_UI/mobile_screen_layout.dart';
import 'package:instagram_clone/Responsive_UI/responsive_layout_screen.dart';
import 'package:instagram_clone/Responsive_UI/web_screen_layout.dart';
import 'package:instagram_clone/screens/login_screen.dart';
import 'package:instagram_clone/screens/signup_screen.dart';
import 'package:instagram_clone/utlis/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyATqj_Z6lUO8kS90WYLOwNL84dDSI5AYUA',
        appId: '1:781581390170:web:7e8a5a937ad3a684176363',
        messagingSenderId: '781581390170',
        projectId: 'intsagram-clone-4918f',
        storageBucket: 'intsagram-clone-4918f.appspot.com',
      ),
    );
  }else{
    Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram Clone',
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
      home: SignUpScreen()//
      // LoginScreen() //ResponsiveLayoutScreen(
        //mobilescreenLayout: MobileScreenLayout(),
        //webscreenLayout: WebScreenLayout(),
    );
  }
}

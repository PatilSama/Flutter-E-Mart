import 'package:flutter_emart/consts/consts.dart';
import 'package:flutter_emart/views/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) {
    print(" Firebase Initialized $value");
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        iconTheme: IconThemeData(color: darkFontGrey),
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          // titleTextStyle: TextStyle(color: Colors.pink, fontSize: 30),
        ),
        fontFamily: regular,
      ),
      home: SplashScreen(),
    );
  }
}

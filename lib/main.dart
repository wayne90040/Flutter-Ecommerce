import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/routes.dart';
import 'package:flutter_ecommerce/screen/splash/splash_screen.dart';
import 'package:flutter_ecommerce/viewmodels/sign_up_view_model.dart';
import 'package:flutter_ecommerce/widget/theme.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  // For Firebase init
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Run App
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      // home: SplashScreen(),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => SignUpViewModel()),
        ],
        child: SplashScreen(),
      ),
      initialRoute: SplashScreen.routeName,  // Note: 需要確保沒有同時設有 home 屬性
      routes: routes,
    );
  }
}
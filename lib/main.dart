import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/share_preference_manager.dart';
import 'package:flutter_ecommerce/routes.dart';
import 'package:flutter_ecommerce/screen/home/home_screen.dart';
import 'package:flutter_ecommerce/screen/splash/splash_screen.dart';
import 'package:flutter_ecommerce/size_config.dart';
import 'package:flutter_ecommerce/viewmodels/home_view_model.dart';
import 'package:flutter_ecommerce/viewmodels/sign_up_view_model.dart';
import 'package:flutter_ecommerce/widget/theme.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  // For Firebase init
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  String email = await SharePreferenceManager.get(SharePreferenceKey.email);

  // Run App
  runApp(MyApp(email: email,));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final String email;

  const MyApp({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(email);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      // home: SplashScreen(),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => SignUpViewModel()),
          ChangeNotifierProvider(create: (context) => HomeViewModel())
        ],
        child: (email != "" ? HomeScreen() : SplashScreen()),
      ),
      // initialRoute: SplashScreen.routeName,  // Note: 需要確保沒有同時設有 home 屬性
      routes: routes,
    );
  }
}
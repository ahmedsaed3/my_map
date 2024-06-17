import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_maps/presentation/app_router.dart';
import 'package:my_maps/presentation/screens/login_screen.dart';
import 'constants/strings.dart';

late String initialRout;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseAuth.instance.authStateChanges().listen((user) {
    if (user == null) {
      initialRout = loginScreen;
    } else {
      initialRout = mapScreen;
    }
  });
  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  final FlutterLocalization localization = FlutterLocalization.instance;

  final AppRouter appRouter;

  MyApp({super.key, required this.appRouter});

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRouter,
      initialRoute: initialRout,
    );
  }
}

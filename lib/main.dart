import 'package:flutter/material.dart';
import 'package:hrisapp/app/dependency_injection.dart' as di;
//import 'package:hrisapp/presentation/view/home_screen.dart';
import 'package:hrisapp/presentation/view/splash_screen.dart';
import 'package:hrisapp/presentation/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(
    ChangeNotifierProvider(
      create: (context) => di.sl<HomeViewModel>(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HRIS App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: const Color(0xFFF5F5F7),
      ),
      home: const SplashScreen(),
    );
  }
}

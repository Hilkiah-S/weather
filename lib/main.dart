import 'package:flutter/material.dart';
// import 'package:practice/features/mainscreen/view/main_screen.dart';
import 'package:get/get.dart';
import 'package:practice/mainscreen/service/providercontroller.dart';
import 'package:practice/mainscreen/view/main_screen.dart';
import 'package:provider/provider.dart';

void main() {
  // runApp(
  //   ChangeNotifierProvider(
  //     create: (context) => WeatherNotifier(),
  //     child: const MyApp(),
  //   ),
  // );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => WeatherNotifier(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const WeatherMain(),
    );
  }
}

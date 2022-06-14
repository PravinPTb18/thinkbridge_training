import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tb_practice/Providers/data_provider.dart';
import 'package:tb_practice/Providers/theme_provider.dart';
import 'package:tb_practice/Screens/day_1.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NewData()),
        ChangeNotifierProvider(create: (_) => ThemeProvider())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: context.watch<ThemeProvider>().mainColor,
          brightness: context.watch<ThemeProvider>().brightness,
          textTheme: TextTheme()),
      home: const Day1Practice(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:plant/provider/cart.dart';
import 'package:plant/screens/login.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Cart()),
      ],
      child:
          MaterialApp(debugShowCheckedModeBanner: false, home: const Login()),
    );
  }
}

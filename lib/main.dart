import 'package:flutter/material.dart';
import 'package:myvinmec/screen/splass/splass_screen.dart';
import 'package:showcaseview/showcaseview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowCaseWidget(
        builder: Builder(builder: (context) => const MaterialApp(
          title: 'Flutter Demo',
          home: SplassScreen(),
          debugShowCheckedModeBanner: false,
        ))
    );
  }
}

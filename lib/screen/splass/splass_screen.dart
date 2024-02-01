import 'package:flutter/material.dart';
import 'package:myvinmec/screen/splass/widget/bottom_widget.dart';

import '../../utils/color.dart';

class SplassScreen extends StatefulWidget {
  const SplassScreen({super.key});
  @override
  State<SplassScreen> createState() => _SplassScreenState();
}

class _SplassScreenState extends State<SplassScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            const Icon(
              Icons.flutter_dash,
              color: Colors.white,
              size: 100,
            ),
            BottomWidget()
          ],
        ),
      ),
    );
  }
}

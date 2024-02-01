
import 'package:flutter/cupertino.dart';

class PaddingHomeWidget extends StatelessWidget {
  PaddingHomeWidget({super.key, required this.child});

  Widget child;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: child,
    );
  }
}

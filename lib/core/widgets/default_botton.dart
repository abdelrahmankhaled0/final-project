import 'package:final_project/core/utils/text.dart';
import 'package:flutter/material.dart';

class DefaultBotton extends StatelessWidget {
  const DefaultBotton({super.key, required this.textBotton, this.onPressrd});

  final String textBotton;
  final VoidCallback? onPressrd;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressrd,
      child: Text(textBotton, style: TextStyles.textStyle16),
    );
  }
}

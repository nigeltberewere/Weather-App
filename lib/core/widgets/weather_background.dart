import 'package:flutter/material.dart';
import 'package:weatherly/core/theme/app_gradients.dart';

class WeatherBackground extends StatelessWidget {
  final String condition;
  final Widget child;

  const WeatherBackground({
    super.key,
    required this.condition,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: AppGradients.getGradient(condition)),
      child: child,
    );
  }
}

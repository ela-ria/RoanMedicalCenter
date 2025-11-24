// lib/widgets/responsive.dart
import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget desktop;

  const Responsive({super.key, required this.mobile, required this.desktop});

  // Breakpoints
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 650; // Max width for mobile

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100; // Min width for desktop

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width >= 1100) {
      return desktop; // Use desktop layout
    } else {
      return mobile; // Use mobile layout
    }
  }
}

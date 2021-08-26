import 'package:flutter/material.dart';
import 'package:xplore/presentation/onboarding/widgets/onboarding_page.dart';

final List<PageData> pages = [
  PageData(
    icon: Icons.format_size,
    title: "Choose your\ninterests",
    textColor: Colors.white,
    bgColor: Colors.red,
  ),
  PageData(
    icon: Icons.hdr_weak,
    title: "Drag and\ndrop to move",
    bgColor: Color(0xFFFFFFFF),
  ),
  PageData(
    icon: Icons.bubble_chart,
    title: "Local news\nstories",
    bgColor: Color(0xFF0043D0),
    textColor: Colors.white,
  ),
];

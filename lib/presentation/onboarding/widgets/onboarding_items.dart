import 'package:flutter/material.dart';
import 'package:xplore/presentation/onboarding/widgets/onboarding_page.dart';

final List<PageData> pages = [
  PageData(
    icon: Icons.business,
    title: "Scale your existing business with a large user base",
    textColor: Colors.white,
    bgColor: Colors.deepOrange,
  ),
  PageData(
      icon: Icons.inventory,
      title: "Manage your inventory and fulfil your orders in record time",
      bgColor: Color(0xFFFFFFFF),
      textColor: Color(0xFF0043D0)),
  PageData(
    icon: Icons.insights,
    title: "Analyse your key business metrics and make informed decisions",
    bgColor: Color(0xFF0043D0),
    textColor: Colors.white,
  ),
];

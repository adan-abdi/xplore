import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/core/presentation/components/hamburger.dart';
import 'package:shamiri/features/feature_home/presentation/components/top_stores_section.dart';

import '../../../core/presentation/components/custom_textfield.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();

    _searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: XploreColors.white,
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  //  Search bar
                  SliverToBoxAdapter(
                    child: CustomTextField(
                        hint: "Search For Products",
                        iconData: Icons.search_rounded,
                        textStyle: TextStyle(fontSize: 16),
                        controller: _searchController,
                        onChanged: (value) {}),
                  ),

                  //  top stores section
                  TopStoresSection()
                ],
              ))),
    );
  }
}

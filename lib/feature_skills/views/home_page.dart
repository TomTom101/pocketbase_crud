import 'package:flutter/material.dart';

import '../widgets/grouped_skillset_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String get routeName => 'home';
  static String get routeLocation => '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home page"),
      ),
      body: const GroupedSkillSetWidget(),
    );
  }
}

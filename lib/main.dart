import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketbase_crud/feature_skills/views/myskills_page.dart';
import 'package:pocketbase_scaffold/pocketbase_scaffold.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_strategy/url_strategy.dart';

import 'feature_home/views/home_page.dart';
import 'feature_skills/views/skills_page.dart';
import 'feature_skills/views/skillset_page.dart';
import 'router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  setPathUrlStrategy();
  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences)
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  MyApp({Key? key}) : super(key: key);

  final pages = <String, Function>{
    HomePage.routeLocation: () => const HomePage(),
    MySkillsPage.routeLocation: () => const MySkillsPage(),
    SkillsPage.routeLocation: () => const SkillsPage(),
    SkillSetPage.routeLocation: () => const SkillSetPage(),
  };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider(pages));

    return MaterialApp.router(
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
      title: 'Bird App Template',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(
          color: Color.fromRGBO(48, 48, 48, 1),
          centerTitle: false,
          elevation: 0,
        ),
      ),
    );
  }
}

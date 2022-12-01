import 'package:flutter/material.dart';

class NotFoundPage extends StatelessWidget {
  static String get routeName => '404';
  static String get routeLocation => '/$routeName';

  const NotFoundPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Not found")),
    );
  }
}

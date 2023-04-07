import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ymgk_project/view/home/view/home_view.dart';

import 'core/init/navigation/navigation_service.dart';
import 'core/init/navigation/navigator_route.dart';
import 'core/init/notifier/application_provider.dart';

void main() async {
  await _init();
  runApp(MultiProvider(providers: [...ApplicationProvider.instance.dependItems], child: const MyApp()));
}

Future<void> _init() async {}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      navigatorKey: NavigationService.instance.navigatorKey,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeView(),
    );
  }
}

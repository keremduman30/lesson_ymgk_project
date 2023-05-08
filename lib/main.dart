import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:ymgk_project/core/constant/app/application_constant.dart';
import 'package:ymgk_project/view/splash/view/splash_view.dart';

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

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      navigatorKey: NavigationService.instance.navigatorKey,
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: ApplicationConstant.instance.primaryFamily),
      home: const SplashView(),
    );
  }
}

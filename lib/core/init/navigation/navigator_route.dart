import 'package:flutter/material.dart';
import 'package:ymgk_project/core/constant/navigation/navigation_constant.dart';
import 'package:ymgk_project/view/home/view/home_view.dart';
import 'package:ymgk_project/view/splash/view/splash_view.dart';

class NavigationRoute {
  static NavigationRoute? _instace;
  static NavigationRoute get instance {
    return _instace ??= NavigationRoute._init();
  }

  NavigationRoute._init();
  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstant.splash:
      return normalNavigate(const SplashView());
       case NavigationConstant.home_view:
      return normalNavigate(const HomeView());
      default:
        return normalNavigate(const Text("Not found"));
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}

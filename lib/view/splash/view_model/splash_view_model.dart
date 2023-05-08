import 'package:flutter/material.dart';

import '../../../core/base/view_model/base_view_model.dart';
import '../../../core/constant/navigation/navigation_constant.dart';
import '../../../core/init/navigation/navigation_service.dart';

class SplashViewModel extends ChangeNotifier with BaseViewModel {
  @override
  void setContext(BuildContext context) => viewModelContext = context;
  @override
  void init() {
    Future.delayed(const Duration(milliseconds: 1580), () {
      NavigationService.instance.navigatorToPageClear(path: NavigationConstant.home_view);
    });
  }
}

import 'package:flutter/material.dart';

import '../../init/navigation/navigation_service.dart';

abstract class BaseViewModel {
  late BuildContext viewModelContext;
  void setContext(BuildContext context);
  void init();
  final navigationService = NavigationService.instance;
}

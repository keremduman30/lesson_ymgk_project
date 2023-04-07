import 'package:flutter/material.dart';
import 'package:ymgk_project/core/base/view_model/base_view_model.dart';

class HomeViewModel with ChangeNotifier, BaseViewModel {
  @override
  void setContext(BuildContext context) => viewModelContext = context;
  @override
  void init() {}
}

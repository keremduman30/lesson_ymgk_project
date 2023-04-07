import 'package:flutter/material.dart';
import 'package:ymgk_project/core/constant/app/image_constant.dart';
import 'package:ymgk_project/core/extension/context_extension.dart';
import 'package:ymgk_project/core/init/navigation/navigation_service.dart';
import 'package:ymgk_project/view/home/view_model/home_view_model.dart';

import '../../../core/base/view/base_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      viewModel: HomeViewModel(),
      onModelReady: (viewmodel) {
        viewmodel.init();
        viewmodel.setContext(context);
      },
      onPageBuilder: (BuildContext context, HomeViewModel viewModel) => Scaffold(
        backgroundColor: Colors.yellow.shade200,
        body: SingleChildScrollView(
          child: Column(
            children: const [
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}

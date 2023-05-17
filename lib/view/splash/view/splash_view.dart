import 'package:flutter/material.dart';
import 'package:ymgk_project/core/extension/context_extension.dart';

import '../../../core/base/view/base_view.dart';
import '../../../core/constant/app/lottie_constant.dart';
import '../view_model/splash_view_model.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<SplashViewModel>(
      viewModel: SplashViewModel(),
      onModelReady: (viewmodel) {
        viewmodel.init();
        viewmodel.setContext(context);
      },
      onPageBuilder: (BuildContext context, SplashViewModel viewModel) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildRow(context),
              const SizedBox(height: 30),
              const Center(child: CircularProgressIndicator(strokeWidth: 7)),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        rowItems(context, "1", Colors.blue),
        rowItems(context, "2", Colors.purple),
        rowItems(context, "3", Colors.orange),
        rowItems(context, "4", Colors.blueGrey),
      ],
    );
  }

  Widget rowItems(BuildContext context, String text, Color colors) {
    return Text(
      text,
      style: context.textThem.titleLarge?.copyWith(fontSize: 100, color: colors),
    );
  }
}

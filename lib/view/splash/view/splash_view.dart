import 'package:flutter/material.dart';

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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildRowItem(LottiePathEnum.number1),
              buildRowItem(LottiePathEnum.number2),
              buildRowItem(LottiePathEnum.number3),
              buildRowItem(LottiePathEnum.number4),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox buildRowItem(LottiePathEnum path) {
    return SizedBox(
      width: 80,
      height: 80,
      child: path.toWidgetLottieCover,
    );
  }
}

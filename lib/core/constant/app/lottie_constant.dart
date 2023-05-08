import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

enum LottiePathEnum { number1,number2,number3,number4 }

extension LottiePathEnumExtension on LottiePathEnum {
  String? get rawValue {
    switch (this) {
      case LottiePathEnum.number1:
        return _pathValue("number1");
      case LottiePathEnum.number2:
        return _pathValue("number2");
      case LottiePathEnum.number3:
        return _pathValue("number3");
      case LottiePathEnum.number4:
        return _pathValue("number4");
    

      default:
    }
    return null;
  }

  Widget get toWidgetLottie => Lottie.asset(rawValue!, filterQuality: FilterQuality.high, fit: BoxFit.fill, repeat: true);
  Widget get toWidgetLottieCover => Lottie.asset(rawValue!, filterQuality: FilterQuality.high, fit: BoxFit.cover, repeat: true);

  String _pathValue(String path) {
    return "assets/lottie/$path.json";
  }
}

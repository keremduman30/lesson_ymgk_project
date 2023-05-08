import '../../../view/home/model/image_model.dart';
import 'image_constant.dart';

class ApplicationConstant {
  static ApplicationConstant? _instace;
  static ApplicationConstant get instance {
    _instace ??= ApplicationConstant._init();
    return _instace!;
  }

  ApplicationConstant._init();
  final gameTitle = "Resimlerle Çıkarma İşlemi";
  final gameDescription =
      "Aşağıdaki çıkarma işleminde 1,2,3 ve 4 rakamların yerine resimler kullanılmıştır. Acaba hangi resim hangi rakamı temsil ediyor ? Lütfen bunları kutucuklar içinde belirtelim";
  final gameResult = "Sonuc";
  final gameRefresh = "Yenile";
  final primaryFamily = "JosefinSans";
  final onPrimaryFamily = "SecularOne";
  final secondaryFamily = "JosefinSans";
  final List<String> allImages = [
    ImageConstant.instance.apple,
    ImageConstant.instance.flower,
    ImageConstant.instance.cupcake,
    ImageConstant.instance.chicken
  ];
  List<ImageModel> firstRandomListImage = [
    ImageModel(path: ImageConstant.instance.apple, value: 0),
    ImageModel(path: ImageConstant.instance.apple, value: 0),
    ImageModel(path: ImageConstant.instance.apple, value: 0),
    ImageModel(path: ImageConstant.instance.apple, value: 0),
  ];
}

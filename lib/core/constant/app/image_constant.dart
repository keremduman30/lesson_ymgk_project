class ImageConstant {
  static ImageConstant? _instace;
  static ImageConstant get instance {
    _instace ??= ImageConstant._init();
    return _instace!;
  }

  ImageConstant._init();
  final apple = "apple".toPng;
  final flower = "flowers".toPng;
  final cupcake = "cupcake".toPng;
  final chicken = "chicken".toPng;
  final logo = "logo".toPng;
}

extension _ImagePathExtension on String {
  String get toPng => "assets/images/png/$this.png";
}

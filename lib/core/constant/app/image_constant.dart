class ImageConstant {
  static ImageConstant? _instace;
  static ImageConstant get instance {
    _instace ??= ImageConstant._init();
    return _instace!;
  }

  ImageConstant._init();
  final apple = "apple".toPng;
  final flowers = "flowers".toPng;
  final cupcake = "cupcake".toPng;
  final chicken = "chicken".toPng;
}

extension _ImagePathExtension on String {
  String get toPng => "assets/images/png/$this.png";
}

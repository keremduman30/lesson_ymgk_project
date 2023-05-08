import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ymgk_project/core/base/view_model/base_view_model.dart';
import 'package:ymgk_project/core/components/card/game_alert_dialog.dart';
import 'package:ymgk_project/core/components/card/getx/locale_getx_snackbar.dart';
import 'package:ymgk_project/core/constant/app/image_constant.dart';
import 'package:ymgk_project/core/init/navigation/navigation_service.dart';
import 'package:ymgk_project/view/home/model/image_model.dart';

class HomeViewModel extends ChangeNotifier with BaseViewModel {
  var random = Random();
  final formKey = GlobalKey<FormState>();

  bool loadig = false;

  //all images
  final List<String> allImages = [
    ImageConstant.instance.apple,
    ImageConstant.instance.flower,
    ImageConstant.instance.cupcake,
    ImageConstant.instance.chicken
  ];
  //topAllImages Starting
  List<ImageModel> topListImages = [
    ImageModel(path: ImageConstant.instance.apple, value: 0),
    ImageModel(path: ImageConstant.instance.apple, value: 0),
    ImageModel(path: ImageConstant.instance.apple, value: 0),
    ImageModel(path: ImageConstant.instance.apple, value: 0),
  ];
  //bottomAllImages Starting
  List<ImageModel> bottomListImages = [
    ImageModel(path: ImageConstant.instance.apple, value: 0),
    ImageModel(path: ImageConstant.instance.apple, value: 0),
    ImageModel(path: ImageConstant.instance.apple, value: 0),
    ImageModel(path: ImageConstant.instance.apple, value: 0),
  ];
  //resultImagesr Starting
  List<ImageModel> resultListImages = [
    ImageModel(path: ImageConstant.instance.apple, value: 0),
    ImageModel(path: ImageConstant.instance.apple, value: 0),
    ImageModel(path: ImageConstant.instance.apple, value: 0),
    ImageModel(path: ImageConstant.instance.apple, value: 0),
  ];

  late TextEditingController topEditTxtChicken;
  late TextEditingController topEditTxtApple;
  late TextEditingController bottomEditTxtFlower;
  late TextEditingController bottomEditTxtCake;
  final appkeyContext = NavigationService.instance.navigatorKey.currentContext;

  @override
  void setContext(BuildContext context) => viewModelContext = context;
  @override
  void init() {
    topEditTxtChicken = TextEditingController();
    topEditTxtApple = TextEditingController();
    bottomEditTxtFlower = TextEditingController();
    bottomEditTxtCake = TextEditingController();
    appkeyContext?.read<HomeViewModel>().startingGame();
  }

  void changeLoading() {
    loadig = !loadig;
    notifyListeners();
  }

  void startingGame() {
    createRandomModelForAll();
    for (var i = 0; i < 4; i++) {
      while (!(topListImages[i].value > bottomListImages[i].value)) {
        topListImages[i] = ImageModel(path: topListImages[i].path, value: random.nextInt(4) + 1);
        bottomListImages[i] = ImageModel(path: bottomListImages[i].path, value: random.nextInt(4) + 1);
      }
    }

    for (var i = 0; i < 4; i++) {
      while ((topListImages[i].value - bottomListImages[i].value) != resultListImages[i].value) {
        resultListImages[i] = ImageModel(path: resultListImages[i].path, value: random.nextInt(4) + 1);
      }
    }
    changeImages(topListImages, allImages);
    changeImages(bottomListImages, allImages);
    changeImages(resultListImages, allImages);
  }

  void createRandomModelForAll() {
    for (var i = 0; i < 4; i++) {
      // fonk
      topListImages[i] = ImageModel(path: allImages[random.nextInt(4)], value: random.nextInt(4) + 1);
      bottomListImages[i] = ImageModel(path: allImages[random.nextInt(4)], value: random.nextInt(4) + 1);
      resultListImages[i] = ImageModel(path: allImages[random.nextInt(4)], value: random.nextInt(4) + 1);
    }
  }

  void refreshGame() {
    changeLoading();
    startingGame();
    changeLoading();
  }

  void changeImages(List<ImageModel> listImages, List<String> allImages) {
    for (var i = 0; i < 4; i++) {
      switch (listImages[i].value) {
        case 1:
          listImages[i].path = allImages[0];
          break;
        case 2:
          listImages[i].path = allImages[1];
          break;
        case 3:
          listImages[i].path = allImages[2];
          break;
        case 4:
          listImages[i].path = allImages[3];
          break;
        default:
      }
    }
  }

  String? fetchTextFormValidator(String? value) {
    if (value!.isEmpty) {
      return "";
    }
    return null;
  }

  void controlAnswer(List<ImageModel> resultList, List<ImageModel> topList, List<ImageModel> bottomList, BuildContext context) {
    final combinedList = List.from(resultList)
      ..addAll(topList)
      ..addAll(bottomList);

    final uniqueList = combinedList.fold<List<ImageModel>>([], (acc, element) {
      if (!acc.any((item) => item.path == element.path)) {
        acc.add(element);
      }
      return acc;
    });

    List<ImageModel> userEnterList = [];

    final isProblemForm = formKey.currentState!.validate();
    if (isProblemForm) {
      userEnterList.add(ImageModel(path: path("chicken"), value: int.parse(topEditTxtChicken.text)));
      userEnterList.add(ImageModel(path: path("apple"), value: int.parse(topEditTxtApple.text)));
      userEnterList.add(ImageModel(path: path("flower"), value: int.parse(bottomEditTxtFlower.text)));
      userEnterList.add(ImageModel(path: path("cake"), value: int.parse(bottomEditTxtCake.text)));
      if (areListsEqual(userEnterList, uniqueList)) {
        topEditTxtApple.clear();
        topEditTxtChicken.clear();
        bottomEditTxtCake.clear();
        bottomEditTxtFlower.clear();
        GameAlertDialog.instance.showAlertDialog(context);
      } else {
        LocalGetSnackBar.localeGetSnackBar(message: "Yanlış Cevap ! Lütfen tekrar deneyiniz");
      }
    } else {
      // tryNumber();
      LocalGetSnackBar.localeGetSnackBar(message: "Lütfen Tum boslukları doldurun");
    }
  }

  bool areListsEqual(List<ImageModel> list1, List<ImageModel> list2) {
    if (list1.length != list2.length) {
      return false;
    }

    // Elemanları alfabetik olarak sırala
    list1.sort((a, b) => a.path.compareTo(b.path));
    list2.sort((a, b) => a.path.compareTo(b.path));

    // Sıralanmış listeleri karşılaştır
    for (var i = 0; i < list1.length; i++) {
      if (list1[i].path != list2[i].path || list1[i].value != list2[i].value) {
        return false;
      }
    }
    return true;
  }

  String path(String value) {
    switch (value) {
      case "chicken":
        return ImageConstant.instance.chicken;
      case "apple":
        return ImageConstant.instance.apple;
      case "flower":
        return ImageConstant.instance.flower;
      case "cake":
        return ImageConstant.instance.cupcake;

      default:
        return "";
    }
  }

  List<ImageModel> get  firstRandomList => [
        ImageModel(path: ImageConstant.instance.apple, value: 0),
        ImageModel(path: ImageConstant.instance.apple, value: 0),
        ImageModel(path: ImageConstant.instance.apple, value: 0),
        ImageModel(path: ImageConstant.instance.apple, value: 0),
      ];
}

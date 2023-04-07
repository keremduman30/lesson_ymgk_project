import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:ymgk_project/view/home/view_model/home_view_model.dart';

class ApplicationProvider {
  static ApplicationProvider? _instace;

  static ApplicationProvider get instance {
    _instace = ApplicationProvider._init();
    return _instace!;
  }

  ApplicationProvider._init();
  List<SingleChildWidget> dependItems = [
    ChangeNotifierProvider(create: (context) => HomeViewModel()),
  ];
}

import 'package:flutter/cupertino.dart';
import 'package:ymgk_project/core/extension/context_extension.dart';
import 'package:ymgk_project/view/home/model/image_model.dart';

class CardRowIconWidget extends StatelessWidget {
  final List<ImageModel> list;
  const CardRowIconWidget({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
 
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.lowValuePlus),
      child: SizedBox(
        height: context.dymaicWidth(0.20),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: list.map((e) => buildRowItems(e.path)).toList(),
        ),
      ),
    );
  }

  Widget buildRowItems(String path) {
    return Container(
      width: 45,
      decoration: BoxDecoration(image: DecorationImage(image: AssetImage(path), fit: BoxFit.fitWidth)),
    );
  }
}

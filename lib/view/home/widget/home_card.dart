import 'package:flutter/material.dart';
import 'package:ymgk_project/core/extension/context_extension.dart';

import '../../../core/constant/app/image_constant.dart';

class HomeCardWidget extends StatelessWidget {
  const HomeCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: context.dymaicWidth(0.75),
      // width: 290,
      child: Column(
        children: [
          SizedBox(
            height: context.dymaicWidth(0.45),
            // height: 170,
            child: buildStackHead(context),
          ),
          buildDivider(context),
          buildFirstRow(context),
          buildDivider(context)
        ],
      ),
    );
  }

  Widget buildStackHead(BuildContext context) {
    return Stack(
      children: [stackColumn(context), stackPositioned()],
    );
  }

  Widget stackColumn(BuildContext context) {
    return Column(
      children: [
        buildFirstRow(context),
        buildFirstRow(context),
      ],
    );
  }

  Widget stackPositioned() {
    return const Positioned(
      left: 5,
      bottom: 0,
      child: SizedBox(
        width: 15,
        child: Divider(thickness: 2.5, height: 70, color: Colors.black),
      ),
    );
  }

  Padding buildDivider(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.dymaicWidth(0.05)),
      child: Divider(color: Colors.black.withOpacity(0.7), thickness: 2.5),
    );
  }

  Widget buildFirstRow(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.lowValuePlus),
      child: SizedBox(
        height: context.dymaicWidth(0.15),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildFirstRowItems(ImageConstant.instance.flowers),
            buildFirstRowItems(ImageConstant.instance.apple),
            buildFirstRowItems(ImageConstant.instance.cupcake),
            buildFirstRowItems(ImageConstant.instance.chicken),
          ],
        ),
      ),
    );
  }

  Widget buildFirstRowItems(String path) {
    return Container(
      width: 45,
      decoration: BoxDecoration(image: DecorationImage(image: AssetImage(path), fit: BoxFit.fitWidth)),
    );
  }
}

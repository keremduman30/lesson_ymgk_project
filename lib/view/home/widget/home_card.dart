import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ymgk_project/core/extension/context_extension.dart';
import 'package:ymgk_project/view/home/view_model/home_view_model.dart';
import 'package:ymgk_project/view/home/widget/card_row_icon_widget.dart';

class HomeCardWidget extends StatelessWidget {
  const HomeCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      // width: context.dymaicWidth(0.90),
      // width: 290,
      child: context.watch<HomeViewModel>().loadig
          ? loadigProgress()
          : Column(
              children: [
                SizedBox(height: context.dymaicWidth(0.55), child: buildStackHead(context)),
                buildDivider(context),
                buildResultList(),
                buildDivider(context)
              ],
            ),
    );
  }

  Widget loadigProgress() => const Center(child: CircularProgressIndicator());

  Widget buildStackHead(BuildContext context) {
    return Stack(
      children: [stackColumn(context), stackPositioned()],
    );
  }

  Widget stackColumn(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, model, child) {
        return Column(
          children: [buildTopList(model), buildBottomList(model)],
        );
      },
    );
  }

  Widget stackPositioned() {
    return const Positioned(
      left: 5,
      bottom: 0,
      child: SizedBox(width: 15, child: Divider(thickness: 2.5, height: 70, color: Colors.black)),
    );
  }

  Padding buildDivider(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.dymaicWidth(0.05)),
      child: Divider(color: Colors.black.withOpacity(0.7), thickness: 2.5),
    );
  }

  Widget buildTopList(HomeViewModel model) {
    return CardRowIconWidget(list: model.topListImages);
  }

  Widget buildBottomList(HomeViewModel model) {
    return CardRowIconWidget(list: model.bottomListImages);
  }

  Widget buildResultList() {
    return Consumer<HomeViewModel>(
      builder: (context, model, child) {
        return CardRowIconWidget(list: model.resultListImages);
      },
    );
  }
}

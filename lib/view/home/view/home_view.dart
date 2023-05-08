import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ymgk_project/core/constant/app/application_constant.dart';
import 'package:ymgk_project/core/constant/app/image_constant.dart';
import 'package:ymgk_project/core/extension/context_extension.dart';
import 'package:ymgk_project/view/home/view_model/home_view_model.dart';
import 'package:ymgk_project/view/home/widget/home_card.dart';

import '../../../core/base/view/base_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      viewModel: HomeViewModel(),
      onModelReady: (viewmodel) {
        viewmodel.init();
        viewmodel.setContext(context);
      },
      onPageBuilder: (BuildContext context, HomeViewModel viewModel) => Scaffold(
        backgroundColor: const Color.fromRGBO(255, 245, 157, 1),
        body: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: bodyColumn(context, viewModel),
            )
          ],
        ),
      ),
    );
  }

  Widget bodyColumn(BuildContext context, HomeViewModel viewModel) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: AppBar().preferredSize.height + 10),
        gameTitle(context),
        gameDescription(context),
        buildRefreshBtn(context),
        const SizedBox(height: 15),
        buildCardWidget(context, viewModel),
        buildGameBottomAnswer(context, viewModel)
      ],
    );
  }

  Widget gameTitle(BuildContext context) => Text(
        ApplicationConstant.instance.gameTitle,
        style: context.textThem.titleLarge?.copyWith(fontFamily: ApplicationConstant.instance.onPrimaryFamily, letterSpacing: 1),
      );

  Widget gameDescription(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.normalValue, vertical: context.lowValuePlus),
      child: RichText(
        softWrap: true,
        text: TextSpan(
          style: context.textThem.titleLarge?.copyWith(letterSpacing: 0.4, fontFamily: ApplicationConstant.instance.primaryFamily),
          text: ApplicationConstant.instance.gameDescription,
        ),
      ),
    );
  }

  Widget buildRefreshBtn(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<HomeViewModel>().refreshGame(),
      child: Container(
        padding: context.paddingLowPlus,
        decoration: BoxDecoration(color: Colors.blueGrey, borderRadius: BorderRadius.circular(10)),
        child: Text(
          ApplicationConstant.instance.gameRefresh,
          style: context.textThem.titleLarge!.copyWith(color: Colors.white),
        ),
      ),
    );
  }

  Widget buildCardWidget(BuildContext context, HomeViewModel viewModel) =>
      Padding(padding: context.paddingNormalHorizontal, child: const HomeCardWidget());

  Widget buildGameBottomAnswer(BuildContext context, HomeViewModel viewModel) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(top: context.lowValue),
        child: Container(
          padding: EdgeInsets.only(bottom: context.lowValuePlus),
          color: Colors.white,
          child: Stack(
            children: [Positioned(top: 5, left: 5, child: stackAnswerTxt(context, viewModel)), stackColumn(context, viewModel)],
          ),
        ),
      ),
    );
  }

  Widget stackAnswerTxt(BuildContext context, HomeViewModel viewModel) {
    return Consumer<HomeViewModel>(
      builder: (context, value, child) {
        return GestureDetector(
          onTap: () => viewModel.controlAnswer(value.resultListImages, value.topListImages, value.bottomListImages, context),
          child: Container(
            padding: context.paddingLowPlus,
            decoration: BoxDecoration(color: Colors.blueGrey, borderRadius: BorderRadius.circular(10)),
            child: Text(
              ApplicationConstant.instance.gameResult,
              style: context.textThem.titleLarge!.copyWith(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  Widget stackColumn(BuildContext context, HomeViewModel viewModel) {
    return Form(
      key: viewModel.formKey,
      child: Padding(
        padding: EdgeInsets.only(top: context.normalValue),
        child: Column(
          children: [stackColumnTopItemRow(viewModel, context), const SizedBox(height: 15), stackColumnBottomItemRow(context, viewModel)],
        ),
      ),
    );
  }

  Widget stackColumnTopItemRow(HomeViewModel viewModel, BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(width: context.dymaicWidth(0.15)),
          buildBottomItem(ImageConstant.instance.chicken, viewModel.topEditTxtChicken, viewModel),
          buildBottomItem(ImageConstant.instance.apple, viewModel.topEditTxtApple, viewModel),
        ],
      ),
    );
  }

  Widget stackColumnBottomItemRow(BuildContext context, HomeViewModel viewModel) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(width: context.dymaicWidth(0.07)),
          buildBottomItem(ImageConstant.instance.flower, viewModel.bottomEditTxtFlower, viewModel),
          const Spacer(),
          buildBottomItem(ImageConstant.instance.cupcake, viewModel.bottomEditTxtCake, viewModel),
          // SizedBox(width: context.dymaicWidth(0.12)),
          const Spacer(),
        ],
      ),
    );
  }

  Widget buildBottomItem(String path, TextEditingController controller, HomeViewModel viewModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [buildBottomItemImg(path), const SizedBox(width: 20), buildBottomRowItemTxtForm(controller, viewModel)],
    );
  }

  Widget buildBottomItemImg(String path) =>
      Container(width: 45, decoration: BoxDecoration(image: DecorationImage(image: AssetImage(path), fit: BoxFit.fitWidth)));

  Widget buildBottomRowItemTxtForm(TextEditingController controller, HomeViewModel viewModel) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(width: 1, color: Colors.grey),
      ),
      child: buildBottomTextFormField(controller, viewModel),
    );
  }

  Widget buildBottomTextFormField(TextEditingController controller, HomeViewModel viewModel) {
    return Center(
      child: TextFormField(
        keyboardType: TextInputType.number,
        maxLength: 1,
        controller: controller,
        decoration: const InputDecoration(
          border: InputBorder.none,
          counterText: "",
        ),
        textAlign: TextAlign.center,
        autofocus: false,
        validator: viewModel.fetchTextFormValidator,
      ),
    );
  }
}

import 'package:crowd_funding_sample_app/reusable_widget/customize_container_shadow.dart';
import 'package:crowd_funding_sample_app/reusable_widget/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrimaryAlertDialog extends StatelessWidget {
  const PrimaryAlertDialog({
    super.key,
    this.image,
    required this.title,
    required this.content,
    this.contentTextAlign,
    this.rightButtonText,
    this.leftButtonText,
    this.rightButtonAction,
    this.leftButtonAction,
  });

  final Widget? image;
  final String title;
  final String content;
  final TextAlign? contentTextAlign;

  final String? rightButtonText;
  final String? leftButtonText;
  final Function()? rightButtonAction;
  final Function()? leftButtonAction;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: CustomizedContainerShadow(
        padding: const EdgeInsets.all(16),
        borderRadius: 8,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            image ?? Center(child: image),
            image != null
                ? const SizedBox(
                    height: 8,
                  )
                : Container(),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 8,
            ),
            (content).isNotEmpty
                ? Text(content,
                    textAlign: contentTextAlign?? TextAlign.center,
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400))
                : Container(),
            const SizedBox(
              height: 24,
            ),
            Row(
              children: [
              
                   Expanded(
                  child: SizedBox(
                    child: PrimaryButton(
                      label: leftButtonText??'',
                      onPressed: leftButtonAction??(){},
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
               Expanded(
                  child: SizedBox(
                    child: PrimaryButton(
                      isOutlined: true,
                      label: rightButtonText??'',
                      onPressed: rightButtonAction ?? () => Get.back(),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CustomizeSingleAlertDialog extends StatelessWidget {
  const CustomizeSingleAlertDialog({
    super.key,
    this.image,
    required this.title,
    required this.content,
    this.contentTextAlign,
   required this.buttonText,
   required this.buttonAction,
  });

  final Widget? image;
  final String title;
  final String content;
  final TextAlign? contentTextAlign;

  final String? buttonText;
  final Function()? buttonAction;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: CustomizedContainerShadow(
        padding: const EdgeInsets.all(16),
        borderRadius: 8,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            image ?? Center(child: image),
            image != null
                ? const SizedBox(
                    height: 8,
                  )
                : Container(),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 8,
            ),
            (content).isNotEmpty
                ? Text(content,
                    textAlign:contentTextAlign?? TextAlign.center,
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400))
                : Container(),
            const SizedBox(
              height: 24,
            ),
            SizedBox(
              width: Get.mediaQuery.size.width,
              child: PrimaryButton(
                label: buttonText??'',
                onPressed: buttonAction ?? () {},
              ),
            ),
            const SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}
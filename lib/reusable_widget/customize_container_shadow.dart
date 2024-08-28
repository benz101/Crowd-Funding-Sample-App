import 'package:flutter/material.dart';

class CustomizedContainerShadow extends StatelessWidget {
  const CustomizedContainerShadow(
      {super.key,
      required this.child,
      this.customBorderRadius,
      this.border,
      this.borderColor,
      this.useBorder = false,
      this.onTap,
      this.backgroundColor,
      this.borderRadius = 4,
      this.padding,
      this.width,
      this.height,
      this.hideShadow = true,
      this.elevation});

  final Widget child;
  final EdgeInsets? padding;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final double borderRadius;
  final Function()? onTap;
  final bool useBorder;
  final Color? borderColor;
  final bool hideShadow;
  final Border? border;
  final BorderRadius? customBorderRadius;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: hideShadow ? 0 : elevation ?? 10,
      color: backgroundColor ?? Colors.white,
      shadowColor: const Color(0xff1D1617),
      borderRadius: customBorderRadius ?? BorderRadius.circular(borderRadius),
      child: Ink(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: backgroundColor ?? Colors.white,
            borderRadius: customBorderRadius ?? BorderRadius.circular(borderRadius),
            border: useBorder
                ? border ??
                    Border.all(color: borderColor ?? Colors.grey[200]!)
                : null,
            boxShadow: useBorder || hideShadow
                ? null
                : [
                    BoxShadow(
                        color: const Color(0xff1D1617).withOpacity(0.1),
                        offset: const Offset(0, 10),
                        blurRadius: 20,
                        spreadRadius: 0)
                  ]),
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: padding ??
                const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: child,
          ),
        ),
      ),
    );
  }
}
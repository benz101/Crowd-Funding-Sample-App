import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final TextStyle? labelStyle;
  final void Function() onPressed;
  final bool? isOutlined;
  const PrimaryButton(
      {super.key,
      required this.label,
      this.labelStyle,
      required this.onPressed,
      this.isOutlined});

  @override
  Widget build(BuildContext context) {
    return !(isOutlined ?? false)
        ? ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange[300],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2))),
            onPressed: onPressed,
            child: Text(label,
                style: labelStyle ?? TextStyle(color: Colors.white)))
        : OutlinedButton(
             style: OutlinedButton.styleFrom(
              side: BorderSide(color: Colors.orange[300]!),
                shape: RoundedRectangleBorder(
                    
                    side: BorderSide(color: Colors.orange[300]!),
                    borderRadius: BorderRadius.circular(2))),
            onPressed: onPressed,
            child: Text(label,
                style: labelStyle ?? TextStyle(color: Colors.orange[300])));
  }
}

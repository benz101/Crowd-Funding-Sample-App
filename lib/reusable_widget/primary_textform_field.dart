import 'package:flutter/material.dart';

class PrimaryTextFormField extends StatelessWidget {
  String? label;
  TextStyle? labelStyle;
  TextEditingController? controller;
  TextInputType? keyboardType;
  bool? isRequired;
  bool? obsecureText;
  bool? readOnly;
  PrimaryTextFormField(
      {super.key,
      this.label,
      this.labelStyle,
      this.controller,
      this.keyboardType,
      this.isRequired,
      this.obsecureText,
      this.readOnly});

  @override
  Widget build(BuildContext context) {
    return (label ?? '').isEmpty
        ? TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            obscureText: obsecureText ?? false,
            readOnly: readOnly ?? false,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[300]!)),
                disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[300]!)),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[300]!))),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              !(isRequired ?? false)
                  ? Text(label!,
                      style: labelStyle ??
                          TextStyle(color: Colors.black, fontSize: 12))
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                          Text('*',
                              style:
                                  TextStyle(color: Colors.red, fontSize: 12)),
                          Expanded(
                              child: Text(label!,
                                  style: labelStyle ??
                                      TextStyle(
                                          color: Colors.black, fontSize: 12)))
                        ]),
              SizedBox(height: 5),
              TextFormField(
                controller: controller,
                keyboardType: keyboardType,
                obscureText: obsecureText ?? false,
                readOnly: readOnly ?? false,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[300]!)),
                    disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[300]!)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[300]!))),
              ),
            ],
          );
  }
}

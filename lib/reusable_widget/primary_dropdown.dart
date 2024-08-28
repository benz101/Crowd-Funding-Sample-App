import 'package:flutter/material.dart';

class PrimaryDropDown extends StatelessWidget {
  dynamic value;
  List<DropdownMenuItem<dynamic>>? items;
  Function(dynamic)? onChanged;
  bool? isRequired;
  String? label;
  TextStyle? labelStyle;
  PrimaryDropDown(
      {super.key,
      this.value,
      this.items,
      this.onChanged,
      this.isRequired,
      this.label,
      this.labelStyle});

  @override
  Widget build(BuildContext context) {
    return (label ?? '').isEmpty
        ? Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey[300]!)),
            padding: const EdgeInsets.all(5),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                style: TextStyle(color: Colors.black, fontSize: 14),
                  isExpanded: true,
                  value: value,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: items,
                  onChanged: onChanged),
            ),
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
              Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey[300]!)),
                padding: const EdgeInsets.all(5),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                      style: TextStyle(color: Colors.black, fontSize: 14),
                      isExpanded: true,
                      value: value,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: items,
                      onChanged: onChanged),
                ),
              )
            ],
          );
  }
}

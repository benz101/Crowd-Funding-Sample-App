import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PrimaryDateTimePicker extends StatelessWidget {
  String? label;
  TextStyle? labelStyle;
  TextEditingController? controller;
  TextInputType? keyboardType;
  bool? isRequired;
  DateTime? initialDate;
  DateTime? firstDate;
  DateTime? lastDate;
  DateTime? value;
  ValueChanged<DateTime>? onSelect;
  String? initialValue;
  PrimaryDateTimePicker(
      {super.key,
      this.label,
      this.labelStyle,
      this.controller,
      this.keyboardType,
      this.isRequired,
      this.initialDate,
      this.firstDate,
      this.lastDate,
      this.value,
      this.onSelect,
      this.initialValue});

  @override
  Widget build(BuildContext context) {
    return (label ?? '').isEmpty
        ? TextFormField(
            onTap: () async {
              try {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: initialDate ?? DateTime.now(),
                    firstDate: firstDate ?? DateTime(1900),
                    lastDate: lastDate ??
                        DateTime.now().add(Duration(days: 365 * 10)));

                if (pickedDate != null) {
                  // String formattedDate = DateFormat('dd MMM yyyy').format(pickedDate);
                  onSelect!(pickedDate);
                } else {
                  debugPrint('Date Picker Not Selected');
                }
              } catch (e) {
                debugPrint('Date Picker Error');
              }
            },
            controller:
                value != null
                    ? TextEditingController(
                        text: DateFormat('dd MMMM yyyy').format(value!))
                    : null,
            keyboardType: keyboardType,
            readOnly: true,
            initialValue: initialValue,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[300]!)),
                disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[300]!)),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[300]!)),
                suffixIcon: Icon(
                  Icons.calendar_month,
                  color: Colors.grey[500],
                )),
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
                onTap: () async {
                  try {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: initialDate ?? DateTime.now(),
                        firstDate: firstDate ?? DateTime(1900),
                        lastDate: lastDate ??
                            DateTime.now().add(Duration(days: 365 * 10)));

                    if (pickedDate != null) {
                      onSelect!(pickedDate);
                    } else {
                      debugPrint('Date Picker Not Selected');
                    }
                  } catch (e) {
                    debugPrint('Date Picker Error');
                  }
                },
                controller: value != null
                    ? TextEditingController(
                        text: DateFormat('dd MMMM yyyy').format(value!))
                    : null,
                keyboardType: keyboardType,
                readOnly: true,
                initialValue: initialValue,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[300]!)),
                    disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[300]!)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[300]!)),
                    suffixIcon:
                        Icon(Icons.calendar_month, color: Colors.grey[500])),
              ),
            ],
          );
  }
}

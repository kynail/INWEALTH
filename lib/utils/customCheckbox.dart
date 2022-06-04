import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({Key? key, required this.onChanged}) : super(key: key);

  final Function(bool) onChanged;

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
        value: isChecked,
        onChanged: (bool? value) {
          setState(() {
            isChecked = value!;
          });
          widget.onChanged(isChecked);
        });
  }
}
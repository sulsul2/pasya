import 'package:flutter/material.dart';
import 'package:pasya/theme.dart';

class CustomDropDown extends StatefulWidget {
  const CustomDropDown({super.key, required this.list, this.placeholder = "-"});
  final List list;
  final String placeholder;

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  Widget build(BuildContext context) {
    String? selectedItem;
    return DropdownButtonFormField(
      alignment: Alignment.centerLeft,
      dropdownColor: yellowColor,
      style: blackText.copyWith(fontWeight: semibold, fontSize: 20),
      borderRadius: BorderRadius.circular(32),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(defaultRadius),
        filled: true,
        fillColor: yellowColor,
        hintText: widget.placeholder,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: BorderSide.none),
        hintStyle: blackText.copyWith(fontWeight: semibold, fontSize: 20),
      ),
      items: widget.list
          .map((e) => DropdownMenuItem(
                value: e,
                child: Text(
                  e,
                ),
              ))
          .toList(),
      value: selectedItem,
      onChanged: (value) {
        selectedItem = value.toString();
      },
    );
  }
}

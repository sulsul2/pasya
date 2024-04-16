import 'package:flutter/material.dart';
import 'package:pasya/theme.dart';

class FormInput extends StatefulWidget {
  const FormInput({
    super.key,
    required this.textController,
    required this.hintText,
    this.validator = 'Please',
    required this.label,
    this.isPassword = false,
    this.isSearch = false,
  });

  final TextEditingController textController;
  final bool isPassword;
  final bool isSearch;
  final String hintText;
  final String validator;
  final String label;

  @override
  State<FormInput> createState() => _FormInputState();
}

class _FormInputState extends State<FormInput> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!widget.isSearch)
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Text(
                  widget.label,
                  style: blackText.copyWith(fontSize: 16, fontWeight: regular),
                ),
              ],
            ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            style: blueText.copyWith(fontSize: 16, fontWeight: regular),
            obscureText: widget.isPassword ? isObscure : false,
            obscuringCharacter: '*',
            cursorColor: blueColor.withOpacity(0.5),
            validator: (e) {
              if (e!.isEmpty) {
                return widget.validator;
              }
              return null;
            },
            controller: widget.textController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32),
                borderSide: BorderSide(
                  color: blueColor.withOpacity(0.5),
                  width: 1,
                ),
              ),
              hintText: widget.hintText,
              hintStyle: widget.isSearch
                  ? blueText.copyWith(
                      fontSize: 16,
                      fontWeight: regular,
                    )
                  : greyText.copyWith(
                      fontSize: 16,
                      fontWeight: regular,
                    ),
              suffixIcon: Visibility(
                visible: widget.isPassword,
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                  icon: Icon(
                    isObscure
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: greyColor,
                  ),
                ),
              ),
              prefixIcon:
                  widget.isSearch ? const Icon(Icons.search_rounded) : null,
              prefixIconColor: blueColor.withOpacity(0.5),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32),
                borderSide: BorderSide(
                  color: blueColor.withOpacity(0.5).withOpacity(0.5),
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32),
                borderSide: BorderSide(
                  color: blueColor.withOpacity(0.5),
                  width: 1,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32),
                borderSide: BorderSide(
                  color: redColor,
                  width: 1,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

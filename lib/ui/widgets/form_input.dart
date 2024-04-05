import 'package:flutter/material.dart';
import 'package:pasya/theme.dart';

class FormInput extends StatefulWidget {
  const FormInput({
    super.key,
    required this.textController,
    required this.hintText,
    required this.validator,
    required this.label,
    this.isPassword = false,
  });

  final TextEditingController textController;
  final bool isPassword;
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
            style: greyText.copyWith(fontSize: 12, fontWeight: regular),
            obscureText: widget.isPassword ? isObscure : false,
            obscuringCharacter: '*',
            cursorColor: blueColor,
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
                  color: blueColor,
                  width: 1,
                ),
              ),
              hintText: widget.hintText,
              hintStyle: greyText.copyWith(
                fontSize: 12,
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
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32),
                borderSide: BorderSide(
                  color: greyColor,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32),
                borderSide: BorderSide(
                  color: blueColor,
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

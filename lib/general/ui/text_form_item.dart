import 'dart:io';
import 'package:flutter/material.dart';
import 'package:metacards/general/const/app_colors.dart';
import 'package:metacards/general/utils/screen_adapt.dart';

const border = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(12.0)),
  borderSide: BorderSide(width: 1.0, color: AppColor.grey),
);

const borderError = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(12.0)),
  borderSide: BorderSide(
    width: 1.0,
    color: Colors.red,
  ),
);

const borderFocused = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(12.0)),
  borderSide: BorderSide(
    width: 1.0,
    color: AppColor.buttonColor,
  ),
);

class TextFormItem extends StatefulWidget {
  final TextInputType keyboardType;
  final List<String>? autofillHints;
  final String hintValue;
  final TextEditingController? controller;
  final String? value;
  final RegExp? pattern;
  final String? validationError;
  final int? minLines;
  final int? maxLines;
  final int? maxLength;
  final Function()? onEditingComplete;
  final bool isObscured;
  final bool isFocused;
  final bool isRequired;
  final Widget? suffixIcon;
  final EdgeInsetsGeometry padding;
  final TextCapitalization? textCapitalization;

  const TextFormItem({
    super.key,
    this.keyboardType = TextInputType.multiline,
    this.hintValue = '',
    this.value,
    this.pattern,
    this.validationError,
    this.minLines,
    this.maxLines,
    this.maxLength,
    this.onEditingComplete,
    this.controller,
    this.autofillHints,
    this.suffixIcon,
    this.isObscured = false,
    this.isFocused = false,
    this.isRequired = true,
    this.padding = const EdgeInsets.symmetric(horizontal: 0.2),
    this.textCapitalization,
  });

  @override
  State<TextFormItem> createState() => _TextFormItemState();
}

class _TextFormItemState extends State<TextFormItem> {
  final focusNode = FocusNode();
  bool wasChanged = false;
  late bool _passwordVisible;

  _TextFormItemState();

  @override
  void initState() {
    super.initState();
    _passwordVisible = widget.isObscured;
    widget.controller!.addListener(() {});
    focusNode.addListener(() {
      if (!focusNode.hasFocus) {
        if (Platform.isIOS) {
          widget.controller!.text = widget.controller!.text.trim();
        }
      }
    });
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: SizedBox(
        child: TextFormField(
          focusNode: focusNode,
          autovalidateMode: AutovalidateMode.disabled,
          controller: widget.controller,
          autofillHints: widget.autofillHints,
          textInputAction: TextInputAction.next,
          autofocus: widget.isFocused,
          cursorColor: AppColor.buttonColor,
          keyboardType: widget.keyboardType == TextInputType.number
              ? const TextInputType.numberWithOptions(
                  signed: true, decimal: true)
              : widget.keyboardType,
          validator: validate,
          onEditingComplete: widget.onEditingComplete,
          textCapitalization:
              widget.textCapitalization ?? TextCapitalization.none,
          onChanged: (_) {
            setState(() {
              wasChanged = true;
            });
          },
          obscureText: widget.isObscured && _passwordVisible,
          decoration: InputDecoration(
            //isDense: true,
            fillColor: Colors.white,
            suffixIconConstraints:
                BoxConstraints(minHeight: 40.a, minWidth: 40.0.a),
            suffixIcon: widget.isObscured
                ? InkWell(
                    child: Icon(
                      // Based on passwordVisible state choose the icon
                      _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: AppColor.grey, size: 24.0,
                    ),
                    onTap: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  )
                : widget.suffixIcon,
            isCollapsed: true,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 10.0.a, vertical: 15.0.a),
            hintText: widget.hintValue,
            errorStyle: wasChanged ? null : const TextStyle(height: 0),
            errorBorder: borderError,
            focusedErrorBorder: borderError,
            border: border,
            filled: true,
            enabledBorder: border,
            focusedBorder: borderFocused,
            counterText: '',
          ),
          minLines: widget.minLines ?? 1,
          maxLines: widget.maxLines ?? 1,
          maxLength: widget.maxLength,
        ),
      ),
    );
  }

  String? validate(String? value) {
    String? result;
    if (widget.pattern != null) {
      if (!widget.pattern!.hasMatch(value ?? '')) {
        result = widget.validationError ?? '';
      }
    }

    return result;
  }
}

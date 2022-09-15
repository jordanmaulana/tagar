import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/colors.dart';
import '../utils/v_constants.dart';
import 'texts.dart';

class VFormInput extends StatelessWidget {
  final String? label;
  final String? hint;
  final double radius;
  final bool obscure;
  final Color? fillColor;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final TextEditingController? controller;
  final bool enabled;
  final void Function(String?)? onChanged;
  final int? maxLines;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final Color? borderColor;
  final void Function(String?)? onSubmit;
  final void Function()? onTap;
  final bool autoFocus;

  const VFormInput({
    this.label,
    this.hint,
    this.radius = 12.0,
    this.obscure = false,
    this.suffixIcon,
    this.validator,
    this.onSaved,
    this.fillColor,
    this.controller,
    this.enabled = true,
    this.onChanged,
    this.maxLines,
    this.keyboardType,
    this.borderColor,
    this.onSubmit,
    this.onTap,
    this.textCapitalization = TextCapitalization.sentences,
    this.autoFocus = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autoFocus,
      onTap: onTap,
      style: GoogleFonts.poppins(),
      enabled: enabled,
      controller: controller,
      obscureText: obscure,
      validator: validator,
      onSaved: onSaved,
      onChanged: onChanged,
      maxLines: obscure ? 1 : maxLines,
      keyboardType: keyboardType,
      textCapitalization: textCapitalization,
      onFieldSubmitted: onSubmit,
      autocorrect: false,
      decoration: InputDecoration(
        label: VText(hint),
        suffixIcon: suffixIcon,
        // hintText: hint,
        fillColor: fillColor,
        filled: fillColor != null,
        hintStyle: GoogleFonts.poppins(fontSize: 14.0),
        focusedBorder: _border(color: Colors.blue, radius: radius),
        enabledBorder:
            _border(color: borderColor ?? VColor.searchText, radius: radius),
        errorBorder: _border(color: Colors.red, radius: radius),
        disabledBorder: _border(color: VColor.border, radius: radius),
        focusedErrorBorder: _border(color: VColor.red, radius: radius),
      ),
    );
  }

  _border({required Color color, required double radius}) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color),
      borderRadius: BorderRadius.all(Radius.circular(radius)),
    );
  }
}

class VDropdown<T> extends StatelessWidget {
  const VDropdown({
    Key? key,
    required this.dropdownItems,
    required this.onChanged,
    this.dropDownValue,
    this.label,
    this.focusNode,
    this.hint,
    this.validator,
    this.fillColor,
    this.borderColor,
  }) : super(key: key);

  final List<DropdownMenuItem<T>> dropdownItems;
  final void Function(T) onChanged;
  final T? dropDownValue;
  final String? hint;
  final String? label;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final Color? fillColor;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      style: GoogleFonts.inter(color: VColor.hint),
      focusNode: focusNode,
      isExpanded: true,
      hint: VText(hint, overflow: TextOverflow.ellipsis),
      decoration: InputDecoration(
        fillColor: fillColor,
        filled: fillColor != null,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor ?? VColor.border),
          borderRadius: BorderRadius.circular(8.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor ?? VColor.border),
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      items: dropdownItems,
      value: dropDownValue,
      icon: const Icon(Icons.arrow_drop_down),
      onChanged: <T>(value) => onChanged(value),
      isDense: true,
      dropdownColor: fillColor,
    );
  }
}

class VPhoneInput extends StatelessWidget {
  const VPhoneInput({
    Key? key,
    this.label,
    this.hint,
    this.controller,
    this.onCodeChanged,
    this.onChanged,
    this.dropDownValue,
    this.validation = true,
    this.keyLabel,
    this.onSaved,
    this.onTap,
    this.fillColor,
    this.borderColor,
  }) : super(key: key);

  final String? label;
  final TextEditingController? controller;
  final Function(String?)? onCodeChanged;
  final Function(String?)? onChanged;
  final String? dropDownValue;
  final bool validation;
  final String? keyLabel;
  final void Function(String?)? onSaved;
  final Function()? onTap;
  final Color? fillColor;
  final Color? borderColor;
  final String? hint;

  @override
  build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: DropdownButtonFormField(
            style: GoogleFonts.inter(color: VColor.hint),
            key: keyLabel != null ? Key('${keyLabel}_country_code') : null,
            isExpanded: true,
            validator: validation
                ? (value) {
                    if (value == null) {
                      return 'selectCC'.tr;
                    }
                    return null;
                  }
                : null,
            onTap: onTap,
            decoration: InputDecoration(
                fillColor: fillColor,
                filled: fillColor != null,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: borderColor ?? VColor.border),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: borderColor ?? VColor.border),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: VColor.red),
                )),
            value: dropDownValue,
            items: VConst.countryCodes,
            onChanged: onCodeChanged,
            dropdownColor: fillColor,
          ),
        ),
        const SizedBox(width: 8.0),
        Expanded(
          flex: 2,
          child: VFormInput(
            key: keyLabel != null ? Key('${keyLabel}_number') : null,
            keyboardType: TextInputType.number,
            validator: validation
                ? (value) {
                    if (value == null || value.isEmpty) {
                      return 'enterCN'.tr;
                    }
                    if (int.tryParse(value) == null || value.length < 8) {
                      return 'enterValidCN'.tr;
                    }
                    return null;
                  }
                : null,
            onSaved: onSaved,
            controller: controller,
            hint: hint,
            fillColor: fillColor,
            borderColor: borderColor,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}

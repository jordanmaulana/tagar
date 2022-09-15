import 'package:flutter/material.dart';

import '../utils/colors.dart';
import 'texts.dart';

class VButton extends StatelessWidget {
  final double? width;
  final double? height;
  final String label;
  final Color? textColor;
  final Color outlineColor;
  final Color boxColor;
  final bool enabled;
  final Function() onTap;

  const VButton(
    this.label, {
    this.width,
    this.height,
    this.textColor,
    this.enabled = true,
    this.outlineColor = Colors.blue,
    this.boxColor = Colors.blue,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width ?? double.infinity,
        height: height ?? 49.0,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(24.0)),
          border: Border.all(color: enabled ? outlineColor : boxColor),
          color: enabled ? boxColor : VColor.searchText,
        ),
        alignment: Alignment.center,
        child: VText(
          label,
          color: textColor ?? Colors.white,
          align: TextAlign.center,
        ),
      ),
    );
  }
}

class RedButton extends StatelessWidget {
  final String label;
  final Function() onTap;
  final bool enabled;
  final double? width;

  const RedButton({
    Key? key,
    required this.label,
    required this.onTap,
    this.enabled = true,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VButton(
      label,
      width: width,
      boxColor: enabled ? VColor.red : VColor.searchText,
      outlineColor: enabled ? VColor.red : VColor.searchText,
      onTap: () {
        if (enabled) onTap();
      },
      enabled: enabled,
    );
  }
}

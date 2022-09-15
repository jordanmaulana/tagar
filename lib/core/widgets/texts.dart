import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../utils/colors.dart';
import '../utils/utilities.dart';
import 'styles.dart';

class VText extends StatelessWidget {
  final String? title;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextOverflow? overflow;
  final TextAlign? align;
  final bool money;
  final bool number;
  final TextDecoration? decoration;
  final int? maxLines;
  final Color? color;

  const VText(
    this.title, {
    this.fontSize,
    this.fontWeight,
    this.overflow = TextOverflow.fade,
    this.money = false,
    this.number = false,
    this.decoration,
    this.maxLines,
    this.align,
    this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      (title != null && title != 'null')
          ? money
              ? 'Rp ${VUtils.parsePriceValue(int.parse(title ?? '0'))}'
              : number
                  ? VUtils.parsePriceValue(int.parse(title ?? '0'))
                  : title!
          : '',
      style: GoogleFonts.poppins(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        decoration: decoration,
      ),
      overflow: overflow,
      textAlign: align,
      maxLines: maxLines,
    );
  }
}

class AppBarText extends StatelessWidget {
  final String title;
  final Color color;

  const AppBarText(this.title, {this.color = Colors.white, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VText(
      title,
      fontSize: 18.0,
      color: color,
    );
  }
}

class LabelText extends StatelessWidget {
  final String? text;

  const LabelText(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8.0),
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: VStyle.corner(color: VColor.dark),
      child: VText(
        text,
        color: Colors.white,
        fontSize: 12.0,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class VersionText extends StatefulWidget {
  final bool onlyVersion;

  const VersionText({this.onlyVersion = false, Key? key}) : super(key: key);

  @override
  _VersionTextState createState() => _VersionTextState();
}

class _VersionTextState extends State<VersionText> {
  PackageInfo? info;

  @override
  void initState() {
    getInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String version = '${'version'.tr} ${info?.version ?? ''}';
    return VText(
      version,
      align: TextAlign.center,
    );
  }

  getInfo() async {
    info = await PackageInfo.fromPlatform();
    setState(() {});
  }
}

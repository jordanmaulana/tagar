import 'package:flutter/material.dart';

import '../utils/colors.dart';

class VLoading extends StatelessWidget {
  final Color? color;

  const VLoading({this.color = VColor.red, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator(color: color));
  }
}

class NextPageLoading extends StatelessWidget {
  const NextPageLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      bottom: 16.0,
      left: 0.0,
      right: 0.0,
      child: LinearProgressIndicator(color: Colors.blue),
    );
  }
}

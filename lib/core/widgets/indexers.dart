import 'package:flutter/material.dart';

import '../utils/colors.dart';

class CarouselIndex extends StatelessWidget {
  final int active, index;

  const CarouselIndex(this.active, this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool active = this.active == index;
    return AnimatedContainer(
      width: active ? 12.0 : 10.0,
      height: active ? 12.0 : 10.0,
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
      decoration: BoxDecoration(
        border: Border.all(color: VColor.bottomGrey, width: 0.4),
        shape: BoxShape.circle,
        color: active ? VColor.red : const Color.fromRGBO(0, 0, 0, 0.4),
      ),
      duration: const Duration(milliseconds: 200),
    );
  }
}

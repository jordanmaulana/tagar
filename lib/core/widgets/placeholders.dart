import 'package:flutter/material.dart';

import 'texts.dart';

class VError extends StatelessWidget {
  final String errorMsg;

  const VError(this.errorMsg, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: VText(errorMsg, align: TextAlign.center),
      ),
    );
  }
}

class NoData extends StatelessWidget {
  const NoData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: VText('Tidak ada data'),
    );
  }
}

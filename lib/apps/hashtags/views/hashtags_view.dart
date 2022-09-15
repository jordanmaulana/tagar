import 'package:flutter/material.dart';

import '../../../core/widgets/texts.dart';

class HashtagsView extends StatelessWidget {
  const HashtagsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const VText('Tagar')),
    );
  }
}

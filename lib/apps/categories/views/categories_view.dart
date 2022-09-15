import 'package:flutter/material.dart';

import '../../../core/widgets/texts.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const VText('Kategori')),
    );
  }
}

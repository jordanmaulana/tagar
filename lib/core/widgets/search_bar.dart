import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'styles.dart';

class SearchBar extends StatefulWidget {
  final TextEditingController searchController;
  final void Function() onClear;
  final void Function(String?)? onSubmit;

  const SearchBar(
      {required this.searchController,
      required this.onClear,
      this.onSubmit,
      Key? key})
      : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.searchController,
      decoration: VStyle.boxSearch(
        hintText: 'searchHint'.tr,
        onClear: widget.onClear,
        useSuffix: widget.searchController.text.isNotEmpty,
      ),
      onChanged: (v) => setState(() {}),
      style: const TextStyle(color: Colors.white),
      onFieldSubmitted: widget.onSubmit,
    );
  }
}

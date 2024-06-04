import 'package:classified_apps/apps/core/utils/constants.dart';
import 'package:classified_apps/apps/views/ad_post/controller/ad_post_controller.dart';
import 'package:flutter/material.dart';

class FashionField extends StatefulWidget {
  const FashionField({super.key, required this.controller});
  final AdPostController controller;

  @override
  State<FashionField> createState() => _FashionFieldState();
}

class _FashionFieldState extends State<FashionField> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 16,
        ),
        const Text(
          "Size",
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(
          height: 7,
        ),
        DropdownButtonFormField(
          decoration: const InputDecoration(
            hintText: "Select Size",
          ),
          items: sizeList.map<DropdownMenuItem<String>>((e) {
            return DropdownMenuItem(
              value: e,
              child: Text(e),
            );
          }).toList(),
          onChanged: (value) {
            widget.controller.selectedSize = value.toString();
          },
        )
      ],
    );
  }
}

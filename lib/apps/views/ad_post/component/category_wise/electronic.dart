import 'package:classified_apps/apps/views/ad_post/controller/ad_post_controller.dart';
import 'package:classified_apps/apps/views/home/models/brand_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ElectronicField extends StatefulWidget {
  const ElectronicField({super.key, required this.controller});

  final AdPostController controller;

  @override
  State<ElectronicField> createState() => _ElectronicFieldState();
}

class _ElectronicFieldState extends State<ElectronicField> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.controller.getModel();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        const Text(
          "Brand",
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 7),
        DropdownButtonFormField(
          isExpanded: true,
          decoration: const InputDecoration(hintText: "Select Brand"),
          value: widget.controller.brandModel,
          items: widget.controller.brandList
              .map<DropdownMenuItem<BrandModel>>((e) {
            return DropdownMenuItem(
              value: e,
              child: Text(e.name),
            );
          }).toList(),
          onChanged: (value) {
            widget.controller.getModel();
            Future.delayed(const Duration(milliseconds: 300)).then(
              (value2) {
                widget.controller.selectedBrand = value?.id.toString() ?? "";
              },
            );
          },
        ),
        const SizedBox(height: 16),
        const Text(
          "Model",
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 7),
        Obx(
          () => DropdownButtonFormField(
            isExpanded: true,
            decoration: const InputDecoration(
              hintText: "Select Model",
            ),
            value: widget.controller.model,
            items:
                widget.controller.modelList.map<DropdownMenuItem<Model>>((e) {
              return DropdownMenuItem(
                value: e,
                child: Text(e.name),
              );
            }).toList(),
            onChanged: (value) {
              Future.delayed(const Duration(milliseconds: 300)).then(
                (value2) {
                  widget.controller.selectedModel = value?.id.toString() ?? "";
                },
              );
            },
          ),
        )
      ],
    );
  }
}

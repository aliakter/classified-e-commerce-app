import 'package:classified_apps/apps/core/utils/constants.dart';
import 'package:classified_apps/apps/views/ad_post/controller/ad_post_controller.dart';
import 'package:classified_apps/apps/views/home/models/brand_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MobileField extends StatefulWidget {
  const MobileField({Key? key, required this.controller}) : super(key: key);
  final AdPostController controller;

  @override
  State<MobileField> createState() => _MobileFieldState();
}

class _MobileFieldState extends State<MobileField> {

  @override
  void initState() {
    widget.controller.getModel();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 16,
        ),
        const Text(
          "Authenticity",
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(
          height: 7,
        ),

        Wrap(
          alignment: WrapAlignment.start,
          // runSpacing: 12,
          // spacing: 10,
          children: [
            GestureDetector(
              onTap: (){
                setState(() {
                  widget.controller.selectedAuthenticity = "original";
                });
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Radio(
                    activeColor: redColor,
                    value: "original",
                    groupValue: widget.controller.selectedAuthenticity,
                    onChanged: (value){
                      setState(() {
                        widget.controller.selectedAuthenticity = value.toString();
                      });
                    },
                  ),
                  const Text("Original"),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  widget.controller.selectedAuthenticity = "refurbished";
                });
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Radio(
                    activeColor: redColor,
                    value: "refurbished",
                    groupValue: widget.controller.selectedAuthenticity,
                    onChanged: (value){
                      setState(() {
                        widget.controller.selectedAuthenticity = value.toString();
                      });
                    },
                  ),
                  const Text("Refurbished"),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
          ],
        ),

        const SizedBox(
          height: 16,
        ),
        const Text(
          "Brand",
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(
          height: 7,
        ),
        DropdownButtonFormField(
          isExpanded: true,
          decoration: const InputDecoration(
            hintText: "Select Brand",
          ),
          value: widget.controller.brandModel,
          items:
          widget.controller.brandList.map<DropdownMenuItem<BrandModel>>((e) {
            return DropdownMenuItem(
              value: e,
              child: Text(e.name),
            );
          }).toList(),
          onChanged: (value) {
            widget.controller.getModel();
            Future.delayed(const Duration(milliseconds: 300)).then(
                  (value2) {
                widget.controller.selectedBrand = value?.id.toString()??"";
              },
            );
          },
        ),
        const SizedBox(
          height: 16,
        ),
        const Text(
          "Model",
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(
          height: 7,
        ),
        Obx(() => DropdownButtonFormField(
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
                widget.controller.selectedModel = value?.id.toString()??"";
              },
            );
          },
        ),),
        const SizedBox(height: 16),
        const Text("Ram"),
        const SizedBox(height: 7,),
        DropdownButtonFormField(
          decoration: const InputDecoration(
            hintText: "Select Ram",
          ),
          items: ramList.map<DropdownMenuItem<String>>((e) {
            return DropdownMenuItem(
              value: e,
              child: Text(e),
            );
          }).toList(),
          onChanged: (value) {
            widget.controller.selectedRam = value.toString();
          },
        ),

        const SizedBox(height: 16),
        const Text("Edition"),
        const SizedBox(height: 7,),
        TextFormField(
          keyboardType: TextInputType.text,
          controller: widget.controller.editionController,
          textInputAction: TextInputAction.next,
          // validator: (value) {
          //   if (value == null || value.isEmpty) {
          //     return null;
          //   }
          //   return null;
          // },
          // onChanged: (value) => postAdBloc.add(NewPostAdEventAddress(value)),
          decoration: const InputDecoration(hintText: "Edition"),
        ),

      ],
    );
  }
}

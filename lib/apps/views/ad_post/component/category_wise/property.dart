import 'package:classified_apps/apps/core/utils/constants.dart';
import 'package:classified_apps/apps/views/ad_post/controller/ad_post_controller.dart';
import 'package:flutter/material.dart';

class PropertyField extends StatefulWidget {
  const PropertyField({super.key, required this.controller});

  final AdPostController controller;

  @override
  State<PropertyField> createState() => _PropertyFieldState();
}

class _PropertyFieldState extends State<PropertyField> {
  String size = propertySizeList[0];
  String price = propertyPriceList[0];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        const Text(
          "Property Type",
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 7),
        Wrap(
          alignment: WrapAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  widget.controller.selectedPropertyType = "agricultural";
                });
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Radio(
                    activeColor: redColor,
                    value: "agricultural",
                    groupValue: widget.controller.selectedPropertyType,
                    onChanged: (value) {
                      setState(() {
                        widget.controller.selectedPropertyType =
                            value.toString();
                      });
                    },
                  ),
                  const Text("Agricultural"),
                  const SizedBox(width: 10),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  widget.controller.selectedPropertyType = "residential";
                });
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Radio(
                    activeColor: redColor,
                    value: "residential",
                    groupValue: widget.controller.selectedPropertyType,
                    onChanged: (value) {
                      setState(() {
                        widget.controller.selectedPropertyType =
                            value.toString();
                      });
                    },
                  ),
                  const Text("Residential"),
                  const SizedBox(width: 10),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  widget.controller.selectedPropertyType = "commercial";
                });
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Radio(
                    activeColor: redColor,
                    value: "commercial",
                    groupValue: widget.controller.selectedPropertyType,
                    onChanged: (value) {
                      setState(() {
                        widget.controller.selectedPropertyType =
                            value.toString();
                      });
                    },
                  ),
                  const Text("Commercial"),
                  const SizedBox(width: 10),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  widget.controller.selectedPropertyType = "other";
                });
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Radio(
                    activeColor: redColor,
                    value: "other",
                    groupValue: widget.controller.selectedPropertyType,
                    onChanged: (value) {
                      setState(() {
                        widget.controller.selectedPropertyType =
                            value.toString();
                      });
                    },
                  ),
                  const Text("Other"),
                  const SizedBox(width: 10),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text(
          "Size",
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 7),
        Row(
          children: [
            Expanded(
              flex: 3,
              child: TextFormField(
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                controller: widget.controller.sizeController,
                onChanged: (value) {},
                decoration: const InputDecoration(
                  hintText: "What's the size of your land?",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: ashColor),
                      borderRadius:
                          BorderRadius.horizontal(left: Radius.circular(4))),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ashColor),
                      borderRadius:
                          BorderRadius.horizontal(left: Radius.circular(4))),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ashColor),
                      borderRadius:
                          BorderRadius.horizontal(left: Radius.circular(4))),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: DropdownButtonFormField(
                value: size,
                decoration: const InputDecoration(
                  fillColor: ashColor,
                  filled: true,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius:
                          BorderRadius.horizontal(right: Radius.circular(4))),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius:
                          BorderRadius.horizontal(right: Radius.circular(4))),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius:
                          BorderRadius.horizontal(right: Radius.circular(4))),
                ),
                items: propertySizeList.map<DropdownMenuItem<String>>((e) {
                  return DropdownMenuItem(
                    value: e,
                    child: Text(e),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    size = value!;
                    widget.controller.selectedPropertySize = value.toString();
                  });
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text("Bedroom"),
        const SizedBox(height: 7),
        TextFormField(
          keyboardType: TextInputType.text,
          controller: widget.controller.bedroomController,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(hintText: "Enter Bedroom"),
        ),
        const SizedBox(height: 16),
        const Text("Property Location"),
        const SizedBox(height: 7),
        TextFormField(
          keyboardType: TextInputType.text,
          controller: widget.controller.propertyLocationController,
          textInputAction: TextInputAction.next,
          decoration:
              const InputDecoration(hintText: "Enter property location"),
        ),
        const SizedBox(height: 16),
        const Text(
          "Price",
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 7),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: TextFormField(
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                controller: widget.controller.propertyPriceController,
                onChanged: (value) {},
                decoration: const InputDecoration(
                  hintText: "Property price",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: ashColor),
                      borderRadius:
                          BorderRadius.horizontal(left: Radius.circular(4))),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ashColor),
                      borderRadius:
                          BorderRadius.horizontal(left: Radius.circular(4))),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ashColor),
                      borderRadius:
                          BorderRadius.horizontal(left: Radius.circular(4))),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: DropdownButtonFormField(
                value: price,
                decoration: const InputDecoration(
                  fillColor: ashColor,
                  filled: true,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius:
                          BorderRadius.horizontal(right: Radius.circular(4))),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius:
                          BorderRadius.horizontal(right: Radius.circular(4))),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius:
                          BorderRadius.horizontal(right: Radius.circular(4))),
                ),
                items: propertyPriceList.map<DropdownMenuItem<String>>((e) {
                  return DropdownMenuItem(
                    value: e,
                    child: Text(e),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    price = value!;
                    widget.controller.selectedPropertyPrice = value.toString();
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}

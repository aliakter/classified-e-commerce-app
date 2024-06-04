import 'package:classified_apps/apps/core/utils/constants.dart';
import 'package:classified_apps/apps/views/ads_edit/controller/ad_edit_controller.dart';
import 'package:classified_apps/apps/views/home/models/brand_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VehiclesField extends StatefulWidget {
  const VehiclesField({super.key, required this.controller});

  final AdEditController controller;

  @override
  State<VehiclesField> createState() => _VehiclesFieldState();
}

class _VehiclesFieldState extends State<VehiclesField> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.controller.getModel();
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
              widget.controller.selectedBrand = value?.id.toString() ?? "";
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
      Obx(
        () => DropdownButtonFormField(
          isExpanded: true,
          decoration: const InputDecoration(
            hintText: "Select Model",
          ),
          value: widget.controller.model,
          items: widget.controller.modelList.map<DropdownMenuItem<Model>>((e) {
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
      ),
      const SizedBox(height: 16),
      const Text("Trim Edition"),
      const SizedBox(
        height: 7,
      ),
      TextFormField(
        keyboardType: TextInputType.text,
        controller: widget.controller.trimEditionController,
        textInputAction: TextInputAction.next,
        // validator: (value) {
        //   if (value == null || value.isEmpty) {
        //     return null;
        //   }
        //   return null;
        // },
        // onChanged: (value) => postAdBloc.add(NewPostAdEventAddress(value)),
        decoration: const InputDecoration(hintText: "Trim Edition"),
      ),
      const SizedBox(height: 16),
      const Text("Manufacture year"),
      const SizedBox(
        height: 7,
      ),
      TextFormField(
        keyboardType: TextInputType.text,
        controller: widget.controller.manufactureYearController,
        textInputAction: TextInputAction.next,
        // validator: (value) {
        //   if (value == null || value.isEmpty) {
        //     return null;
        //   }
        //   return null;
        // },
        // onChanged: (value) => postAdBloc.add(NewPostAdEventAddress(value)),
        decoration: const InputDecoration(hintText: "Manufacture year"),
      ),
      const SizedBox(height: 16),
      const Text("Engine capacity"),
      const SizedBox(
        height: 7,
      ),
      TextFormField(
        keyboardType: TextInputType.text,
        controller: widget.controller.engineCapacityController,
        textInputAction: TextInputAction.next,
        // validator: (value) {
        //   if (value == null || value.isEmpty) {
        //     return null;
        //   }
        //   return null;
        // },
        // onChanged: (value) => postAdBloc.add(NewPostAdEventAddress(value)),
        decoration: const InputDecoration(hintText: "Engine capacity"),
      ),
      const SizedBox(height: 16),
      const Text(
        "Fuel type",
        style: TextStyle(fontSize: 16),
      ),
      const SizedBox(height: 7),
      Wrap(
        alignment: WrapAlignment.start,
        children: [
          ...List.generate(fuelTypeList.length, (index) {
            return GestureDetector(
              onTap: () {
                if (widget.controller.fuelTypes
                    .any((element) => element == fuelTypeList[index]["name"])) {
                  widget.controller.fuelTypes
                      .remove(fuelTypeList[index]["name"].toString().trim());
                } else {
                  widget.controller.fuelTypes
                      .add(fuelTypeList[index]["name"].toString().trim());
                }
                print(widget.controller.fuelTypes);
                setState(() {});
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(
                      activeColor: redColor,
                      side: const BorderSide(color: redColor, width: 2),
                      value: widget.controller.fuelTypes.any(
                          (element) => element == fuelTypeList[index]["name"]),
                      onChanged: (value) {
                        if (value!) {
                          widget.controller.fuelTypes.add(
                              fuelTypeList[index]["name"].toString().trim());
                        } else {
                          widget.controller.fuelTypes.remove(
                              fuelTypeList[index]["name"].toString().trim());
                        }
                        print(widget.controller.fuelTypes);
                        setState(() {});
                      }),
                  const SizedBox(
                    width: 0,
                  ),
                  Text(index != 2 && index != 6
                      ? fuelTypeList[index]['name']![0]
                              .toString()
                              .toUpperCase()
                              .trim() +
                          fuelTypeList[index]['name']
                              .toString()
                              .substring(1)
                              .trim()
                      : fuelTypeList[index]['name']
                          .toString()
                          .toUpperCase()
                          .trim()),
                ],
              ),
            );
          })
        ],
      ),
      const SizedBox(
        height: 16,
      ),
      const Text(
        "Transmission",
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
            onTap: () {
              setState(() {
                widget.controller.selectedTransmission = "manual";
              });
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Radio(
                  activeColor: redColor,
                  value: "manual",
                  groupValue: widget.controller.selectedTransmission,
                  onChanged: (value) {
                    setState(() {
                      widget.controller.selectedTransmission = value.toString();
                    });
                  },
                ),
                const Text("Manual"),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                widget.controller.selectedTransmission = "automatic";
              });
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Radio(
                  activeColor: redColor,
                  value: "automatic",
                  groupValue: widget.controller.selectedTransmission,
                  onChanged: (value) {
                    setState(() {
                      widget.controller.selectedTransmission = value.toString();
                    });
                  },
                ),
                const Text("Automatic"),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                widget.controller.selectedTransmission = "other_transmission";
              });
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Radio(
                  activeColor: redColor,
                  value: "other_transmission",
                  groupValue: widget.controller.selectedTransmission,
                  onChanged: (value) {
                    setState(() {
                      widget.controller.selectedTransmission = value.toString();
                    });
                  },
                ),
                const Text("Other transmission"),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
        ],
      ),
      const SizedBox(height: 16),
      const Text("Body Type"),
      const SizedBox(
        height: 7,
      ),
      DropdownButtonFormField(
        decoration: const InputDecoration(
          hintText: "Select Body Type",
        ),
        items: vehicleBodyTypeList.map<DropdownMenuItem<String>>((e) {
          return DropdownMenuItem(
            value: e,
            child: Text(e),
          );
        }).toList(),
        onChanged: (value) {
          widget.controller.selectedBodyType = value.toString();
        },
      ),
      const SizedBox(height: 16),
      const Text("Registration year"),
      const SizedBox(
        height: 7,
      ),
      TextFormField(
        keyboardType: TextInputType.text,
        controller: widget.controller.registrationYearController,
        textInputAction: TextInputAction.next,
        // validator: (value) {
        //   if (value == null || value.isEmpty) {
        //     return null;
        //   }
        //   return null;
        // },
        // onChanged: (value) => postAdBloc.add(NewPostAdEventAddress(value)),
        decoration: const InputDecoration(hintText: "Registration year"),
      ),
    ]);
  }
}

import 'dart:io';

import 'package:classified_apps/apps/core/utils/constants.dart';
import 'package:classified_apps/apps/views/ads_edit/controller/ad_edit_controller.dart';
import 'package:classified_apps/apps/views/home/models/service_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class JobsField extends StatefulWidget {
  const JobsField({Key? key, required this.controller}) : super(key: key);
  final AdEditController controller;

  @override
  State<JobsField> createState() => _JobsFieldState();
}

class _JobsFieldState extends State<JobsField> {
  String jobType = jobTypeList[0];
  String education = educationList[0];
  bool applicationAlertEmail = true;
  bool applicationAlertPhone = true;

  String groupValue = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 16,
        ),
        const Text(
          "Designation",
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(
          height: 7,
        ),
        DropdownButtonFormField(
          isExpanded: true,
          decoration: const InputDecoration(
            hintText: "Select Designation",
          ),
          items: widget.controller.homeController.homeModel?.designations
              .map<DropdownMenuItem<ServiceTypeModel>>((e) {
            return DropdownMenuItem(
              value: e,
              child: Text(e.name),
            );
          }).toList(),
          onChanged: (value) {
            Future.delayed(const Duration(milliseconds: 300)).then(
              (value2) {
                widget.controller.selectedDesignation =
                    value?.name.toString() ?? "";
              },
            );
          },
        ),
        const SizedBox(
          height: 16,
        ),
        const Text(
          "Job type",
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(
          height: 7,
        ),
        DropdownButtonFormField(
          // validator: (value) {
          //   if (value == null) {
          //     return null;
          //   }
          //   return null;
          // },
          decoration: const InputDecoration(
            hintText: "Select job type",
          ),
          items: jobTypeList.map<DropdownMenuItem<String>>((e) {
            return DropdownMenuItem(
              value: e,
              child: Text(e),
            );
          }).toList(),
          onChanged: (value) {
            jobType = value!;
            widget.controller.selectedJobType = value;
          },
        ),
        const SizedBox(
          height: 16,
        ),
        const Text(
          "How do you want to receive applications?",
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(
          height: 7,
        ),
        Row(
          children: [
            SizedBox(
              width: 30,
              height: 24,
              child: Obx(() => Checkbox(
                    value: widget.controller.receiveIsEmail.value,
                    onChanged: (value) {
                      widget.controller.receiveIsEmail.value =
                          !widget.controller.receiveIsEmail.value;
                    },
                    activeColor: const Color(0xFF0b5ed7),
                  )),
            ),
            const SizedBox(
              width: 0,
            ),
            const Text(
              "Email and employer dashboard",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: 30,
              height: 24,
              child: Obx(() => Checkbox(
                  value: widget.controller.receiveIsPhone.value,
                  onChanged: (value) {
                    widget.controller.receiveIsPhone.value =
                        !widget.controller.receiveIsPhone.value;
                  },
                  activeColor: const Color(0xFF0b5ed7))),
            ),
            const SizedBox(
              width: 0,
            ),
            const Text(
              "Employer Phone",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Obx(
          () => Visibility(
            visible: widget.controller.receiveIsEmail.value,
            maintainAnimation: true,
            maintainState: true,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 1000),
              curve: Curves.fastOutSlowIn,
              opacity: widget.controller.receiveIsEmail.value ? 1 : 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Employer email",
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    // initialValue: state.phone,
                    controller: widget.controller.employerEmailController,
                    textInputAction: TextInputAction.next,
                    // validator: (value) {
                    //   if (value == null && state.isShowEmail) {
                    //     return 'Enter Email Address';
                    //   }
                    //   return null;
                    // },
                    decoration: const InputDecoration(hintText: "Email"),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
          ),
        ),
        Obx(
          () => Visibility(
            visible: widget.controller.receiveIsPhone.value,
            maintainAnimation: true,
            maintainState: true,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 1000),
              curve: Curves.fastOutSlowIn,
              opacity: widget.controller.receiveIsPhone.value ? 1 : 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Phone",
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    // initialValue: state.phone,
                    controller: widget.controller.employerPhoneController,
                    textInputAction: TextInputAction.next,
                    // validator: (value) {
                    //   if (value == null && state.isShowPhone) {
                    //     return 'Enter Phone Number';
                    //   }
                    //   return null;
                    // },
                    decoration: const InputDecoration(hintText: "Phone"),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
          ),
        ),
        const Text(
          "Required work experience (years)",
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(
          height: 7,
        ),
        TextFormField(
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.number,
          controller: widget.controller.experienceController,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          // validator: (value) {
          //   if (value == "") {
          //     return null;
          //   }
          //   return null;
          // },
          onChanged: (value) {},
          decoration: const InputDecoration(
            hintText: "Years",
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const Text(
          "Required Education",
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(
          height: 7,
        ),
        DropdownButtonFormField(
          // validator: (value) {
          //   if (value == null) {
          //     return null;
          //   }
          //   return null;
          // },
          decoration: const InputDecoration(
            hintText: "Select education",
          ),
          items: educationList.map<DropdownMenuItem<String>>((e) {
            return DropdownMenuItem(
              value: e,
              child: Text(e),
            );
          }).toList(),
          onChanged: (value) {
            education = value!;
            widget.controller.selectedEducation = value;
          },
        ),
        const SizedBox(
          height: 16,
        ),
        const Text(
          "Salary per month",
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(
          height: 7,
        ),
        const Row(
          children: [
            Expanded(
              child: Text(
                "From",
                style: TextStyle(fontSize: 16),
              ),
            ),
            Expanded(
              child: Text(
                "To",
                style: TextStyle(fontSize: 16),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 7,
        ),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                controller: widget.controller.salaryFromController,
                // validator: (value) {
                //   if (value == "") {
                //     return null;
                //   }
                //   return null;
                // },
                onChanged: (value) {},
                decoration: const InputDecoration(
                  hintText: "From",
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: TextFormField(
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                controller: widget.controller.salaryToController,
                // validator: (value) {
                //   if (value == "") {
                //     return null;
                //   }
                //   return null;
                // },
                onChanged: (value) {},
                decoration: const InputDecoration(
                  hintText: "To",
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        const Text(
          "Application deadline",
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(
          height: 7,
        ),
        TextFormField(
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.datetime,
          controller: widget.controller.expiryDateController,
          // validator: (value) {
          //   if (value == "") {
          //     return null;
          //   }
          //   return null;
          // },
          onChanged: (value) {},
          readOnly: true,
          onTap: () {
            widget.controller.chooseDate(context);
          },
          decoration: const InputDecoration(
            hintText: "MM/DD/YYYY",
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const Text(
          "Employer Name",
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(
          height: 7,
        ),
        TextFormField(
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.name,
          controller: widget.controller.employerNameController,
          // validator: (value) {
          //   if (value == "") {
          //     return null;
          //   }
          //   return null;
          // },
          onChanged: (value) {},
          decoration: const InputDecoration(
            hintText: "Employer Name",
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const Text(
          "Employer Website",
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(
          height: 7,
        ),
        TextFormField(
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.url,
          controller: widget.controller.webSiteController,
          // validator: (value) {
          //   if (value == "") {
          //     return null;
          //   }
          //   return null;
          // },
          onChanged: (value) {},
          decoration: const InputDecoration(
            hintText: "Employer Website",
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: SizedBox(
              height: 50,
              child: OutlinedButton.icon(
                onPressed: () {
                  widget.controller.pickLogoImage().then((value) {
                    if (value != null) {
                      setState(() {});
                    }
                  });
                },
                icon: const Icon(Icons.add),
                label: const Text("Attach Logo"),
              ),
            )),
            Expanded(
              child: widget.controller.logoImage == null
                  ? const SizedBox()
                  : Center(
                      child: SizedBox(
                        height: 70,
                        width: 70,
                        child: Image(
                          // image: FileImage(File(controller.images2![index].path))
                          image: FileImage(
                              File(widget.controller.logoImage!.path)),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
            )
          ],
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}

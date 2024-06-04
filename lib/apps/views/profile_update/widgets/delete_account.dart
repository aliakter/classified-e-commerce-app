import 'package:classified_apps/apps/core/utils/constants.dart';
import 'package:classified_apps/apps/core/utils/utils.dart';
import 'package:classified_apps/apps/views/profile_update/controller/profile_update_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../splash/localization/app_localizations.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';

class DeleteAccount extends StatelessWidget {
  const DeleteAccount({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileUpdateController controller = Get.find();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.transparent),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 6,
              offset: const Offset(0, 5))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context).translate('delete_account')!,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          Text(
            AppLocalizations.of(context).translate('delete_account_alert')!,
            style: const TextStyle(color: Colors.black45),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 48,
            child: ElevatedButton(
              style: OutlinedButton.styleFrom(
                elevation: 5,
                shadowColor: Colors.grey.shade300,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Obx(
                () => controller.isAcDeleteLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(color: Colors.white))
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.delete, color: Colors.red),
                          const SizedBox(width: 10),
                          Text(
                            AppLocalizations.of(context)
                                .translate('delete_account')!,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
              ),
              onPressed: () {
                showUserDeleteDialog(context, controller);
              },
            ),
          )
        ],
      ),
    );
  }

  void showUserDeleteDialog(context, ProfileUpdateController controller) async {
    showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      curve: Curves.easeInOut,
      alignment: Alignment.center,
      animationType: DialogTransitionType.scale,
      duration: const Duration(milliseconds: 500),
      builder: (context) {
        return Dialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16))),
          child: SingleChildScrollView(
            child: Container(
              height: Get.height / 3.3,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Confirm Account Deletion",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Divider(color: Colors.grey),
                    Text(
                      "If you DELETE this account all data will be lost permanently from our application!",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.red.shade600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: Get.height / 14,
                      child: TextFormField(
                        controller: controller.deleteController,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Please type Delete",
                          contentPadding: const EdgeInsets.only(
                              top: 20, left: 10, right: 10),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: redColor),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                            BorderSide(color: Colors.grey.shade400),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                            BorderSide(color: Colors.grey.shade400),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 35,
                            width: 80,
                            padding: const EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(
                              child: Text(
                                'Cancel',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            if (controller
                                .deleteController.text.isNotEmpty) {
                              if (controller.deleteController.text ==
                                  "Delete") {
                                Navigator.pop(context);
                                controller.deleteAccount();
                              } else {
                                Utils.toastMsg("key does not match");
                              }
                            } else {
                              Utils.toastMsg("Please type Delete");
                            }
                          },
                          child: Container(
                            height: 35,
                            width: 55,
                            padding: const EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              color: redColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(
                              child: Text(
                                'Ok',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

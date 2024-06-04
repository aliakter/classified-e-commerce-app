import 'package:classified_apps/apps/views/profile_update/controller/profile_update_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../splash/localization/app_localizations.dart';

class ChangePassEdit extends StatelessWidget {
  const ChangePassEdit({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileUpdateController controller = Get.find();
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context).translate('change_password')!,
            textAlign: TextAlign.left,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Text(
                AppLocalizations.of(context).translate('current_password')!,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                textAlign: TextAlign.left,
              ),
              const Text(
                "*",
                style: TextStyle(color: Colors.red),
              )
            ],
          ),
          const SizedBox(height: 5),
          Obx(
            () => TextFormField(
              controller: controller.currentPassCtr,
              keyboardType: TextInputType.visiblePassword,
              obscureText: controller.obscureText.value,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)
                      .translate('current_password')!,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      controller.toggle();
                    },
                    child: controller.obscureText.value
                        ? const Icon(
                            Icons.visibility_off,
                            color: Colors.black87,
                          )
                        : const Icon(
                            Icons.visibility,
                            color: Colors.black87,
                          ),
                  )),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(
                AppLocalizations.of(context).translate('new_password')!,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                textAlign: TextAlign.left,
              ),
              const Text(
                "*",
                style: TextStyle(color: Colors.red),
              )
            ],
          ),
          const SizedBox(height: 5),
          Obx(
            () => TextFormField(
              controller: controller.newPassCtr,
              keyboardType: TextInputType.visiblePassword,
              obscureText: controller.obscureNewText.value,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                hintText:
                    AppLocalizations.of(context).translate('new_password')!,
                suffixIcon: GestureDetector(
                  onTap: () {
                    controller.toggleNew();
                  },
                  child: controller.obscureNewText.value
                      ? const Icon(
                          Icons.visibility_off,
                          color: Colors.black87,
                        )
                      : const Icon(
                          Icons.visibility,
                          color: Colors.black87,
                        ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(
                AppLocalizations.of(context).translate('confirm_password')!,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                textAlign: TextAlign.left,
              ),
              const Text(
                "*",
                style: TextStyle(color: Colors.red),
              )
            ],
          ),
          const SizedBox(height: 5),
          Obx(
            () => TextFormField(
              controller: controller.confirmPassCtr,
              keyboardType: TextInputType.visiblePassword,
              obscureText: controller.obscureConfirmText.value,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                hintText:
                    AppLocalizations.of(context).translate('confirm_password')!,
                suffixIcon: GestureDetector(
                  onTap: () {
                    controller.toggleConfirm();
                  },
                  child: controller.obscureConfirmText.value
                      ? const Icon(
                          Icons.visibility_off,
                          color: Colors.black87,
                        )
                      : const Icon(
                          Icons.visibility,
                          color: Colors.black87,
                        ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 48,
            child: Obx(() {
              return ElevatedButton(
                style: OutlinedButton.styleFrom(
                  elevation: 5,
                  shadowColor: Colors.grey.shade300,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  controller.changePassword();
                },
                child: controller.isPasswordChangeLoading.value
                    ? const Center(child: CircularProgressIndicator(color: Colors.white))
                    : Text(
                        AppLocalizations.of(context).translate('save_changes')!,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500)),
              );
            }),
          )
        ],
      ),
    );
  }
}

import 'dart:io';
import 'package:classified_apps/apps/data/remote_urls.dart';
import 'package:classified_apps/apps/views/profile_update/controller/profile_update_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import '../../../core/utils/constants.dart';
import '../../../core/utils/custom_image.dart';
import '../../splash/localization/app_localizations.dart';

class BasicInfoEdit extends StatelessWidget {
  final ProfileUpdateController controller;

  const BasicInfoEdit({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
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
            AppLocalizations.of(context).translate('account_information')!,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 16),
          Center(
            child: SizedBox(
              height: 140,
              width: 140,
              child: Stack(
                children: [
                  Obx(
                    () => Container(
                      height: 140,
                      width: 140,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: redColor, width: 4),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              blurRadius: 16,
                              offset: const Offset(0, 0)),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: controller.image.value == ""
                            ? CustomImage(
                                path:
                                    "${RemoteUrls.rootUrl}${controller.profileUrl.value}",
                                height: 140,
                                width: 140,
                                fit: BoxFit.cover,
                              )
                            : Image(
                                fit: BoxFit.cover,
                                image: FileImage(
                                  File(controller.image.value),
                                ),
                              ),
                      ),
                    ),
                  ),
                  Positioned(
                      right: 0,
                      bottom: 10,
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(color: redColor, width: 2)),
                        child: Material(
                          color: Colors.white,
                          shape: const CircleBorder(),
                          child: InkWell(
                            onTap: () {
                              controller.chooseImage();
                            },
                            child:
                                const FaIcon(FontAwesomeIcons.camera, size: 20),
                          ),
                        ),
                      )),
                ],
              ),
            ),
          ),
          const SizedBox(height: 26),
          Text(AppLocalizations.of(context).translate('full_name')!),
          const SizedBox(height: 5),
          TextFormField(
            controller: controller.nameCtr,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(hintText: "Enter Name"),
          ),
          const SizedBox(height: 10),
          const Text('user name'),
          const SizedBox(height: 5),
          TextFormField(
            controller: controller.userNameCtr,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(hintText: 'User Name'),
          ),
          const SizedBox(height: 10),
          Text(AppLocalizations.of(context).translate('email')!),
          const SizedBox(height: 5),
          TextFormField(
            controller: controller.emailCtr,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(hintText: "Enter email address"),
          ),
          const SizedBox(height: 10),
          Text(AppLocalizations.of(context).translate('phone_number')!),
          const SizedBox(height: 5),
          Container(
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              border:
                  Border.all(width: 1, color: Colors.grey.withOpacity(0.22)),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: InternationalPhoneNumberInput(
              ignoreBlank: true,
              onInputChanged: (PhoneNumber value) {},
              textFieldController: controller.phoneCtr,
              keyboardType: TextInputType.phone,
              keyboardAction: TextInputAction.next,
              isEnabled: true,
              initialValue: PhoneNumber(isoCode: 'VU'),
              countries: const ['VU', 'BD'],
              selectorTextStyle:
              const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              spaceBetweenSelectorAndTextField: 2,
              inputDecoration: const InputDecoration(
                hintText: "Phone Number",
              ),
              onFieldSubmitted: (String value) {},
              validator: (phoneNumber) {
                if (phoneNumber!.isEmpty) {}
                return null;
              },
              onSaved: (PhoneNumber number) {},
              selectorConfig: const SelectorConfig(
                  trailingSpace: false,
                  selectorType: PhoneInputSelectorType.DIALOG),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(AppLocalizations.of(context).translate('website_links')!),
              Text(" (${AppLocalizations.of(context).translate('optional')!})"),
            ],
          ),
          const SizedBox(height: 5),
          TextFormField(
            controller: controller.webSiteCtr,
            textInputAction: TextInputAction.done,
            decoration: const InputDecoration(hintText: "https://demo.com"),
          ),
          const SizedBox(height: 10),
          Text(AppLocalizations.of(context).translate('opening_hours')!),
          const SizedBox(height: 5),
          TextFormField(
            keyboardType: TextInputType.name,
            controller: controller.openingHour,
            textInputAction: TextInputAction.next,
            readOnly: true,
            onTap: () {
              controller.openingSelectTime(context);
            },
            onChanged: (value) {},
            decoration: const InputDecoration(
              prefixIcon: Icon(
                Icons.watch_later_outlined,
                color: Colors.black45,
              ),
              hintText: "opening hours",
            ),
          ),
          const SizedBox(height: 10),
          Text(AppLocalizations.of(context).translate('closing_hours')!),
          const SizedBox(height: 5),
          TextFormField(
            keyboardType: TextInputType.name,
            controller: controller.closingHour,
            textInputAction: TextInputAction.next,
            readOnly: true,
            onTap: () {
              controller.closingSelectTime(context);
            },
            onChanged: (value) {},
            decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.watch_later_outlined,
                  color: Colors.black45,
                ),
                hintText: "closing hours"),
          ),
          const SizedBox(height: 10),
          Text(AppLocalizations.of(context).translate('about_public_profile')!),
          const SizedBox(height: 5),
          TextFormField(
            controller: controller.aboutCtr,
            textInputAction: TextInputAction.done,
            maxLines: 4,
            decoration: InputDecoration(
                hintText: AppLocalizations.of(context)
                    .translate('about_public_profile')),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 48,
            child: ElevatedButton(
              style: OutlinedButton.styleFrom(
                elevation: 5,
                shadowColor: Colors.grey.shade300,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: () {
                controller.saveEditProfileData();
              },
              child: Obx(
                () => controller.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(color: Colors.white))
                    : Text(
                        AppLocalizations.of(context).translate('save_changes')!,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

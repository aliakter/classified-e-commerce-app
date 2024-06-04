import 'package:classified_apps/apps/views/profile_update/controller/profile_update_controller.dart';
import 'package:classified_apps/apps/views/profile_update/widgets/basic_info_edit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../splash/localization/app_localizations.dart';
import '../widgets/change_password.dart';
import '../widgets/delete_account.dart';

class ProfileUpdateScreen extends GetView<ProfileUpdateController> {
  const ProfileUpdateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate('account_setting')!),
      ),
      body: Obx(
        () => controller.isUserLoading.value
            ? const Center(child: CircularProgressIndicator())
            : CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.only(
                        left: 16, right: 16, top: 16, bottom: 10),
                    sliver: SliverToBoxAdapter(child: BasicInfoEdit(controller: controller)),
                  ),
                  const SliverPadding(
                    padding: EdgeInsets.only(
                        left: 16, right: 16, top: 10, bottom: 10),
                    sliver: SliverToBoxAdapter(child: ChangePassEdit()),
                  ),
                  const SliverPadding(
                    padding: EdgeInsets.only(
                        left: 16, right: 16, top: 10, bottom: 16),
                    sliver: SliverToBoxAdapter(child: DeleteAccount()),
                  ),
                ],
              ),
      ),
    );
  }
}

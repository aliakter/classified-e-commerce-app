import 'package:classified_apps/apps/core/utils/constants.dart';
import 'package:classified_apps/apps/views/setting/component/basic_info_setting.dart';
import 'package:classified_apps/apps/views/setting/component/change_password.dart';
import 'package:classified_apps/apps/views/setting/component/delete_account.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Account setting"),
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_sharp,color: iconThemeColor,),
        ),
      ),
      body: const CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
            sliver: SliverToBoxAdapter(
              child: BasicInfoEdit(),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
            sliver: SliverToBoxAdapter(
              child: ChangePassEdit(),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
            sliver: SliverToBoxAdapter(
              child: DeleteAccount(),
            ),
          ),
        ],
      ),
    );
  }
}

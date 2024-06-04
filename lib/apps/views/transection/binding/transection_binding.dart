import 'package:classified_apps/apps/views/public_profile/repository/public_profile_repository.dart';
import 'package:classified_apps/apps/views/transection/controller/transection_controller.dart';
import 'package:get/get.dart';

class TransactionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PublicProfileRepository>(
        () => PublicProfileRepositoryImpl(remoteDataSource: Get.find()));
    Get.lazyPut(() => TransactionController(Get.find()));
    // TODO: implement dependencies
  }
}

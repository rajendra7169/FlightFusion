import 'package:flightfusion/app/controllers/utility_controller.dart';
import 'package:flightfusion/app/routes/app_pages.dart';
import 'package:flightfusion/constants/constant.dart';
import 'package:flightfusion/utils/app_storage.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  final cUtility = Get.find<UtilityController>();

  Future<void> getStarted() async {
    await AppStorage.write(key: APP_FIRST_TIME_OPEN, value: 'true');
    await Get.offNamed(Routes.LOGIN);
  }
}

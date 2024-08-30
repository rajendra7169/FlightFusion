import 'package:flightfusion/app/models/app_language_model.dart';
import 'package:flightfusion/app/modules/login/controllers/login_controller.dart';
import 'package:flightfusion/app/routes/app_pages.dart';
import 'package:flightfusion/styles/colors.dart';
import 'package:flightfusion/styles/styles.dart';
import 'package:flightfusion/widgets/buttons/button_primary.dart';
import 'package:flightfusion/widgets/buttons/button_text_rich.dart';
import 'package:flightfusion/widgets/cards/card_app.dart';
import 'package:flightfusion/widgets/inputs/input_dropdown.dart';
import 'package:flightfusion/widgets/inputs/input_email.dart';
import 'package:flightfusion/widgets/inputs/input_password.dart';
import 'package:flightfusion/widgets/others/input_dropdwon_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Obx(() {
        return Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'loginTitle'.tr,
                    style: TextStyles.title,
                  ),
                  verticalSpace(30.w),
                  CardApp(
                    width: double.infinity,
                    radius: Insets.lg,
                    padding: EdgeInsets.all(Insets.lg),
                    isShowShadows: true,
                    shadows: Shadows.universal,
                    child: Column(
                      children: [
                        InputEmail(
                          label: 'emailAddressLabel'.tr,
                          hint: 'emailAddressHint'.tr,
                          controller: controller.cEmail,
                          value: controller.setEmail,
                          validation: (value) => value.isNotEmpty,
                          validationText: 'emailAddressValidationText'.tr,
                        ),
                        InputPassword(
                          label: 'passwordLabel'.tr,
                          hint: 'passwordHint'.tr,
                          value: controller.setPassword,
                          validation: (value) => value.isNotEmpty,
                          validationText: 'passwordValidationText'.tr,
                        ),
                      ],
                    ),
                  ),
                  verticalSpace(30.w),
                  ButtonPrimary(
                    label: 'signIn'.tr,
                    onTap: controller.login,
                    isLoading: controller.isLoading.value,
                    enabled: controller.isValidForm.value,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ButtonTextRich(
                      label1: 'dontHaveAccount'.tr,
                      label2: 'signUp'.tr,
                      onPressed: () => Get.toNamed(Routes.REGISTER),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 40.w,
              right: 30.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('chooseLanguage'.tr, style: TextStyles.text),
                  verticalSpace(Insets.xs),
                  SizedBox(
                    width: 72.w,
                    child: InputDropdown(
                      hintText: '',
                      borderColor: Colors.blueGrey[200],
                      outlinedBorderColor: Colors.transparent,
                      textAlign: TextAlign.center,
                      items: [
                        ...controller.cUtility.appLanguageOptions.map((item) {
                          return DropdownMenuItem<AppLanguageModel>(
                            value: item,
                            child: InputDropdownItem(value: item.language),
                          );
                        }),
                      ],
                      selectedItem:
                          controller.cUtility.appLanguage.value.language,
                      onChanged: (value) {
                        if (value != null) {
                          final data = value as AppLanguageModel;
                          controller.cUtility.changeLanguage(data);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}

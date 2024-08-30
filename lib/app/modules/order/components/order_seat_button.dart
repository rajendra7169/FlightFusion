import 'package:flightfusion/app/modules/order/controllers/order_controller.dart';
import 'package:flightfusion/app/routes/app_pages.dart';
import 'package:flightfusion/styles/styles.dart';
import 'package:flightfusion/widgets/buttons/button_primary.dart';
import 'package:flightfusion/widgets/cards/card_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OrderSeatButton extends GetView<OrderController> {
  const OrderSeatButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return CardApp(
        height: 90.w,
        radius: 0,
        padding: EdgeInsets.all(Insets.xl),
        isShowShadows: true,
        shadows: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 5,
            offset: const Offset(0, 5),
          ),
        ],
        child: ButtonPrimary(
          onTap: () => Get.toNamed(Routes.ORDER_DETAIL),
          label: 'continued'.tr,
          enabled: controller.selectedSeat.isNotEmpty,
        ),
      );
    });
  }
}

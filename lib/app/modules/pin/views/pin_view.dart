import 'package:flightfusion/app/modules/pin/components/pin_numpad.dart';
import 'package:flightfusion/app/modules/pin/components/pin_preview.dart';
import 'package:flightfusion/app/modules/pin/controllers/pin_controller.dart';
import 'package:flightfusion/widgets/pages/page_default.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PinView extends GetView<PinController> {
  const PinView({super.key});

  @override
  Widget build(BuildContext context) {
    return PageDefault(
      title: 'pinVerification'.tr,
      child: Obx(() {
        return Flex(
          direction: Axis.vertical,
          children: [
            PinPreview(pin: controller.pin.value),
            const PinNumpad(),
          ],
        );
      }),
    );
  }
}

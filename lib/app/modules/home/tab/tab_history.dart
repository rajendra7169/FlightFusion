import 'package:flightfusion/app/modules/home/components/history_empty.dart';
import 'package:flightfusion/app/modules/home/components/history_item.dart';
import 'package:flightfusion/app/modules/home/controllers/history_controller.dart';
import 'package:flightfusion/styles/styles.dart';
import 'package:flightfusion/widgets/cards/card_wallet.dart';
import 'package:flightfusion/widgets/others/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TabHistory extends GetView<HistoryController> {
  const TabHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Flex(
        direction: Axis.vertical,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(MediaQuery.of(context).viewPadding.top),
          Padding(
            padding: EdgeInsets.all(Insets.xl),
            child: const CardWallet(),
          ),
          Padding(
            padding: EdgeInsets.only(left: Insets.xl),
            child: Text(
              'transactionHistory'.tr,
              style: TextStyles.title.copyWith(fontSize: 14.w),
            ),
          ),
          verticalSpace(Insets.xs),
          Expanded(
            child: controller.isLoading.value
                ? LoadingIndicatorBounce(size: 25.w)
                : controller.listHistoryTransaction.isNotEmpty
                    ? ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: controller.listHistoryTransaction.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(
                              top: index == 0 ? 10.w : 0,
                              bottom: index ==
                                      controller.listHistoryTransaction.length -
                                          1
                                  ? 65.w
                                  : 0.w,
                            ),
                            child: HistoryItem(
                              data: controller.listHistoryTransaction[index],
                            ),
                          );
                        },
                      )
                    : const HistoryEmpty(),
          ),
        ],
      );
    });
  }
}

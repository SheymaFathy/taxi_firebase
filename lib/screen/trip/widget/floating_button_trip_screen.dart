import 'package:fb_taxi/res/color_manager.dart';
import 'package:fb_taxi/res/font_manager.dart';
import 'package:fb_taxi/screen/trip/trip_controller.dart';
import 'package:fb_taxi/screen/trip/widget/buttom_sheet.dart';
import 'package:fb_taxi/screen/trip/widget/choise_trip.dart';
import 'package:fb_taxi/widget/text_form_fiels_def.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class FloatingButtonTripScreen extends StatelessWidget {
  const FloatingButtonTripScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TripController tripController = Get.find();
    return GetBuilder<TripController>(
        init: tripController,
        builder: (controller) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.7,
                child: Padding(
                  padding: const EdgeInsets.only(right: 25),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormFieldRadius(
                        controller: controller.start,
                        // hint: "نقطة البداية",
                        hint: "انقر هنا لتحديد نقطة البداية",
                        readOnly: true,
                        iconStart: Icons.location_on_outlined,
                        ontap: () => tripController.isStart = true.obs,
                        color: ColorManager.white,
                        textStyle: FontManager.w500s15cB,
                        line: 1,
                      ),
                      const SizedBox(height: 10),
                      TextFormFieldRadius(
                        controller: controller.end,
                        // hint: "نقطة النهاية",
                        hint: "انقر هنا لتحديد نقطة النهاية",
                        readOnly: true,
                        iconStart: Icons.location_on_outlined,
                        ontap: () => tripController.isStart = false.obs,
                        color: ColorManager.white,
                        textStyle: FontManager.w500s15cB,
                        line: 1,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                //width: MediaQuery.sizeOf(context).width * 0.3,
                child: FloatingActionButton(
                  onPressed: () => buttomSheet(
                    context: context,
                    headerText: "إضافة طلب",
                    contener: const ChoiseTrip(),
                  ),
                  backgroundColor: ColorManager.primary,
                  child: const Icon(
                    Icons.add,
                    color: ColorManager.white,
                    size: 30,
                  ),
                ),
              ),
            ],
          );
        });
  }
}

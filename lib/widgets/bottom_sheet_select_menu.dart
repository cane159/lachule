import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lachule/bases/base_assets.dart';
import 'package:lachule/bases/base_colors.dart';
import 'package:lachule/bases/base_sizes.dart';

// ignore: must_be_immutable
class BottomSheetSelectMenu extends StatelessWidget {
  BottomSheetSelectMenu({
    super.key,
    this.title = '',
    this.label = '',
    required this.listObject,
    required this.onPressed,
    required this.initialValue,
    this.isDisable = false,
    this.margin,
    this.borderColor,
  });

  final String title;
  final String label;
  final List listObject;
  Function(String value) onPressed;
  final String initialValue;
  final bool isDisable;
  final EdgeInsetsGeometry? margin;
  Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: borderColor ?? BaseColors.textContent,
          ),
        ),
      ),
      child: IgnorePointer(
        ignoring: isDisable,
        child: ElevatedButton(
          onPressed: () => {
            Get.bottomSheet(
              SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      height: Get.height * 0.5,
                      width: Get.width,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                        color: BaseColors.white,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  title,
                                  style: const TextStyle(
                                    color: BaseColors.textPrimary,
                                    fontSize: BaseSizes.fontH4,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () => Get.back(),
                                  icon: Image.asset(
                                    IconAssets.close,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: listObject
                                  .map(
                                    (data) => Container(
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            width: 1,
                                            color:
                                                BaseColors.bgImageInputDisabled,
                                          ),
                                        ),
                                      ),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.zero,
                                          backgroundColor: Colors.transparent,
                                          shadowColor: Colors.transparent,
                                          foregroundColor: Colors.transparent,
                                          elevation: 0,
                                        ),
                                        onPressed: () => {
                                          onPressed(data.id),
                                          Get.back(),
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              data.name ?? '',
                                              style: const TextStyle(
                                                color: BaseColors.textContent,
                                                fontSize: BaseSizes.fontBody1,
                                              ),
                                            ),
                                            initialValue == data.id
                                                ? const Icon(
                                                    Icons.check_rounded,
                                                    color: BaseColors.actived,
                                                  )
                                                : Container(),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              isScrollControlled: true,
            ),
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(8),
            elevation: 0,
            backgroundColor: BaseColors.white,
            minimumSize: const Size(double.infinity, 50),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                initialValue != ''
                    ? listObject[listObject.indexWhere(
                            (element) => element.id == initialValue)]
                        .name
                    : label,
                style: TextStyle(
                  color: initialValue != ''
                      ? BaseColors.textPrimary
                      : BaseColors.btnDisabledPlaceholder,
                  fontSize: BaseSizes.fontH4,
                ),
              ),
              Image.asset(
                IconAssets.arrowDown,
                width: 13.75,
                fit: BoxFit.fitWidth,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

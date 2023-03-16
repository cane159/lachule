import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lachule/bases/base_assets.dart';
import 'package:lachule/bases/base_colors.dart';
import 'package:lachule/bases/base_sizes.dart';
import 'package:lachule/controllers/all_product_controller.dart';
import 'package:lachule/routes/app_pages.dart';
import 'package:lachule/widgets/dismissible_keyboard.dart';

class AllProductPage extends GetView<AllProductController> {
  const AllProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.setBuildContext(context);
    return Obx(
      () => DismissibleKeyboard(
        child: Scaffold(
          body: SingleChildScrollView(
            primary: true,
            child: Stack(
              children: [
                Image.asset(
                  ImageAssets.splashBg,
                  fit: BoxFit.fitWidth,
                ),
                SafeArea(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Expanded(
                              child: Text(
                                'สินค้า',
                                style: TextStyle(
                                  color: BaseColors.textPrimary,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    onPressed: () => {},
                                    icon: Image.asset(
                                      IconAssets.search,
                                      width: 24,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  IconButton(
                                    onPressed: () => {},
                                    icon: Image.asset(
                                      IconAssets.bagHappy,
                                      width: 24,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(23),
                        decoration: const BoxDecoration(
                          color: BaseColors.white,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        child: Column(
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height: 30,
                                  child: ListView.builder(
                                    primary: false,
                                    itemCount: controller.productTag.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return Obx(
                                        () => ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: BaseColors.white,
                                            elevation: 0,
                                            padding: EdgeInsets.zero,
                                          ),
                                          onPressed: () => controller
                                              .pressedTagButton(index),
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 12,
                                              vertical: 3,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color:
                                                  controller.tagIndex == index
                                                      ? BaseColors.primaryRed
                                                      : BaseColors.white,
                                            ),
                                            child: Text(
                                              controller.productTag[index].name,
                                              style: TextStyle(
                                                fontSize: BaseSizes.fontBody1,
                                                color: controller.tagIndex ==
                                                        index
                                                    ? BaseColors.white
                                                    : BaseColors
                                                        .btnDisabledPlaceholder,
                                              ),
                                              maxLines: 1,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                GridView.builder(
                                  primary: false,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                    childAspectRatio: 6 / 10,
                                  ),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: controller.allProduct.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () => {
                                        Get.toNamed(AppRoutes.PRODUCTDETAIL)
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: BaseColors.white,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border: Border.all(
                                            color: BaseColors.borderColor,
                                          ),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color: BaseColors.btnInput,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Image.network(
                                                controller
                                                    .allProduct[index].image,
                                                height: 142,
                                                width: 142,
                                                fit: BoxFit.fitWidth,
                                                loadingBuilder: (context, child,
                                                    loadingProgress) {
                                                  if (loadingProgress == null) {
                                                    return child;
                                                  }
                                                  return const Center(
                                                    child: SizedBox(
                                                      height: 50,
                                                      width: 50,
                                                      child:
                                                          CircularProgressIndicator(
                                                        strokeWidth: 4,
                                                      ),
                                                    ),
                                                  );
                                                },
                                                errorBuilder: (context, error,
                                                    stackTrace) {
                                                  return const Center(
                                                    child: SizedBox(
                                                      height: 50,
                                                      width: 50,
                                                      child:
                                                          CircularProgressIndicator(
                                                        strokeWidth: 4,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Image.asset(
                                                  IconAssets.colorsWatch,
                                                  width: 14,
                                                  fit: BoxFit.fitWidth,
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    controller
                                                        .allProduct[index].tag,
                                                    style: const TextStyle(
                                                      color: BaseColors
                                                          .secondaryRed,
                                                      fontSize: 12,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5.0),
                                                child: Text(
                                                  controller
                                                      .allProduct[index].title,
                                                  maxLines: 2,
                                                  textAlign: TextAlign.left,
                                                  style: const TextStyle(
                                                    color:
                                                        BaseColors.textPrimary,
                                                    fontSize: 14,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                '฿ ${controller.priceIntl(controller.allProduct[index].price)}',
                                                maxLines: 1,
                                                textAlign: TextAlign.left,
                                                style: const TextStyle(
                                                  color: BaseColors.textPrimary,
                                                  fontSize: 14,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

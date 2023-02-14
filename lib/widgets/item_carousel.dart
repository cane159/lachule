import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lachule/bases/base_assets.dart';
import 'package:lachule/bases/base_colors.dart';
import 'package:lachule/bases/base_sizes.dart';

class ItemCarousel extends StatelessWidget {
  const ItemCarousel({
    super.key,
    this.header,
    this.leadingIcon,
    this.onPressed,
    this.pressItem,
    required this.carouselItem,
    this.options,
  });

  final String? header;
  final String? leadingIcon;
  final VoidCallback? onPressed;
  final VoidCallback? pressItem;
  final List carouselItem;
  final CarouselOptions? options;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: <Widget>[
                  Image.asset(
                    leadingIcon ?? IconAssets.promotion,
                    width: 16,
                    height: 16,
                    fit: BoxFit.scaleDown,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      header ?? '',
                      style: const TextStyle(
                        color: BaseColors.textPrimary,
                        fontSize: BaseSizes.fontH4,
                      ),
                    ),
                  )
                ],
              ),
              TextButton(
                onPressed: onPressed,
                child: const Text(
                  'ดูทั้งหมด',
                  style: TextStyle(
                    color: BaseColors.primaryRed,
                    fontSize: BaseSizes.fontBody2,
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: pressItem,
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(0),
              backgroundColor: MaterialStateProperty.all(Colors.transparent),
            ),
            child: CarouselSlider(
              items: carouselItem
                  .map(
                    (data) => SizedBox(
                      width: 142,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              height: 142,
                              width: 142,
                              color: BaseColors.bgImageInputDisabled,
                              child: Image.network(
                                data.image,
                                height: 142,
                                width: 142,
                                fit: BoxFit.fitHeight,
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return const Center(
                                    child: SizedBox(
                                      height: 50,
                                      width: 50,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 4,
                                      ),
                                    ),
                                  );
                                },
                                errorBuilder: (context, error, stackTrace) {
                                  return const Center(
                                    child: SizedBox(
                                      height: 50,
                                      width: 50,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 4,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 9,
                          ),
                          Text(
                            data.title,
                            style: const TextStyle(
                              color: BaseColors.textPrimary,
                              fontSize: BaseSizes.fontBody1,
                              height: 1.4,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
              options: options ??
                  CarouselOptions(
                    viewportFraction: 0.45,
                    enableInfiniteScroll: false,
                    padEnds: false,
                  ),
            ),
          ),
        )
      ],
    );
  }
}

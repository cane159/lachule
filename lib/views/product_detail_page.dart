import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lachule/bases/base_assets.dart';
import 'package:lachule/bases/base_colors.dart';
import 'package:lachule/bases/base_sizes.dart';
import 'package:lachule/controllers/product_detail_controller.dart';
import 'package:lachule/widgets/button/go_back_button.dart';

class ProductDetailPage extends GetView<ProductDetailController> {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColors.btnInput,
      appBar: _appbar(),
      body: SingleChildScrollView(
        child: _bodyContent(),
      ),
    );
  }

  AppBar _appbar() {
    return AppBar(
      leading: const GoBackbutton(),
      leadingWidth: 36,
      elevation: 0,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          Text(
            'รายละเอียด',
            style: TextStyle(
              color: BaseColors.textPrimary,
              fontSize: 21,
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottomNavBar() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 22,
        vertical: 14,
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            spreadRadius: 8,
            blurRadius: 7,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      child: Row(
        children: [
          OutlinedButton(
            onPressed: () => {},
            child: Row(
              children: [],
            ),
          )
        ],
      ),
    );
  }

  Widget _bodyContent() {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 20,
              ),
              width: 275,
              height: 275,
              child: Image.network(
                'https://s3-alpha-sig.figma.com/img/3882/55bc/dafa8fbfd8ac49059021da6fe48915a5?Expires=1674432000&Signature=psRgkwlmJd9jsqnI3ozvK820Frd-sAnrwnxZiDa-zBMyZBmpjIoukz7z8k3nDH7qnB~pwm2mZudo5fHdAUgRosDTlI6cISsGogEMODKBrMdeYkPJC~-yJ8KmWp~cgoMywa1AUbcj3MK7G8myEdLOgsH7ICdBiKekkLwm3K8aMqASSI0OskYioQvXWBpYRSBD6Ugd5Emygpx186QycvvmFWp0JtAskRW3kHRKkMxZ8h1fVZcnUVzadZjiNDTuppmT3imiuSVgprK4I1DOwRAPzHMiL96ZohMsk5HgS7hRyEWvr2o05IgRydH~bOIYFACbWwRaZLEZfAiJf4bTTB~DiA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
                height: 142,
                width: 142,
                fit: BoxFit.fitWidth,
                loadingBuilder: (context, child, loadingProgress) {
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
              ),
            ),
          ],
        ),
        Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              color: BaseColors.white),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 22,
                ),
                child: Column(
                  children: [
                    Row(
                      children: const [
                        Text(
                          'นาโน แอคเน่ ครีม จีพีโฟร์จี',
                          style: TextStyle(
                            color: BaseColors.textPrimary,
                            fontSize: 21,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset(
                          IconAssets.colorsWatch,
                          width: 14,
                          height: 14,
                          fit: BoxFit.fitWidth,
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        const Text(
                          'ผลิตภัณฑ์ทำความสะอาด',
                          style: TextStyle(
                            color: BaseColors.secondaryRed,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'ราาคา',
                          style: TextStyle(
                            color: BaseColors.tabTitle,
                            fontSize: BaseSizes.fontH4,
                          ),
                        ),
                        Text(
                          'คะแนนสะสม',
                          style: TextStyle(
                            color: BaseColors.tabTitle,
                            fontSize: BaseSizes.fontH4,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          '฿ 1,600.00',
                          style: TextStyle(
                            color: BaseColors.textPrimary,
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          '50',
                          style: TextStyle(
                            color: BaseColors.textPrimary,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(),
            ],
          ),
        ),
      ],
    );
  }
}

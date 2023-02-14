import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lachule/bases/base_assets.dart';
import 'package:lachule/bases/base_colors.dart';
import 'package:lachule/bases/base_sizes.dart';
import 'package:lachule/controllers/register/success_controller.dart';
import 'package:lachule/routes/app_pages.dart';
import 'package:lachule/widgets/button/outline_button.dart';

class SuccessPage extends GetView<SuccessController> {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.setBuildContext(context);
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            ImageAssets.successBg,
            width: Get.width,
            fit: BoxFit.fitWidth,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                width: Get.width,
                decoration: const BoxDecoration(
                  color: BaseColors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Image.asset(
                      IconAssets.check,
                      width: 39.38,
                      height: 26.5,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 21,
                      ),
                      child: Text(
                        'การสมัครสำเร็จ',
                        style: TextStyle(
                          color: BaseColors.textPrimary,
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        bottom: 40,
                      ),
                      child: Text(
                        'ระบบจะทำการส่งหมายเลขสมาชิก และรหัสผ่าน\nไปทาง SMS คุณสามารถเลือกซื้อสินค้า และได้รับสิทธิ์พิเศษสำหรับสมาชิก\n\n*กรณีหมายเลขสมาชิก หรือรหัสผ่านสูญหาย\nโปรดติดต่อฝ่ายบริการลูกค้า 02-xxxxxxx',
                        style: TextStyle(
                          color: BaseColors.textPrimary,
                          fontSize: BaseSizes.fontH4,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: OutlinedButtonView(
                              onPressed: () => {controller.pressConfirm()},
                              title: 'รับทราบ',
                              borderColor: BaseColors.btnDisabledPlaceholder,
                              textStyle: const TextStyle(
                                color: BaseColors.textPrimary,
                                fontSize: BaseSizes.fontH4,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

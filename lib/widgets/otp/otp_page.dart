import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lachule/bases/base_assets.dart';
import 'package:lachule/bases/base_colors.dart';
import 'package:lachule/bases/base_sizes.dart';
import 'package:lachule/widgets/button/go_back_button.dart';
import 'package:lachule/widgets/button/primary_button.dart';
import 'package:lachule/widgets/dismissible_keyboard.dart';
import 'package:lachule/widgets/otp/otp_controller.dart';
import 'package:lachule/widgets/register_app_scaffold.dart';

// ignore: must_be_immutable
class OtpPage extends GetView<OtpController> {
  OtpPage({super.key});

  final TextEditingController _digitOne = TextEditingController();
  final TextEditingController _digitTwo = TextEditingController();
  final TextEditingController _digitThree = TextEditingController();
  final TextEditingController _digitFour = TextEditingController();
  final TextEditingController _digitFive = TextEditingController();
  final TextEditingController _digitSix = TextEditingController();
  late String otp;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    controller.setBuildContext(context);
    return Obx(
      () => DismissibleKeyboard(
        child: Scaffold(
          backgroundColor: BaseColors.white,
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Image.asset(
                  ImageAssets.h1ForgotPass,
                  fit: BoxFit.fitWidth,
                  width: double.infinity,
                ),
                SafeArea(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                        child: Row(
                          children: const [
                            GoBackbutton(),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        decoration: const BoxDecoration(
                          color: BaseColors.white,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Image.asset(
                                    IconAssets.userTick,
                                    width: 20,
                                    fit: BoxFit.fitWidth,
                                  ),
                                  const SizedBox(
                                    width: 9,
                                  ),
                                  const Text(
                                    'ยืนยันตัวตน',
                                    style: TextStyle(
                                      color: BaseColors.textPrimary,
                                      fontSize: BaseSizes.fontH4,
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Row(
                                  children: [
                                    Text(
                                      'OTP ส่งไปที่ ${controller.userPhoneNumber}',
                                      style: const TextStyle(
                                        color: BaseColors.textContent,
                                        fontSize: BaseSizes.fontBody1,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Row(
                                  children: [
                                    // TODO: เปลี่ยนรหัสอ้างอิง
                                    Text(
                                      'รหัสอ้างอิง PYQT',
                                      style: TextStyle(
                                        color: BaseColors.textContent,
                                        fontSize: BaseSizes.fontBody1,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    _otpInput(context, true, _digitOne),
                                    _otpInput(context, false, _digitTwo),
                                    _otpInput(context, false, _digitThree),
                                    _otpInput(context, false, _digitFour),
                                    _otpInput(context, false, _digitFive),
                                    _otpInput(context, false, _digitSix),
                                  ],
                                ),
                              ),
                              controller.isOtpError == true
                                  ? const Center(
                                      child: Padding(
                                        padding: EdgeInsets.only(bottom: 10.0),
                                        child: Text(
                                          'กรอกรหัสไม่ถูกต้อง กรุณาลองใหม่อีกครั้ง',
                                          style: TextStyle(
                                            color: BaseColors.primaryRed,
                                            fontSize: 11,
                                          ),
                                        ),
                                      ),
                                    )
                                  : Container(),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Text(
                                    'ใส่รหัสภายใน ${controller.time.value}',
                                    style: const TextStyle(
                                      color: BaseColors.textContent,
                                      fontSize: BaseSizes.fontBody1,
                                    ),
                                  ),
                                ),
                              ),
                              Center(
                                child: TextButton(
                                  onPressed: () => {},
                                  child: Text(
                                    'ขอ OTP ใหม่อีกครั้ง',
                                    style: TextStyle(
                                      color: controller.isTimeOut == true
                                          ? BaseColors.actived
                                          : BaseColors.btnDisabledPlaceholder,
                                      fontSize: BaseSizes.fontBody1,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ),
                              controller.isTimeOut == true
                                  ? const Center(
                                      child: Padding(
                                        padding: EdgeInsets.only(bottom: 10.0),
                                        child: Text(
                                          'หมดเวลาในการส่ง OTP กรุณาขอ OTP ใหม่อีกครั้ง',
                                          style: TextStyle(
                                            color: BaseColors.primaryRed,
                                            fontSize: 11,
                                          ),
                                        ),
                                      ),
                                    )
                                  : Container(),
                              Container(
                                padding: const EdgeInsets.only(top: 20),
                                width: double.infinity,
                                child: PrimaryButtonView(
                                  onPressed: () => {
                                    otp = _digitOne.text +
                                        _digitTwo.text +
                                        _digitThree.text +
                                        _digitFour.text +
                                        _digitFive.text +
                                        _digitSix.text,
                                    controller.onTappedOtpPage(otp),
                                  },
                                  title: 'ถัดไป',
                                ),
                              ),
                            ],
                          ),
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

  Widget _otpInput(
    BuildContext context,
    bool autoFocus,
    TextEditingController textController,
  ) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 2,
            color: controller.isOtpError
                ? BaseColors.primaryRed
                : BaseColors.textSubContent,
          ),
        ),
      ),
      height: 50,
      width: 40,
      child: TextField(
        autofocus: autoFocus,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: textController,
        maxLength: 1,
        cursorColor: Theme.of(context).primaryColor,
        decoration: const InputDecoration(
            border: InputBorder.none,
            counterText: '',
            hintStyle: TextStyle(color: Colors.black, fontSize: 20.0)),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }
}

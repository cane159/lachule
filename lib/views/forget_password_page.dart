import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lachule/bases/base_assets.dart';
import 'package:lachule/bases/base_colors.dart';
import 'package:lachule/controllers/forget_password_controller.dart';
import 'package:lachule/widgets/button/go_back_button.dart';
import 'package:lachule/widgets/button/primary_button.dart';
import 'package:lachule/widgets/dismissible_keyboard.dart';
import 'package:lachule/widgets/text_field/app_text_field.dart';

class ForgetPasswordPage extends GetView<ForgetPasswordController> {
  ForgetPasswordPage({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    controller.setBuildContext(context);
    return DismissibleKeyboard(
      child: Scaffold(
        backgroundColor: BaseColors.white,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Image.asset(
                ImageAssets.h1ForgotPass,
                width: Get.width,
                fit: BoxFit.fitWidth,
              ),
              SafeArea(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Row(
                          children: const [
                            GoBackbutton(),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 250),
                        padding: const EdgeInsets.fromLTRB(22, 18, 22, 50),
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: BaseColors.white,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: const [
                                Text(
                                  'ลืมรหัสผ่าน',
                                  style: TextStyle(
                                    color: BaseColors.textPrimary,
                                    fontSize: 21,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            AppTextField(
                              controller.usernameController,
                              labelText: 'หมายเลขสมาชิก*',
                              prefixIcon: Image.asset(IconAssets.person),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'กรุณากรอกข้อมูล';
                                }
                                return null;
                              },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                            ),
                            AppTextField(
                              controller.userPhoneController,
                              labelText: 'หมายเลขโทรศัพท์*',
                              prefixIcon: Image.asset(
                                IconAssets.mobile,
                                width: 22,
                                fit: BoxFit.fitWidth,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'กรุณากรอกข้อมูล';
                                }
                                return null;
                              },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              textInputType: TextInputType.phone,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: _submitButton(),
      ),
    );
  }

  Widget _submitButton() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: PrimaryButtonView(
          onPressed: () => {
            FocusManager.instance.primaryFocus?.unfocus(),
            if (_formKey.currentState!.validate())
              {
                controller.onSubmit(),
              },
          },
          title: 'ลืมรหัสผ่าน',
        ),
      ),
    );
  }
}

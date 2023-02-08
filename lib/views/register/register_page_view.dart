import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lachule/controllers/register/register_page_view_controller.dart';
import 'package:lachule/views/register/applicant_information_page.dart';
import 'package:lachule/views/register/business_information_page.dart';

class RegisterPageView extends GetView<RegisterPageViewController> {
  const RegisterPageView({super.key});

  @override
  Widget build(BuildContext context) {
    controller.setBuildContext(context);
    return Scaffold(
      body: PageView(
        controller: controller.pageController,
        physics: const NeverScrollableScrollPhysics(),
        allowImplicitScrolling: true,
        children: [
          BusinessInformationPage(
            pageViewController: controller.pageController,
          ),
          ApplicantInformationPage(
            pageViewController: controller.pageController,
          ),
        ],
      ),
    );
  }
}

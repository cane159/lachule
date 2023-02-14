import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lachule/bases/base_assets.dart';
import 'package:lachule/bases/base_colors.dart';
import 'package:lachule/widgets/button/go_back_button.dart';

class RegisterAppScaffold extends StatelessWidget {
  const RegisterAppScaffold({
    super.key,
    this.initialPage = 1,
    required this.child,
    this.onGoBack,
    this.bottomNavigationBar,
  });

  final int initialPage;
  final Widget child;
  final VoidCallback? onGoBack;
  final Widget? bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColors.white,
      body: Stack(
        children: [
          Image.asset(
            ImageAssets.splashBg,
            fit: BoxFit.fitWidth,
            width: double.infinity,
          ),
          SingleChildScrollView(
            child: SafeArea(
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    onGoBack != null
                        ? Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              children: [
                                initialPage == 1
                                    ? const GoBackbutton()
                                    : IconButton(
                                        onPressed: onGoBack,
                                        icon: const Icon(
                                            Icons.arrow_back_ios_new_rounded),
                                        color: BaseColors.textPrimary,
                                      ),
                                const Text(
                                  'สมัครสมาชิก',
                                  style: TextStyle(
                                    color: BaseColors.textPrimary,
                                    fontSize: 21,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              children: const [
                                Text(
                                  'สมัครสมาชิก',
                                  style: TextStyle(
                                    color: BaseColors.textPrimary,
                                    fontSize: 21,
                                  ),
                                ),
                              ],
                            ),
                          ),
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          color: BaseColors.white,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 24,
                          horizontal: 22,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                for (int i = 0; i < 8; i++) ...[
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 2),
                                      child: Container(
                                        height: 3,
                                        color: initialPage - 1 >= i
                                            ? BaseColors.secondaryRed
                                            : BaseColors.bgImageInputDisabled,
                                      ),
                                    ),
                                  ),
                                ]
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Expanded(
                              child: child,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}

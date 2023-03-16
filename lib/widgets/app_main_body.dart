import 'package:flutter/material.dart';
import 'package:lachule/bases/base_assets.dart';
import 'package:lachule/bases/base_colors.dart';
import 'package:lachule/widgets/button/go_back_button.dart';
import 'package:lachule/widgets/dismissible_keyboard.dart';

class AppMainBody extends StatelessWidget {
  const AppMainBody({
    super.key,
    this.backgroundColor,
    this.title,
    this.isGoBack = true,
    required this.child,
    this.onGoback,
    this.bottomNavigationBar,
    this.header,
    this.action,
  });

  final Color? backgroundColor;
  final String? title;
  final bool isGoBack;
  final Widget child;
  final VoidCallback? onGoback;
  final Widget? bottomNavigationBar;
  final Widget? header;
  final List<Widget>? action;

  @override
  Widget build(BuildContext context) {
    return DismissibleKeyboard(
      child: Scaffold(
        backgroundColor: backgroundColor ?? BaseColors.white,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Image.asset(
                ImageAssets.fadeOutBg,
                fit: BoxFit.fitWidth,
                width: double.infinity,
              ),
              SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(
                        isGoBack ? 10 : 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              if (isGoBack == true) ...[
                                if (onGoback == null) ...[
                                  const GoBackbutton(),
                                ] else ...[
                                  GoBackbutton(
                                    onPressed: onGoback,
                                  ),
                                ],
                              ] else ...[
                                Container(),
                              ],
                              title != null
                                  ? Text(
                                      title ?? '',
                                      style: const TextStyle(
                                        color: BaseColors.textPrimary,
                                        fontSize: 21,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  : Container(),
                            ],
                          ),
                          Row(
                            children: action ?? [],
                          ),
                        ],
                      ),
                    ),
                    header ?? Container(),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(23),
                      decoration: const BoxDecoration(
                        color: BaseColors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      child: child,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}

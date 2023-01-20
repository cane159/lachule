import 'package:flutter/material.dart';
import 'package:lachule/bases/base_colors.dart';
import 'package:lachule/bases/base_sizes.dart';
import 'package:lachule/widgets/bottomNavigationBar/app_bottom_navigation_bar.dart';

class AppBarScaffold extends StatelessWidget {
  const AppBarScaffold({
    super.key,
    this.title,
    required this.body,
    this.centerTitle = true,
    this.subTitle,
    this.onLeadingPress,
    this.actions,
    this.bottom,
    this.isShadowBottom = true,
  });

  final Widget body;
  final String? title;
  final bool centerTitle;
  final Widget? subTitle;
  final VoidCallback? onLeadingPress;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final bool isShadowBottom;

  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,
        extendBody: true,
        body: body,
        appBar: AppBar(
          leadingWidth: 51,
          elevation: 0,
          backgroundColor: BaseColors.primaryRed,
          surfaceTintColor: BaseColors.primaryRed,
          centerTitle: centerTitle,
          automaticallyImplyLeading: false,
          actions: actions != null
              ? [
                  ...actions!.map(
                    (e) => SizedBox(
                      height: 24,
                      child: Center(child: e),
                    ),
                  ),
                  const SizedBox(width: 16),
                ]
              : null,
          bottom: bottom,
          title: Row(
            children: [
              Text(
                title ?? '',
                style: const TextStyle(
                  color: BaseColors.btnInput,
                  fontSize: BaseSizes.fontH4,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: const AppBottomNavigationBar(),
      );
}

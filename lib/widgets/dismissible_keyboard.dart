import 'package:flutter/material.dart';

class DismissibleKeyboard extends StatelessWidget {
  const DismissibleKeyboard({
    super.key,
    required this.child,
    this.behavior = HitTestBehavior.opaque,
  });

  final Widget child;
  final HitTestBehavior behavior;
  @override
  Widget build(BuildContext context) => GestureDetector(
        behavior: behavior,
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: child,
      );
}

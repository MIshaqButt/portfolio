import 'package:m_ishaq_butt/core/design_system/values/strings.dart';
import 'package:m_ishaq_butt/generated/assets/assets.gen.dart';
import 'package:m_ishaq_butt/presentation/widgets/spaces.dart';
import 'package:flutter/material.dart';

class ScrollDownButton extends StatelessWidget {
  const ScrollDownButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RotatedBox(
          quarterTurns: 1,
          child: Text(
            StringConst.SCROLL_DOWN.toUpperCase(),
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 12,
                  letterSpacing: 1.7,
                ),
          ),
        ),
        SpaceH16(),
        Assets.icons.arrowwDown.svg(height: 24),
      ],
    );
  }
}

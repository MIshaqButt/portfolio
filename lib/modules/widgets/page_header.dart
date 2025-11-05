import 'package:mishaqbutt/core/design_system/values/sizes.dart';
import 'package:mishaqbutt/core/layout/adaptive.dart';
import 'package:mishaqbutt/generated/assets/assets.gen.dart';
import 'package:mishaqbutt/generated/assets/colors.gen.dart';
import 'package:mishaqbutt/modules/widgets/animated_slide_transtion.dart';
import 'package:mishaqbutt/modules/widgets/animated_text_slide_box_transition.dart';
import 'package:flutter/material.dart';

class PageHeader extends StatefulWidget {
  const PageHeader({
    super.key,
    required this.headingText,
    required this.headingTextController,
  });

  final String headingText;
  final AnimationController headingTextController;

  @override
  PageHeaderState createState() => PageHeaderState();
}

class PageHeaderState extends State<PageHeader>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> animation;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    )..repeat();

    animation = Tween<Offset>(
      begin: Offset(0, 0.5),
      end: Offset(0, -0.5),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,
      ),
    );
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
    controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? headingStyle = textTheme.displayMedium?.copyWith(
      color: ColorName.black,
      fontSize: responsiveSize(
        context,
        Sizes.textSize40,
        Sizes.textSize60,
      ),
    );
    return SizedBox(
      width: widthOfScreen(context),
      height: heightOfScreen(context),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Assets.icons.works.svg(),
          ),
          Align(
            alignment: Alignment.center,
            child: AnimatedTextSlideBoxTransition(
              controller: widget.headingTextController,
              text: widget.headingText,
              textStyle: headingStyle,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: Sizes.margin40),
              child: AnimatedSlideTranstion(
                controller: controller,
                position: animation,
                child: Assets.icons.down.svg(
                  colorFilter: const ColorFilter.mode(
                    ColorName.black,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

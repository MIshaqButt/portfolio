import 'package:mishaqbutt/core/design_system/values/sizes.dart';
import 'package:mishaqbutt/generated/assets/colors.gen.dart';
import 'package:mishaqbutt/modules/widgets/aerium_button.dart';
import 'package:mishaqbutt/modules/widgets/empty.dart';
import 'package:mishaqbutt/modules/widgets/spaces.dart';
import 'package:flutter/material.dart';

class CertificationCard extends StatefulWidget {
  const CertificationCard({super.key, 
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.actionTitle,
    this.width = 500,
    this.height = 400,
    this.elevation,
    this.shadow,
    this.hoverColor = ColorName.accentColor,
    this.titleTextStyle,
    this.subtitleTextStyle,
    this.actionTitleTextStyle,
    this.duration = 1000,
    this.onTap,
    this.isMobileOrTablet = false,
  });

  final double width;
  final double height;
  final String imageUrl;
  final double? elevation;
  final Shadow? shadow;
  final String title;
  final String subtitle;
  final String actionTitle;
  final Color hoverColor;
  final TextStyle? titleTextStyle;
  final TextStyle? subtitleTextStyle;
  final TextStyle? actionTitleTextStyle;
  final int duration;
  final GestureTapCallback? onTap;
  final bool isMobileOrTablet;

  @override
  CertificationCardState createState() => CertificationCardState();
}

class CertificationCardState extends State<CertificationCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _portfolioCoverController;
  late Animation<double> _opacityAnimation;
  final int duration = 400;
  bool _hovering = false;

  @override
  void initState() {
    _portfolioCoverController = AnimationController(
      duration: Duration(milliseconds: duration),
      vsync: this,
    );
    initTweens();

    super.initState();
  }

  @override
  void dispose() {
    _portfolioCoverController.dispose();
    super.dispose();
  }

  void initTweens() {
    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 0.8,
    ).animate(
      CurvedAnimation(
        parent: _portfolioCoverController,
        curve: Interval(
          0.0,
          1.0,
          curve: Curves.easeIn,
        ),
      ),
    );
  }

  Future<void> _playPortfolioCoverAnimation() async {
    try {
      await _portfolioCoverController.forward().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because it was disposed of
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        color: ColorName.aeriumV2SelectedNavTitle,
        width: widget.width,
        height: widget.height,
        child: MouseRegion(
          onEnter: (e) => _mouseEnter(true),
          onExit: (e) => _mouseEnter(false),
          child: Stack(
            children: [
              Image.asset(
                widget.imageUrl,
                width: widget.width,
                height: widget.height,
                fit: BoxFit.cover,
              ),
              // if it is not a tablet or mobile device, allow on hover effect
              !widget.isMobileOrTablet && _hovering
                  ? FadeTransition(
                      opacity: _opacityAnimation,
                      child: Container(
                        width: widget.width,
                        height: widget.height,
                        color: widget.hoverColor,
                        child: _buildCardInfo(),
                      ),
                    )
                  : Empty(),
              //show info instantly if it is a mobile or tablet device
              widget.isMobileOrTablet
                  ? Container(
                      width: widget.width,
                      height: widget.height,
                      color: widget.hoverColor.withValues(alpha:0.15),
                      child: Column(
                        children: [
                          Spacer(flex: 3),
                          AeriumButton(
                            height: Sizes.height36,
                            hasIcon: false,
                            width: 80,
                            buttonColor: ColorName.white,
                            borderColor: ColorName.black,
                            onHoverColor: ColorName.black,
                            title: widget.actionTitle.toUpperCase(),
                            onPressed: widget.onTap,
                          ),
                          Spacer(),
                          // SpaceH20(),
                        ],
                      ),
                    )
                  : Empty(),
            ],
          ),
        ),
      ),
    );
  }

  void _mouseEnter(bool hovering) {
    setState(() {
      _hovering = hovering;
    });

    if (_hovering == true) {
      _playPortfolioCoverAnimation();
    } else if (_hovering == false) {
      _portfolioCoverController.reverse().orCancel;
    }
  }

  Widget _buildCardInfo() {
    ThemeData theme = Theme.of(context);
    return Column(
      children: [
        Spacer(flex: 1),
        Text(
          widget.title,
          textAlign: TextAlign.center,
          style: widget.titleTextStyle ??
              theme.textTheme.headlineLarge?.copyWith(
                color: ColorName.black,
              ),
        ),
        SpaceH4(),
        Text(
          widget.subtitle,
          textAlign: TextAlign.center,
          style: widget.subtitleTextStyle ??
              theme.textTheme.bodyLarge?.copyWith(
                color: ColorName.black,
                fontSize: Sizes.textSize16,
              ),
        ),
        SpaceH16(),
        AeriumButton(
          height: Sizes.height36,
          hasIcon: false,
          width: 80,
          buttonColor: ColorName.white,
          borderColor: ColorName.black,
          onHoverColor: ColorName.black,
          title: widget.actionTitle.toUpperCase(),
          onPressed: widget.onTap,
        ),
        SpaceH4(),
        Spacer(flex: 1),
      ],
    );
  }
}

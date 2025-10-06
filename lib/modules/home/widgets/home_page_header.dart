import 'package:m_ishaq_butt/core/design_system/values/data.dart';
import 'package:m_ishaq_butt/core/design_system/values/sizes.dart';
import 'package:m_ishaq_butt/core/design_system/values/strings.dart';
import 'package:m_ishaq_butt/core/layout/adaptive.dart';
import 'package:m_ishaq_butt/core/utils/functions.dart';
import 'package:m_ishaq_butt/generated/assets/assets.gen.dart';
import 'package:m_ishaq_butt/generated/assets/colors.gen.dart';
import 'package:m_ishaq_butt/modules/home/widgets/scroll_down.dart';
import 'package:m_ishaq_butt/presentation/pages/widgets/socials.dart';
import 'package:m_ishaq_butt/modules/works/works_page.dart';
import 'package:m_ishaq_butt/presentation/widgets/animated_bubble_button.dart';
import 'package:m_ishaq_butt/presentation/widgets/animated_line_through_text.dart';
import 'package:m_ishaq_butt/presentation/widgets/animated_positioned_text.dart';
import 'package:m_ishaq_butt/presentation/widgets/animated_positioned_widget.dart';
import 'package:m_ishaq_butt/presentation/widgets/animated_slide_transtion.dart';
import 'package:m_ishaq_butt/presentation/widgets/animated_text_slide_box_transition.dart';
import 'package:m_ishaq_butt/presentation/widgets/spaces.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

const kDuration = Duration(milliseconds: 600);

class HomePageHeader extends StatefulWidget {
  const HomePageHeader({
    super.key,
    required this.scrollToWorksKey,
    required this.controller,
  });

  final GlobalKey scrollToWorksKey;
  final AnimationController controller;
  @override
  HomePageHeaderState createState() => HomePageHeaderState();
}

class HomePageHeaderState extends State<HomePageHeader>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late AnimationController rotationController;
  late AnimationController scrollDownButtonController;
  late Animation<Offset> animation;
  late Animation<Offset> scrollDownBtnAnimation;

  @override
  void initState() {
    scrollDownButtonController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    rotationController = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    )..repeat();
    animation = Tween<Offset>(
      begin: Offset(0, 0.05),
      end: Offset(0, -0.05),
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
    rotationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        rotationController.reset();
        rotationController.forward();
        // rotationController.reverse();
      }
    });
    controller.forward();
    rotationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    scrollDownButtonController.dispose();
    rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = widthOfScreen(context);
    final double screenHeight = heightOfScreen(context);
    final EdgeInsets textMargin = EdgeInsets.only(
      left: responsiveSize(
        context,
        20,
        screenWidth * 0.15,
        sm: screenWidth * 0.15,
      ),
      top: responsiveSize(
        context,
        60,
        screenHeight * 0.35,
        sm: screenHeight * 0.35,
      ),
      bottom: responsiveSize(context, 20, 40),
    );
    final EdgeInsets padding = EdgeInsets.symmetric(
      horizontal: screenWidth * 0.1,
      vertical: screenHeight * 0.1,
    );
    final EdgeInsets imageMargin = EdgeInsets.only(
      right: responsiveSize(
        context,
        20,
        screenWidth * 0.05,
        sm: screenWidth * 0.05,
      ),
      top: responsiveSize(
        context,
        30,
        screenHeight * 0.25,
        sm: screenHeight * 0.25,
      ),
      bottom: responsiveSize(context, 20, 40),
    );

    return Container(
      width: screenWidth,
      color: ColorName.accentColor2.withValues(alpha: 0.35),
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: assignHeight(context, 0.1),
            ),
            child: Align(
              alignment: Alignment.topCenter,
              child: WhiteCircle(),
            ),
          ),
          ResponsiveBuilder(builder: (context, sizingInformation) {
            double screenWidth = sizingInformation.screenSize.width;
            if (screenWidth < RefinedBreakpoints().tabletNormal) {
              return Column(
                children: [
                  Container(
                    padding: padding,
                    child: AnimatedSlideTranstion(
                      controller: controller,
                      position: animation,
                      child: Stack(
                        alignment: AlignmentGeometry.center,
                        children: [
                          RotationTransition(
                            turns: rotationController,
                            child: Assets.icons.skills.svg(
                              width: screenWidth
                            ),
                          ),
                          Assets.images.mibHome.image(
                            width: screenWidth * 0.35
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: padding.copyWith(top: 0),
                    child: SizedBox(
                      width: screenWidth,
                      child: AboutDev(
                        controller: widget.controller,
                        width: screenWidth,
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: textMargin,
                    child: SizedBox(
                      width: screenWidth * 0.40,
                      child: AboutDev(
                        controller: widget.controller,
                        width: screenWidth * 0.40,
                      ),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.05),
                  Container(
                    margin: imageMargin,
                    child: AnimatedSlideTranstion(
                      controller: controller,
                      position: animation,
                      child: Stack(
                        alignment: AlignmentGeometry.center,
                        children: [
                          RotationTransition(
                            turns: rotationController,
                            child: Assets.icons.skills.svg(
                              width: screenWidth * 0.35,
                            ),
                          ),
                          Assets.images.mibHome.image(
                            width: screenWidth * 0.15,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
          }),
          Positioned(
            right: 0,
            bottom: 0,
            child: ResponsiveBuilder(
              builder: (context, sizingInformation) {
                double screenWidth = sizingInformation.screenSize.width;
                if (screenWidth < RefinedBreakpoints().tabletNormal) {
                  return Container();
                } else {
                  return InkWell(
                    hoverColor: Colors.transparent,
                    onTap: () {
                      Scrollable.ensureVisible(
                        widget.scrollToWorksKey.currentContext!,
                        duration: kDuration,
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 24, bottom: 40),
                      child: MouseRegion(
                        onEnter: (e) => scrollDownButtonController.forward(),
                        onExit: (e) => scrollDownButtonController.reverse(),
                        child: AnimatedSlideTranstion(
                          controller: scrollDownButtonController,
                          beginOffset: Offset(0, 0),
                          targetOffset: Offset(0, 0.1),
                          child: ScrollDownButton(),
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class WhiteCircle extends StatelessWidget {
  const WhiteCircle({super.key});

  @override
  Widget build(BuildContext context) {
    final widthOfCircle = responsiveSize(
      context,
      widthOfScreen(context) / 2.5,
      widthOfScreen(context) / 3.5,
    );
    return Container(
      width: widthOfCircle,
      height: widthOfCircle,
      decoration: BoxDecoration(
        color: ColorName.white,
        borderRadius: BorderRadius.all(
          Radius.circular(widthOfCircle / 2),
        ),
      ),
    );
  }
}

class AboutDev extends StatefulWidget {
  const AboutDev({
    super.key,
    required this.controller,
    required this.width,
  });

  final AnimationController controller;
  final double width;

  @override
  AboutDevState createState() => AboutDevState();
}

class AboutDevState extends State<AboutDev> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    EdgeInsetsGeometry margin = const EdgeInsets.only(left: 16);
    final CurvedAnimation curvedAnimation = CurvedAnimation(
      parent: widget.controller,
      curve: Interval(0.6, 1.0, curve: Curves.fastOutSlowIn),
    );
    double headerFontSize = responsiveSize(context, 28, 48, md: 36, sm: 32);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: margin,
          child: AnimatedTextSlideBoxTransition(
            controller: widget.controller,
            text: StringConst.HI,
            width: widget.width,
            maxLines: 3,
            textStyle: textTheme.displayMedium?.copyWith(
              color: ColorName.black,
              fontSize: headerFontSize,
            ),
          ),
        ),
        SpaceH12(),
        Container(
          margin: margin,
          child: AnimatedTextSlideBoxTransition(
            controller: widget.controller,
            text: StringConst.devIntro,
            width: widget.width,
            maxLines: 3,
            textStyle: textTheme.displayMedium?.copyWith(
              color: ColorName.black,
              fontSize: headerFontSize,
            ),
          ),
        ),
        SpaceH12(),
        Container(
          margin: margin,
          child: AnimatedTextSlideBoxTransition(
            controller: widget.controller,
            text: StringConst.devTitle,
            width: responsiveSize(
              context,
              widget.width * 0.75,
              widget.width,
              md: widget.width,
              sm: widget.width,
            ),
            maxLines: 3,
            textStyle: textTheme.displayMedium?.copyWith(
              color: ColorName.black,
              fontSize: headerFontSize,
            ),
          ),
        ),
        SpaceH30(),
        Container(
          margin: margin,
          child: AnimatedPositionedText(
            controller: curvedAnimation,
            width: widget.width,
            maxLines: 3,
            factor: 2,
            text: StringConst.devDesc,
            textStyle: textTheme.bodyLarge?.copyWith(
              fontSize: responsiveSize(
                context,
                Sizes.TEXT_SIZE_16,
                Sizes.TEXT_SIZE_18,
              ),
              height: 2,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SpaceH30(),
        AnimatedPositionedWidget(
          controller: curvedAnimation,
          width: 200,
          height: 60,
          child: AnimatedBubbleButton(
            color: ColorName.grey100,
            imageColor: ColorName.black,
            startOffset: Offset(0, 0),
            targetOffset: Offset(0.1, 0),
            targetWidth: 200,
            startBorderRadius: const BorderRadius.all(
              Radius.circular(100.0),
            ),
            title: StringConst.SEE_MY_WORKS.toUpperCase(),
            titleStyle: textTheme.bodyLarge?.copyWith(
              color: ColorName.black,
              fontSize: responsiveSize(
                context,
                Sizes.TEXT_SIZE_14,
                Sizes.TEXT_SIZE_16,
                sm: Sizes.TEXT_SIZE_15,
              ),
              fontWeight: FontWeight.w500,
            ),
            onTap: () {
              Navigator.pushNamed(context, WorksPage.worksPageRoute);
            },
          ),
        ),
        SpaceH40(),
        Container(
          margin: margin,
          child: Wrap(
            spacing: 20,
            runSpacing: 20,
            children: _buildSocials(
              context: context,
              data: Data.socialData1,
            ),
          ),
        )
      ],
    );
  }

  List<Widget> _buildSocials({
    required BuildContext context,
    required List<SocialData> data,
  }) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? style = textTheme.bodyLarge?.copyWith(color: ColorName.grey750);
    TextStyle? slashStyle = textTheme.bodyLarge?.copyWith(
      color: ColorName.grey750,
      fontWeight: FontWeight.w400,
      fontSize: 18,
    );
    List<Widget> items = [];

    for (int index = 0; index < data.length; index++) {
      items.add(
        AnimatedLineThroughText(
          text: data[index].name,
          isUnderlinedByDefault: true,
          controller: widget.controller,
          hasSlideBoxAnimation: true,
          hasOffsetAnimation: true,
          isUnderlinedOnHover: false,
          onTap: () {
            Functions.launchUrl(data[index].url);
          },
          textStyle: style,
        ),
      );

      if (index < data.length - 1) {
        items.add(
          Text('/', style: slashStyle),
        );
      }
    }

    return items;
  }
}

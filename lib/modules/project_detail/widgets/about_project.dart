import 'package:mishaqbutt/core/design_system/values/animations.dart';
import 'package:mishaqbutt/core/design_system/values/sizes.dart';
import 'package:mishaqbutt/core/design_system/values/strings.dart';
import 'package:mishaqbutt/core/layout/adaptive.dart';
import 'package:mishaqbutt/core/utils/functions.dart';
import 'package:mishaqbutt/generated/assets/assets.gen.dart';
import 'package:mishaqbutt/generated/assets/colors.gen.dart';
import 'package:mishaqbutt/modules/project_detail/model/project_detail_model.dart';
import 'package:mishaqbutt/modules/widgets/animated_bubble_button.dart';
import 'package:mishaqbutt/modules/widgets/animated_positioned_text.dart';
import 'package:mishaqbutt/modules/widgets/animated_positioned_widget.dart';
import 'package:mishaqbutt/modules/widgets/animated_text_slide_box_transition.dart';
import 'package:mishaqbutt/modules/widgets/empty.dart';
import 'package:mishaqbutt/modules/widgets/spaces.dart';
import 'package:flutter/material.dart';

List<String> titles = [
  StringConst.platform,
  StringConst.category,
  StringConst.author,
  StringConst.designer,
  StringConst.technologyUser,
];

class AboutProject extends StatefulWidget {
  const AboutProject({
    super.key,
    required this.controller,
    required this.projectDataController,
    required this.projectData,
    required this.width,
  });

  final AnimationController controller;
  final AnimationController projectDataController;
  final ProjectDetailModel projectData;
  final double width;

  @override
  AboutProjectState createState() => AboutProjectState();
}

class AboutProjectState extends State<AboutProject> {
  @override
  void initState() {
    super.initState();

    widget.controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.projectDataController.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double googlePlayButtonWidth = 150;
    double targetWidth = responsiveSize(context, 118, 150, md: 150);
    double initialWidth = responsiveSize(context, 36, 50, md: 50);
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? bodyTextStyle = textTheme.bodyLarge?.copyWith(
      fontSize: Sizes.textSize18,
      color: ColorName.grey750,
      fontWeight: FontWeight.w400,
      height: 2.0,
    );
    double projectDataWidth = responsiveSize(
      context,
      widget.width,
      widget.width * 0.55,
      md: widget.width * 0.75,
    );
    double projectDataSpacing =
        responsiveSize(context, widget.width * 0.1, 48, md: 36);
    double widthOfProjectItem = (projectDataWidth - (projectDataSpacing)) / 2;
    BorderRadiusGeometry borderRadius = BorderRadius.all(
      Radius.circular(100.0),
    );
    TextStyle? buttonStyle = textTheme.bodyLarge?.copyWith(
      color: ColorName.black,
      fontSize: responsiveSize(
        context,
        Sizes.textSize14,
        Sizes.textSize16,
        sm: Sizes.textSize15,
      ),
      fontWeight: FontWeight.w500,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedTextSlideBoxTransition(
          controller: widget.controller,
          text: StringConst.aboutProject,
          coverColor: ColorName.white,
          textStyle: textTheme.headlineLarge?.copyWith(
            fontSize: Sizes.textSize48,
          ),
        ),
        SpaceH40(),
        AnimatedPositionedText(
          controller: CurvedAnimation(
            parent: widget.controller,
            curve: Animations.textSlideInCurve,
          ),
          width: widget.width * 0.7,
          maxLines: 10,
          text: widget.projectData.portfolioDescription,
          textStyle: bodyTextStyle,
        ),
        // SpaceH12(),
        SizedBox(
          width: projectDataWidth,
          child: Wrap(
            spacing: projectDataSpacing,
            runSpacing: responsiveSize(context, 30, 40),
            children: [
              AboutProjectData(
                controller: widget.projectDataController,
                width: widthOfProjectItem,
                title: StringConst.platform,
                subtitle: widget.projectData.platform,
              ),
              AboutProjectData(
                controller: widget.projectDataController,
                width: widthOfProjectItem,
                title: StringConst.category,
                subtitle: widget.projectData.category,
              ),
              AboutProjectData(
                controller: widget.projectDataController,
                width: widthOfProjectItem,
                title: StringConst.author,
                subtitle: StringConst.devName,
              ),
            ],
          ),
        ),
        widget.projectData.designer != null ? SpaceH30() : Empty(),
        widget.projectData.designer != null
            ? AboutProjectData(
                controller: widget.projectDataController,
                title: StringConst.designer,
                subtitle: widget.projectData.designer!,
              )
            : Empty(),
        widget.projectData.technologyUsed != null ? SpaceH30() : Empty(),
        widget.projectData.technologyUsed != null
            ? AboutProjectData(
                controller: widget.projectDataController,
                title: StringConst.technologyUser,
                subtitle: widget.projectData.technologyUsed!,
              )
            : Empty(),
        SpaceH30(),
        Row(
          children: [
            widget.projectData.isLive
                ? AnimatedPositionedWidget(
                    controller: CurvedAnimation(
                      parent: widget.projectDataController,
                      curve: Animations.textSlideInCurve,
                    ),
                    width: targetWidth,
                    height: initialWidth,
                    child: AnimatedBubbleButton(
                      title: StringConst.launchApp,
                      color: ColorName.grey100,
                      imageColor: ColorName.black,
                      startBorderRadius: borderRadius,
                      startWidth: initialWidth,
                      height: initialWidth,
                      targetWidth: targetWidth,
                      titleStyle: buttonStyle,
                      onTap: () {
                        Functions.launchUrl(widget.projectData.webUrl);
                      },
                      startOffset: Offset(0, 0),
                      targetOffset: Offset(0.1, 0),
                    ),
                  )
                : Empty(),
            widget.projectData.isLive ? Spacer() : Empty(),
            widget.projectData.isPublic
                ? AnimatedPositionedWidget(
                    controller: CurvedAnimation(
                      parent: widget.projectDataController,
                      curve: Animations.textSlideInCurve,
                    ),
                    width: targetWidth,
                    height: initialWidth,
                    child: AnimatedBubbleButton(
                      title: StringConst.sourceCode,
                      color: ColorName.grey100,
                      imageColor: ColorName.black,
                      startBorderRadius: borderRadius,
                      startWidth: initialWidth,
                      height: initialWidth,
                      targetWidth: targetWidth,
                      titleStyle: buttonStyle,
                      startOffset: Offset(0, 0),
                      targetOffset: Offset(0.1, 0),
                      onTap: () {
                        Functions.launchUrl(widget.projectData.gitHubUrl);
                      },
                    ),
                  )
                : Empty(),
            widget.projectData.isPublic ? Spacer() : Empty(),
          ],
        ),
        widget.projectData.isPublic || widget.projectData.isLive
            ? SpaceH30()
            : Empty(),
        widget.projectData.isOnPlayStore
            ? InkWell(
                onTap: () {
                  Functions.launchUrl(widget.projectData.playStoreUrl);
                },
                child: AnimatedPositionedWidget(
                  controller: CurvedAnimation(
                    parent: widget.projectDataController,
                    curve: Animations.textSlideInCurve,
                  ),
                  width: googlePlayButtonWidth,
                  height: 50,
                  child: Assets.icons.googlePlay.svg(width: googlePlayButtonWidth,),
                  
                ),
              )
            : Empty(),
      ],
    );
  }
}

class AboutProjectData extends StatelessWidget {
  const AboutProjectData({
    super.key,
    required this.title,
    required this.subtitle,
    required this.controller,
    this.width = double.infinity,
    this.titleStyle,
    this.subtitleStyle,
  });

  final String title;
  final String subtitle;
  final double width;
  final AnimationController controller;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    TextStyle? defaultTitleStyle = textTheme.titleLarge?.copyWith(
      color: ColorName.black,
      fontSize: 17,
    );
    TextStyle? defaultSubtitleStyle = textTheme.bodyLarge?.copyWith(
      fontSize: 15,
    );

    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedTextSlideBoxTransition(
            width: width,
            maxLines: 2,
            coverColor: ColorName.white,
            controller: controller,
            text: title,
            textStyle: titleStyle ?? defaultTitleStyle,
          ),
          SpaceH12(),
          AnimatedPositionedText(
            width: width,
            maxLines: 2,
            controller: CurvedAnimation(
              parent: controller,
              curve: Animations.textSlideInCurve,
            ),
            text: subtitle,
            textStyle: subtitleStyle ?? defaultSubtitleStyle,
          ),
        ],
      ),
    );
  }
}

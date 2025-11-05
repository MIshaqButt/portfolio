import 'package:mishaqbutt/core/design_system/values/data.dart';
import 'package:mishaqbutt/core/design_system/values/sizes.dart';
import 'package:mishaqbutt/core/design_system/values/strings.dart';
import 'package:mishaqbutt/core/layout/adaptive.dart';
import 'package:mishaqbutt/core/utils/functions.dart';
import 'package:mishaqbutt/generated/assets/colors.gen.dart';
import 'package:mishaqbutt/modules/about/data/about_data.dart';
import 'package:mishaqbutt/modules/about/widgets/about_header.dart';
import 'package:mishaqbutt/modules/about/widgets/technology_section.dart';
import 'package:mishaqbutt/modules/widgets/animated_footer.dart';
import 'package:mishaqbutt/modules/widgets/socials.dart';
import 'package:mishaqbutt/modules/widgets/animated_line_through_text.dart';
import 'package:mishaqbutt/modules/widgets/animated_positioned_text.dart';
import 'package:mishaqbutt/modules/widgets/animated_text_slide_box_transition.dart';
import 'package:mishaqbutt/modules/widgets/content_area.dart';
import 'package:mishaqbutt/modules/widgets/content_builder.dart';
import 'package:mishaqbutt/modules/widgets/custom_spacer.dart';
import 'package:mishaqbutt/modules/widgets/page_wrapper.dart';
import 'package:mishaqbutt/modules/widgets/spaces.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';


class AboutPage extends StatefulWidget {
  static const String aboutPageRoute = StringConst.aboutPage;
  const AboutPage({super.key});

  @override
  AboutPageState createState() => AboutPageState();
}

class AboutPageState extends State<AboutPage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _storyController;
  late AnimationController _technologyController;
  late AnimationController _contactController;
  late AnimationController _technologyListController;
  late AnimationController _quoteController;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _storyController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _technologyController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _technologyListController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _contactController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _quoteController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _storyController.dispose();
    _technologyController.dispose();
    _technologyListController.dispose();
    _contactController.dispose();
    _quoteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double contentAreaWidth = responsiveSize(
      context,
      assignWidth(context, 0.8),
      assignWidth(context, 0.75),
      sm: assignWidth(context, 0.8),
    );
    EdgeInsetsGeometry padding = EdgeInsets.only(
      left: responsiveSize(
        context,
        assignWidth(context, 0.10),
        assignWidth(context, 0.15),
      ),
      right: responsiveSize(
        context,
        assignWidth(context, 0.10),
        assignWidth(context, 0.10),
        // sm: assignWidth(context, 0.10),
      ),
      top: responsiveSize(
        context,
        assignHeight(context, 0.15),
        assignHeight(context, 0.15),
        // sm: assignWidth(context, 0.10),
      ),
    );

    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? bodyLargeStyle = textTheme.bodyLarge?.copyWith(
      fontSize: Sizes.textSize18,
      color: ColorName.grey750,
      fontWeight: FontWeight.w400,
      height: 2.0,
      // letterSpacing: 2,
    );
    TextStyle? bodyMediumStyle =
        textTheme.bodyLarge?.copyWith(color: ColorName.grey750);
    TextStyle? titleStyle = textTheme.titleLarge?.copyWith(
      color: ColorName.black,
      fontSize: responsiveSize(
        context,
        Sizes.textSize16,
        Sizes.textSize20,
      ),
    );
    CurvedAnimation storySectionAnimation = CurvedAnimation(
      parent: _storyController,
      curve: Interval(0.6, 1.0, curve: Curves.ease),
    );
    CurvedAnimation technologySectionAnimation = CurvedAnimation(
      parent: _technologyController,
      curve: Interval(0.6, 1.0, curve: Curves.fastOutSlowIn),
    );
    double widthOfBody = responsiveSize(
      context,
      assignWidth(context, 0.75),
      assignWidth(context, 0.5),
    );
    return PageWrapper(
      selectedRoute: AboutPage.aboutPageRoute,
      selectedPageName: StringConst.about,
      navBarAnimationController: _controller,
      onLoadingAnimationDone: () {
        _controller.forward();
      },
      child: ListView(
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: [
          Padding(
            padding: padding,
            child: ContentArea(
              width: contentAreaWidth,
              child: Column(
                children: [
                  AboutHeader(
                    width: contentAreaWidth,
                    controller: _controller,
                  ),
                  CustomSpacer(heightFactor: 0.1),
                  VisibilityDetector(
                    key: Key('story-section'),
                    onVisibilityChanged: (visibilityInfo) {
                      double visiblePercentage =
                          visibilityInfo.visibleFraction * 100;
                      if (visiblePercentage >
                          responsiveSize(context, 40, 70, md: 50)) {
                        _storyController.forward();
                      }
                    },
                    child: ContentBuilder(
                      controller: _storyController,
                      number: "/01 ",
                      width: contentAreaWidth,
                      section: StringConst.aboutDevStore.toUpperCase(),
                      title: StringConst.aboutDevStoreTitle,
                      body: Column(
                        children: [
                          AnimatedPositionedText(
                            controller: storySectionAnimation,
                            width: widthOfBody,
                            maxLines: 30,
                            // factor: 1.25,
                            text: AboutData.about1,
                            textStyle: bodyLargeStyle,
                          ),
                          AnimatedPositionedText(
                            controller: storySectionAnimation,
                            width: widthOfBody,
                            maxLines: 30,
                            text: AboutData.about2,
                            textStyle: bodyLargeStyle,
                          ),
                          AnimatedPositionedText(
                            controller: storySectionAnimation,
                            width: widthOfBody,
                            maxLines: 30,
                            text: AboutData.about3,
                            textStyle: bodyLargeStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                  CustomSpacer(heightFactor: 0.1),
                  VisibilityDetector(
                    key: Key('technology-section'),
                    onVisibilityChanged: (visibilityInfo) {
                      double visiblePercentage =
                          visibilityInfo.visibleFraction * 100;
                      if (visiblePercentage > 50) {
                        _technologyController.forward();
                      }
                    },
                    child: ContentBuilder(
                      controller: _technologyController,
                      number: "/02 ",
                      width: contentAreaWidth,
                      section: StringConst.aboutDevTechnology.toUpperCase(),
                      title: StringConst.aboutDevTechnologyTitle,
                      body: Column(
                        children: [
                          AnimatedPositionedText(
                            controller: technologySectionAnimation,
                            width: widthOfBody,
                            maxLines: 12,
                            text: StringConst.aboutDevTechnologyContent,
                            textStyle: bodyLargeStyle,
                          ),
                        ],
                      ),
                      footer: VisibilityDetector(
                        key: Key('technology-list'),
                        onVisibilityChanged: (visibilityInfo) {
                          double visiblePercentage =
                              visibilityInfo.visibleFraction * 100;
                          if (visiblePercentage > 60) {
                            _technologyListController.forward();
                          }
                        },
                        child: Column(
                          children: [
                            SpaceH40(),
                            TechnologySection(
                              width: contentAreaWidth,
                              controller: _technologyListController,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  CustomSpacer(heightFactor: 0.1),
                  VisibilityDetector(
                    key: Key('contact-section'),
                    onVisibilityChanged: (visibilityInfo) {
                      double visiblePercentage =
                          visibilityInfo.visibleFraction * 100;
                      if (visiblePercentage > 50) {
                        _contactController.forward();
                      }
                    },
                    child: ContentBuilder(
                      controller: _contactController,
                      number: "/03 ",
                      width: contentAreaWidth,
                      section: StringConst.aboutDevContact.toUpperCase(),
                      title: StringConst.aboutDevContactSocial,
                      body: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SpaceH20(),
                          Wrap(
                            spacing: 20,
                            runSpacing: 20,
                            children: _buildSocials(Data.socialData2),
                          ),
                        ],
                      ),
                      footer: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SpaceH40(),
                          AnimatedTextSlideBoxTransition(
                            controller: _contactController,
                            text: StringConst.aboutDevContactEmail,
                            textStyle: titleStyle,
                          ),
                          SpaceH40(),
                          AnimatedLineThroughText(
                            text: StringConst.devEmail,
                            hasSlideBoxAnimation: true,
                            controller: _contactController,
                            onTap: () {
                              Functions.launchUrl(StringConst.emailURL);
                            },
                            textStyle: bodyMediumStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                  CustomSpacer(heightFactor: 0.1),
                  VisibilityDetector(
                    key: Key('quote-section'),
                    onVisibilityChanged: (visibilityInfo) {
                      double visiblePercentage =
                          visibilityInfo.visibleFraction * 100;
                      if (visiblePercentage > 50) {
                        _quoteController.forward();
                      }
                    },
                    child: Column(
                      children: [
                        AnimatedTextSlideBoxTransition(
                          controller: _quoteController,
                          text: StringConst.famousQuote,
                          maxLines: 5,
                          width: contentAreaWidth,
                          textAlign: TextAlign.center,
                          textStyle: titleStyle?.copyWith(
                            fontSize: responsiveSize(
                              context,
                              Sizes.textSize24,
                              Sizes.textSize36,
                              md: Sizes.textSize28,
                            ),
                            height: 2.0,
                          ),
                        ),
                        SpaceH20(),
                        Align(
                          alignment: Alignment.centerRight,
                          child: AnimatedTextSlideBoxTransition(
                            controller: _quoteController,
                            text: "— ${StringConst.famousQuoteAuthor}",
                            textStyle: textTheme.bodyLarge?.copyWith(
                              fontSize: responsiveSize(
                                context,
                                Sizes.textSize16,
                                Sizes.textSize18,
                                md: Sizes.textSize16,
                              ),
                              fontWeight: FontWeight.w400,
                              color: ColorName.grey600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  CustomSpacer(heightFactor: 0.2),
                ],
              ),
            ),
          ),
          // SlidingBanner(),
          AnimatedFooter()
        ],
      ),
    );
  }

  List<Widget> _buildSocials(List<SocialData> data) {
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
          controller: _contactController,
          hasSlideBoxAnimation: true,
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

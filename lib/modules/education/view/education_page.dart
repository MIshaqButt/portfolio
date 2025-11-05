import 'package:mishaqbutt/core/design_system/values/sizes.dart';
import 'package:mishaqbutt/core/design_system/values/strings.dart';
import 'package:mishaqbutt/core/layout/adaptive.dart';
import 'package:mishaqbutt/generated/assets/colors.gen.dart';
import 'package:mishaqbutt/modules/education/data/education_data.dart';
import 'package:mishaqbutt/modules/education/model/education_model.dart';
import 'package:mishaqbutt/modules/widgets/animated_footer.dart';
import 'package:mishaqbutt/modules/widgets/page_header.dart';
import 'package:mishaqbutt/modules/widgets/animated_positioned_text.dart';
import 'package:mishaqbutt/modules/widgets/animated_text_slide_box_transition.dart';
import 'package:mishaqbutt/modules/widgets/content_area.dart';
import 'package:mishaqbutt/modules/widgets/content_builder.dart';
import 'package:mishaqbutt/modules/widgets/custom_spacer.dart';
import 'package:mishaqbutt/modules/widgets/page_wrapper.dart';
import 'package:mishaqbutt/modules/widgets/spaces.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class EducationPage extends StatefulWidget {
  static const String educationPageRoute = StringConst.educationPage;
  const EducationPage({super.key});

  @override
  EducationPageState createState() => EducationPageState();
}

class EducationPageState extends State<EducationPage>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _education1Controller;
  late AnimationController _education2Controller;
  late List<AnimationController> _educationControllers;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _education1Controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _education2Controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _educationControllers = [
      _education1Controller,
      _education2Controller,
    ];
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _education1Controller.dispose();
    _education2Controller.dispose();
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
      ),
      top: responsiveSize(
        context,
        assignHeight(context, 0.15),
        assignHeight(context, 0.15),
      ),
    );

    return PageWrapper(
      selectedRoute: EducationPage.educationPageRoute,
      selectedPageName: StringConst.education,
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
          PageHeader(
            headingText: StringConst.education,
            headingTextController: _controller,
          ),
          Padding(
            padding: padding,
            child: ContentArea(
              width: contentAreaWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _buildEducationSection(
                  data: EducationData.educationData,
                  width: contentAreaWidth,
                ),
              ),
            ),
          ),
          AnimatedFooter(),
        ],
      ),
    );
  }

  List<Widget> _buildEducationSection({
    required List<EducationModel> data,
    required double width,
  }) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? defaultTitleStyle = textTheme.titleLarge?.copyWith(
      color: ColorName.black,
      fontSize: responsiveSize(
        context,
        Sizes.textSize18,
        Sizes.textSize20,
      ),
    );

    List<Widget> items = [];

    for (int index = 0; index < data.length; index++) {
      items.add(
        VisibilityDetector(
          key: Key('education-section-$index'),
          onVisibilityChanged: (visibilityInfo) {
            double visiblePercentage = visibilityInfo.visibleFraction * 100;
            if (visiblePercentage > 40) {
              _educationControllers[index].forward();
            }
          },
          child: ContentBuilder(
            controller: _educationControllers[index],
            number: "/0${index + 1}",
            width: width,
            section: data[index].duration.toUpperCase(),
            heading: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedTextSlideBoxTransition(
                  controller: _educationControllers[index],
                  text: data[index].degree,
                  textStyle: defaultTitleStyle,
                ),
                SpaceH16(),
                AnimatedTextSlideBoxTransition(
                  controller: _educationControllers[index],
                  text: data[index].institute,
                  textStyle: defaultTitleStyle?.copyWith(
                    fontSize: responsiveSize(
                      context,
                      Sizes.textSize16,
                      Sizes.textSize18,
                    ),
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _buildRoles(
                roles: data[index].majorSubjects,
                controller: _educationControllers[index],
                width: width * 0.75,
              ),
            ),
          ),
        ),
      );
      items.add(
        CustomSpacer(heightFactor: 0.1),
      );
    }

    return items;
  }

  List<Widget> _buildRoles({
    required List<String> roles,
    required AnimationController controller,
    required double width,
  }) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final TextStyle? bodyLargeStyle = textTheme.bodyLarge?.copyWith(
      fontSize: responsiveSize(
        context,
        Sizes.textSize16,
        17,
      ),
      color: ColorName.grey750,
      fontWeight: FontWeight.w300,
      height: 1.5,
      // letterSpacing: 2,
    );

    List<Widget> items = [];
    for (int index = 0; index < roles.length; index++) {
      items.add(
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.play_arrow_outlined,
              color: ColorName.black,
              size: 12,
            ),
            SpaceW8(),
            Flexible(
              child: AnimatedPositionedText(
                text: roles[index],
                textStyle: bodyLargeStyle,
                maxLines: 7,
                width: width,
                controller: CurvedAnimation(
                  parent: controller,
                  curve: Interval(0.6, 1.0, curve: Curves.fastOutSlowIn),
                ),
              ),
            ),
          ],
        ),
      );

      items.add(SpaceH12());
    }

    return items;
  }
}

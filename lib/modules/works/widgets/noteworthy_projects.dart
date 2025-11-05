import 'package:mishaqbutt/core/design_system/values/sizes.dart';
import 'package:mishaqbutt/core/design_system/values/strings.dart';
import 'package:mishaqbutt/core/layout/adaptive.dart';
import 'package:mishaqbutt/core/utils/functions.dart';
import 'package:mishaqbutt/generated/assets/colors.gen.dart';
import 'package:mishaqbutt/modules/widgets/animated_line_through_text.dart';
import 'package:mishaqbutt/modules/widgets/animated_positioned_text.dart';
import 'package:mishaqbutt/modules/widgets/animated_text_slide_box_transition.dart';
import 'package:mishaqbutt/modules/widgets/spaces.dart';
import 'package:flutter/material.dart';
import 'package:mishaqbutt/modules/works/data/note_worthy_project_data.dart';
import 'package:mishaqbutt/modules/works/model/note_worthy_project_model.dart';
import 'package:visibility_detector/visibility_detector.dart';

class NoteWorthyProjects extends StatefulWidget {
  const NoteWorthyProjects({super.key});

  @override
  NoteWorthyProjectsState createState() => NoteWorthyProjectsState();
}

class NoteWorthyProjectsState extends State<NoteWorthyProjects>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? titleStyle = textTheme.titleLarge?.copyWith(
      color: ColorName.black,
      fontSize: responsiveSize(context, Sizes.textSize20, Sizes.textSize30),
    );
    TextStyle? bodyLargeStyle = textTheme.bodyLarge?.copyWith(
      fontSize: responsiveSize(context, Sizes.textSize16, Sizes.textSize18),
      color: ColorName.grey750,
      fontWeight: FontWeight.w400,
      height: 2.0,
      // letterSpacing: 2,
    );

    return VisibilityDetector(
      key: Key('noteworthy-projects'),
      onVisibilityChanged: (visibilityInfo) {
        double visiblePercentage = visibilityInfo.visibleFraction * 100;
        if (visiblePercentage > 25) {
          _controller.forward();
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedTextSlideBoxTransition(
            heightFactor: 1.5,
            controller: _controller,
            text: StringConst.noteWorthyProjects,
            textStyle: titleStyle,
          ),
          SpaceH16(),
          AnimatedPositionedText(
            controller: CurvedAnimation(
              parent: _controller,
              curve: Interval(0.6, 1.0, curve: Curves.fastOutSlowIn),
            ),
            text: StringConst.noteWorthyProjectsDesc,
            textStyle: bodyLargeStyle,
          ),
          SpaceH40(),
          ..._buildNoteworthyProjects(NoteWorthyProjectData.noteworthyProjects),
        ],
      ),
    );
  }

  List<Widget> _buildNoteworthyProjects(List<NoteWorthyProjectModel> data) {
    List<Widget> items = [];

    for (int index = 0; index < data.length; index++) {
      items.add(
        NoteWorthyProjectItem(
          controller: _controller,
          number: index + 1 > 9 ? "/${index + 1}" : "/0${index + 1}",
          projectName: data[index].projectName,
          onSourceTap: data[index].isPublic
              ? () {
                  Functions.launchUrl(data[index].gitHubUrl!);
                }
              : null,
          onProjectNameTap: data[index].isLive
              ? () {
                  data[index].isOnAppStore
                      ? Functions.launchUrl(data[index].appStoreUrl!)
                      : data[index].isOnPlayStore
                      ? Functions.launchUrl(data[index].playStoreUrl!)
                      : Functions.launchUrl(data[index].webUrl!);
                }
              : (data[index].isPublic
                    ? () {
                        Functions.launchUrl(data[index].gitHubUrl!);
                      }
                    : null),
        ),
      );
      items.add(SpaceH40());
    }

    return items;
  }
}

class NoteWorthyProjectItem extends StatelessWidget {
  const NoteWorthyProjectItem({
    super.key,
    required this.number,
    required this.projectName,
    required this.controller,
    this.source = "<src/>",
    this.numberStyle,
    this.projectNameStyle,
    this.sourceStyle,
    this.onSourceTap,
    this.onProjectNameTap,
  });

  final String number;
  final String source;
  final String projectName;
  final AnimationController controller;
  final TextStyle? numberStyle;
  final TextStyle? sourceStyle;
  final TextStyle? projectNameStyle;
  final GestureTapCallback? onSourceTap;
  final GestureTapCallback? onProjectNameTap;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? defaultNumberStyle = textTheme.titleLarge?.copyWith(
      fontSize: Sizes.textSize16,
      color: ColorName.grey550,
      fontWeight: FontWeight.w400,
    );
    TextStyle? defaultSourceStyle = textTheme.titleLarge?.copyWith(
      fontSize: Sizes.textSize16,
      color: ColorName.grey700,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.underline,
    );
    TextStyle? defaultProjectNameStyle = textTheme.titleLarge?.copyWith(
      fontSize: responsiveSize(
        context,
        Sizes.textSize16,
        Sizes.textSize20,
        sm: Sizes.textSize18,
      ),
      color: ColorName.black,
      fontWeight: FontWeight.w500,
    );
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedTextSlideBoxTransition(
          controller: controller,
          text: number,
          textStyle: numberStyle ?? defaultNumberStyle,
        ),
        SpaceW20(),
        InkWell(
          onTap: onSourceTap,
          hoverColor: Colors.transparent,
          child: AnimatedTextSlideBoxTransition(
            controller: controller,
            text: source,
            textStyle: sourceStyle ?? defaultSourceStyle,
          ),
        ),
        SpaceW20(),
        Flexible(
          child: AnimatedLineThroughText(
            maxLines: 3,
            width: assignWidth(context, 0.5),
            hasSlideBoxAnimation: true,
            controller: controller,
            text: projectName,
            onTap: onProjectNameTap,
            textStyle: projectNameStyle ?? defaultProjectNameStyle,
            isUnderlinedOnHover: false,
            isUnderlinedByDefault: true,
          ),
        ),
      ],
    );
  }
}

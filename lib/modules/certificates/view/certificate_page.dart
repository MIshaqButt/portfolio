import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mishaqbutt/core/design_system/values/animations.dart';
import 'package:mishaqbutt/core/design_system/values/strings.dart';
import 'package:mishaqbutt/core/layout/adaptive.dart';
import 'package:mishaqbutt/generated/assets/colors.gen.dart';
import 'package:mishaqbutt/modules/certificates/data/certificate_data.dart';
import 'package:mishaqbutt/modules/certificates/model/certificate_model.dart';
import 'package:mishaqbutt/modules/widgets/page_header.dart';
import 'package:mishaqbutt/modules/widgets/simple_footer.dart';
import 'package:mishaqbutt/modules/widgets/certification_card.dart';
import 'package:mishaqbutt/modules/widgets/content_area.dart';
import 'package:mishaqbutt/modules/widgets/custom_spacer.dart';
import 'package:mishaqbutt/modules/widgets/page_wrapper.dart';
import 'package:mishaqbutt/modules/widgets/spaces.dart';
import 'package:visibility_detector/visibility_detector.dart';

class CertificationPage extends StatefulWidget {
  static const String certificationPageRoute = StringConst.certificationPage;
  const CertificationPage({super.key});

  @override
  CertificationPageState createState() => CertificationPageState();
}

class CertificationPageState extends State<CertificationPage>
    with TickerProviderStateMixin {
  late AnimationController _certificationsController;
  late AnimationController _headingTextController;

  @override
  void initState() {
    _certificationsController = AnimationController(
      duration: Animations.slideAnimationDurationShort,
      vsync: this,
    );
    _headingTextController = AnimationController(
      vsync: this,
      duration: Animations.slideAnimationDurationLong,
    );

    super.initState();
  }

  @override
  void dispose() {
    _headingTextController.dispose();
    _certificationsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double spacing = assignWidth(context, 0.05);
    double contentAreaWidth = responsiveSize(
      context,
      assignWidth(context, 0.8),
      assignWidth(context, 0.7),
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
        assignWidth(context, 0.15),
        sm: assignWidth(context, 0.10),
      ),
      top: responsiveSize(
        context,
        assignHeight(context, 0.15),
        assignHeight(context, 0.15),
        sm: assignWidth(context, 0.10),
      ),
    );

    return PageWrapper(
      selectedRoute: CertificationPage.certificationPageRoute,
      selectedPageName: StringConst.certifications,
      navBarAnimationController: _headingTextController,
      onLoadingAnimationDone: () {
        _headingTextController.forward();
      },
      child: ListView(
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: [
          PageHeader(
            headingText: StringConst.certifications,
            headingTextController: _headingTextController,
          ),

          VisibilityDetector(
            key: Key('certifications'),
            onVisibilityChanged: (visibilityInfo) {
              if (!mounted) return;
              final visiblePercentage = visibilityInfo.visibleFraction * 100;
              if (visiblePercentage > 10 &&
                  !_certificationsController.isAnimating) {
                _certificationsController.forward();
              }
            },

            child: Padding(
              padding: padding,
              child: ContentArea(
                width: contentAreaWidth,
                child: AnimatedBuilder(
                  animation: _certificationsController,
                  builder: (context, child) {
                    if (!_certificationsController.isAnimating &&
                        !_certificationsController.isCompleted &&
                        !_certificationsController.isDismissed) {
                      return const SizedBox.shrink();
                    }
                    return Wrap(
                      direction: Axis.horizontal,
                      spacing: assignWidth(context, 0.05),
                      runSpacing: assignHeight(context, 0.02),
                      children: _certificateList(
                        data: CertificateData.certificateList,
                        width: contentAreaWidth,
                        spacing: spacing,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          CustomSpacer(heightFactor: 0.15),
          SimpleFooter(),
        ],
      ),
    );
  }

  List<Widget> _certificateList({
    required List<CertificateModel> data,
    required double width,
    required double spacing,
  }) {
    List<Widget> widgets = [];
    double duration = _certificationsController.duration!.inMilliseconds
        .roundToDouble();
    double durationForEachPortfolio =
        _certificationsController.duration!.inMilliseconds.roundToDouble() /
        data.length;

    for (var i = 0; i < data.length; i++) {
      double start = durationForEachPortfolio * i;
      double end = durationForEachPortfolio * (i + 1);
      widgets.add(
        FadeTransition(
          opacity: Tween<double>(begin: 0, end: 1).animate(
            CurvedAnimation(
              parent: _certificationsController,
              curve: Interval(
                start > 0.0 ? start / duration : 0.0,
                end > 0.0 ? end / duration : 1.0,
                curve: Curves.easeIn,
              ),
            ),
          ),
          child: CertificationCard(
            imageUrl: data[i].image,
            onTap: () => showCertificateDialog(context, data[i]),
            title: data[i].name,
            subtitle: data[i].institute,
            actionTitle: StringConst.view,
            isMobileOrTablet: isDisplayMobileOrTablet(context) ? true : false,
            height: isDisplayMobile(context)
                ? assignHeight(context, 0.40)
                : assignHeight(context, 0.45),
            width: isDisplayMobile(context)
                ? assignWidth(context, 0.8)
                : (width - spacing) / 2,
          ),
        ),
      );
    }
    return widgets;
  }

  void showCertificateDialog(
    BuildContext context,
    CertificateModel certificate,
  ) async {
    await showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext dialogContext) {
        Size size = MediaQuery.sizeOf(context);
        ThemeData theme = Theme.of(context);
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                certificate.type,
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineLarge?.copyWith(
                  color: ColorName.black,
                ),
              ),

              IconButton(
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                },
                icon:  Icon(Icons.close, color: ColorName.black,),
              ),
            ],
          ),
          content: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  certificate.name,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
                SpaceH4(),
                Text(
                  certificate.institute,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                SpaceH4(),
                Text(
                  certificate.dateFrom.toMonthAndYear() ==
                          certificate.dateTo.toMonthAndYear()
                      ? certificate.dateFrom.toMonthAndYear()
                      : "${certificate.dateFrom.toMonthAndYear()} - ${certificate.dateTo.toMonthAndYear()}",
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: ColorName.black100),
                  textAlign: TextAlign.justify,
                ),
                SpaceH16(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: certificate.description == ""
                          ? size.width * 0.9
                          : size.width * 0.35,
                      child: Column(
                        crossAxisAlignment: certificate.description == ""
                            ? CrossAxisAlignment.center
                            : CrossAxisAlignment.start,
                        mainAxisAlignment: certificate.description == ""
                            ? MainAxisAlignment.center
                            : MainAxisAlignment.start,
                        children: [
                          Text(
                            certificate.description,
                            style: Theme.of(context).textTheme.bodyMedium,
                            textAlign: TextAlign.justify,
                          ),
                          SpaceH12(),
                          ...(certificate.keyPoints ?? []).map(
                            (points) => Text('$points/_'),
                          ),
                          if (certificate.description == "")
                            Image.asset(
                              width: size.width * 0.8,
                              fit: BoxFit.cover,
                              certificate.image,
                            ),
                        ],
                      ),
                    ),
                    if (certificate.description != "") SpaceW12(),
                    if (certificate.description != "")
                      Image.asset(
                        width: size.width * 0.45,
                        fit: BoxFit.cover,
                        certificate.image,
                      ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

extension DateTimeEx on DateTime {
  String toMonthAndYear() {
    final DateFormat monthFormat = DateFormat('MMMM');
    final DateFormat yearFormat = DateFormat.y();
    return "${monthFormat.format(this).toUpperCase()} ${yearFormat.format(this)}";
  }
}

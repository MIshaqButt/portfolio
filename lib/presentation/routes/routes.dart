import 'package:m_ishaq_butt/modules/about/about_page.dart';
import 'package:m_ishaq_butt/modules/certificates/view/certificate_page.dart';
import 'package:m_ishaq_butt/presentation/pages/contact_page.dart';
import 'package:m_ishaq_butt/modules/experience/view/experience_page.dart';
import 'package:m_ishaq_butt/presentation/pages/project_detail/project_detail_page.dart';
import 'package:m_ishaq_butt/modules/works/works_page.dart';
import 'package:flutter/material.dart';
import 'package:m_ishaq_butt/modules/home/home_page.dart';

typedef PathWidgetBuilder =
    Widget Function(BuildContext, String?);

class Path {
  const Path(this.pattern, this.builder);
  final String pattern;
  final PathWidgetBuilder builder;
}

class RouteConfiguration {
  static List<Path> paths = [
    Path(
      r'^' + ContactPage.contactPageRoute,
      (context, matches) => const ContactPage(),
    ),
    Path(
      r'^' + AboutPage.aboutPageRoute,
      (context, matches) => const AboutPage(),
    ),
    Path(
      r'^' + WorksPage.worksPageRoute,
      (context, matches) => const WorksPage(),
    ),
    Path(
      r'^' + ProjectDetailPage.projectDetailPageRoute,
      (context, matches) => const ProjectDetailPage(),
    ),
    Path(
      r'^' + ExperiencePage.experiencePageRoute,
      (context, matches) => const ExperiencePage(),
    ),
    Path(
      r'^' + CertificationPage.certificationPageRoute,
      (context, matches) => const CertificationPage(),
    ),
    Path(r'^' + HomePage.homePageRoute, (context, matches) => HomePage()),
  ];

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    for (Path path in paths) {
      final regExpPattern = RegExp(path.pattern);
      if (regExpPattern.hasMatch(settings.name!)) {
        final firstMatch = regExpPattern.firstMatch(settings.name!)!;
        final match = (firstMatch.groupCount == 1) ? firstMatch.group(1) : null;
        return NoAnimationMaterialPageRoute<void>(
          builder: (context) => path.builder(context, match),
          settings: settings,
        );
      }
    }
    return null;
  }
}

class NoAnimationMaterialPageRoute<T> extends MaterialPageRoute<T> {
  NoAnimationMaterialPageRoute({required super.builder, super.settings});

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return child;
  }
}

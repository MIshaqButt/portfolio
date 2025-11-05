import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mishaqbutt/core/design_system/values/strings.dart';
import 'package:mishaqbutt/modules/project_detail/data/project_data.dart';
import 'package:mishaqbutt/modules/project_detail/model/project_detail_model.dart';
import 'package:mishaqbutt/modules/widgets/socials.dart';
import 'package:mishaqbutt/modules/widgets/nav_item.dart';

class SkillData {
  SkillData({required this.skillName, required this.skillLevel});

  final String skillName;
  final double skillLevel;
}

class SubMenuData {
  SubMenuData({
    required this.title,
    this.isSelected,
    this.content,
    this.skillData,
    this.isAnimation = false,
  });

  final String title;
  final String? content;
  final List<SkillData>? skillData;
  bool isAnimation;
  bool? isSelected;
}

class Data {
  static List<NavItemData> menuItems = [
    NavItemData(name: StringConst.home, route: StringConst.homePage),
    NavItemData(name: StringConst.about, route: StringConst.aboutPage),
    NavItemData(name: StringConst.works, route: StringConst.worksPage),
    NavItemData(name: StringConst.education, route: StringConst.educationPage),
    NavItemData(
      name: StringConst.experience,
      route: StringConst.experiencePage,
    ),
    NavItemData(
      name: StringConst.certifications,
      route: StringConst.certificationPage,
    ),
    NavItemData(name: StringConst.contact, route: StringConst.contactPage),
  ];

  static List<SocialData> socialData = [
    SocialData(
      name: StringConst.github,
      iconData: FontAwesomeIcons.github,
      url: StringConst.githubUrl,
    ),
    SocialData(
      name: StringConst.linkedin,
      iconData: FontAwesomeIcons.linkedin,
      url: StringConst.linkedinUrl,
    ),
  ];

  static List<String> mobileTechnologies = [
    "Flutter",
    "Dart",
    "Android",
    "Kotlin / Java",
    "iOS",
    "Swift",
  ];

  static List<String> otherTechnologies = [
    "HTML 5",
    "CSS 3",
    "JavaScript",
    "Typescript",
    "React JS",
    "Next JS",
    "Node JS",
    "Git",
    "AWS",
    "Docker",
    "Kubernetes",
    "Google Cloud",
    "Azure",
    "Travis CI",
    "Circle CI",
    "Express",
    "Chakra UI",
    "Laravel",
    "PHP",
    "SQL",
    "C++",
    "Firebase",
    "Figma",
    "Adobe XD",
    "Wordpress",
  ];

  static List<SocialData> socialData1 = [
    SocialData(
      name: StringConst.github,
      iconData: FontAwesomeIcons.github,
      url: StringConst.githubUrl,
    ),
    SocialData(
      name: StringConst.linkedin,
      iconData: FontAwesomeIcons.linkedin,
      url: StringConst.linkedinUrl,
    ),
  ];

  static List<SocialData> socialData2 = [
    SocialData(
      name: StringConst.linkedin,
      iconData: FontAwesomeIcons.linkedin,
      url: StringConst.linkedinUrl,
    ),
  ];

  static List<ProjectDetailModel> recentWorks = [
    ProjectData.alterEgo,
    ProjectData.parentFlow,
    ProjectData.riskli,
    ProjectData.dreamyBot,
    ProjectData.scrivilo,
    ProjectData.sobex,
    ProjectData.didConnect,
  ];

  static List<ProjectDetailModel> projects = [
    ProjectData.alterEgo,
    ProjectData.parentFlow,
    ProjectData.riskli,
    ProjectData.dreamyBot,
    ProjectData.scrivilo,
    ProjectData.sobex,
    ProjectData.didConnect,
    ProjectData.eVotter,
    ProjectData.careCircle,
    ProjectData.attentify,
    ProjectData.medSoft,
  ];
}

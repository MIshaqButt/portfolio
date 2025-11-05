import 'package:flutter/material.dart';
import 'package:mishaqbutt/generated/assets/colors.gen.dart';

class ProjectDetailModel {
  ProjectDetailModel({
    required this.title,
    required this.image,
    required this.coverUrl,
    required this.subtitle,
    required this.portfolioDescription,
    required this.platform,
    required this.primaryColor,
    required this.category,
    this.designer,
    this.projectAssets = const [],
    this.imageSize,
    this.technologyUsed,
    this.isPublic = false,
    this.isOnPlayStore = false,
    this.isOnAppStore = false,
    this.isLive = false,
    this.gitHubUrl = "",
    this.hasBeenReleased = true,
    this.playStoreUrl = "",
    this.appStoreUrl = "",
    this.webUrl = "",
    this.navTitleColor = ColorName.grey600,
    this.navSelectedTitleColor = ColorName.black,
    this.appLogoColor = ColorName.black,
  });

  final Color primaryColor;
  final Color navTitleColor;
  final Color navSelectedTitleColor;
  final Color appLogoColor;
  final String image;
  final String coverUrl;
  final String category;
  final List<String> projectAssets;
  final String portfolioDescription;
  final double? imageSize;
  final String title;
  final String subtitle;
  final String platform;
  final String? designer;
  final bool isPublic;
  final bool hasBeenReleased;
  final String gitHubUrl;
  final bool isOnPlayStore;
  final bool isOnAppStore;
  final String playStoreUrl;
  final String appStoreUrl;
  final bool isLive;
  final String webUrl;
  final String? technologyUsed;
}


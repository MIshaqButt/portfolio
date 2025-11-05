class NoteWorthyProjectModel {
  NoteWorthyProjectModel({
    required this.projectName,
    required this.isOnPlayStore,
    required this.isOnAppStore,
    required this.isPublic,
    required this.technologyUsed,
    required this.isLive,
    this.projectDescription,
    this.playStoreUrl,
    this.appStoreUrl,
    this.hasBeenReleased,
    this.gitHubUrl,
    this.webUrl,
  });

  final String projectName;
  final bool isPublic;
  final bool isOnPlayStore;
  final bool isOnAppStore;
  final String? projectDescription;
  final bool isLive;
  final bool? hasBeenReleased;
  final String? playStoreUrl;
  final String? appStoreUrl;
  final String? gitHubUrl;
  final String? webUrl;
  final String? technologyUsed;
}

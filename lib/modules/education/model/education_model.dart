class EducationModel {
  final String duration;
  final String institute;
  final String degree;
  final String marks;
  final ProjectType type;
  final List<String> majorSubjects;
  final String projectLink;
  final String projectName;
  final String projectDescription;

  EducationModel({
    required this.institute,
    required this.degree,
    required this.majorSubjects,
    required this.duration,
    required this.marks,
    this.type = ProjectType.fyp,
    required this.projectLink,
    required this.projectName,
    required this.projectDescription,
  });
}

enum ProjectType {
  thesis,
  fyp,
}


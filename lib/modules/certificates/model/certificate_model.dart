class CertificateModel {
  final String name;
  final String institute;
  final String image;
  final DateTime dateFrom;
  final DateTime dateTo;
  final String description;
  final List<String>? keyPoints;
  final String link;
  final String type;

  CertificateModel({
    required this.name,
    required this.institute,
    required this.description,
    this.keyPoints,
    required this.dateFrom,
    required this.dateTo,
    required this.image,
    required this.link,
    required this.type,
  });
}


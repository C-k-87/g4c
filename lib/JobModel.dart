class JobModel {
  final String id;
  final String image;
  final String name;
  final String description;
  final List<String> steps;

  const JobModel({
    required this.id,
    required this.image,
    required this.name,
    required this.description,
    required this.steps,
  });
}

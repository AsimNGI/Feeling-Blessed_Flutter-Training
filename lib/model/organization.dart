/// Organization model for org detail screen and reuse.
class Organization {
  final String name;
  final String location;
  final String website;
  final String coverImagePath;
  final String logoPath;

  const Organization({
    required this.name,
    required this.location,
    required this.website,
    required this.coverImagePath,
    required this.logoPath,
  });
}

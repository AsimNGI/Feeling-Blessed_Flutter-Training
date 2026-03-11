/// Organization model for org detail screen and reuse.
class Organization {
  final String name;
  final String location;
  final String website;
  final String phone;
  final String email;
  final String etnNumber;
  final String coverImagePath;
  final String logoPath;

  const Organization({
    required this.name,
    required this.location,
    required this.website,
    required this.phone,
    required this.email,
    required this.etnNumber,
    required this.coverImagePath,
    required this.logoPath,
  });
}

/// Minimal home response model – parsed from API "data" object.
class HomeResponse {
  const HomeResponse({this.banner, this.sections = const [], this.onBoardingSection = const []});

  final String? banner;
  final List<HomeSection> sections;
  final List<HomeOnboardingItem> onBoardingSection;

  factory HomeResponse.fromJson(Map<String, dynamic> json) {
    return HomeResponse(
      banner: json['banner'] as String?,
      sections:
          (json['sections'] as List<dynamic>?)
              ?.map((e) => HomeSection.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      onBoardingSection:
          (json['onBoardingSection'] as List<dynamic>?)
              ?.map((e) => HomeOnboardingItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }
}

class HomeSection {
  const HomeSection({
    this.title,
    this.description,
    this.type,
    this.sectionType,
    this.cellType,
    this.itemsOrg = const [],
    this.itemsDrive = const [],
  });

  final String? title;
  final String? description;
  final String? type;
  final String? sectionType;
  final String? cellType;
  final List<HomeOrgItem> itemsOrg;
  final List<HomeFundraiserItem> itemsDrive;

  factory HomeSection.fromJson(Map<String, dynamic> json) {
    final itemsOrg = json['items_org'] as List<dynamic>?;
    final itemsDrive = json['items_drive'] as List<dynamic>?;
    return HomeSection(
      title: json['title'] as String?,
      description: json['description'] as String?,
      type: json['type'] as String?,
      sectionType: json['section_type'] as String?,
      cellType: json['cell_type'] as String?,
      itemsOrg:
          itemsOrg?.map((e) => HomeOrgItem.fromJson(e as Map<String, dynamic>)).toList() ?? [],
      itemsDrive:
          itemsDrive?.map((e) => HomeFundraiserItem.fromJson(e as Map<String, dynamic>)).toList() ??
          [],
    );
  }
}

class HomeOrgItem {
  const HomeOrgItem({this.id, this.name, this.logoUrl, this.coverUrl, this.slug, this.cityCountry});

  final String? id;
  final String? name;
  final String? logoUrl;
  final String? coverUrl;
  final String? slug;
  final String? cityCountry;

  factory HomeOrgItem.fromJson(Map<String, dynamic> json) {
    final id = json['id'];
    return HomeOrgItem(
      id: id?.toString(),
      name: json['org_name'] as String?,
      logoUrl: json['logo_url'] as String?,
      coverUrl: json['cover_image_url'] as String?,
      slug: json['share_url'] as String?,
      cityCountry: json['city_country'] as String?,
    );
  }
}

class HomeFundraiserItem {
  const HomeFundraiserItem({
    this.id,
    this.name,
    this.slug,
    this.imageUrl,
    this.logoUrl,
    this.orgName,
    this.totalPercent,
    this.totalAmountRaisedLabel,
    this.targetAmountLabel,
  });

  final String? id;
  final String? name;
  final String? slug;
  final String? imageUrl;
  final String? logoUrl;
  final String? orgName;
  final int? totalPercent;
  final String? totalAmountRaisedLabel;
  final String? targetAmountLabel;

  factory HomeFundraiserItem.fromJson(Map<String, dynamic> json) {
    final id = json['id'];
    return HomeFundraiserItem(
      id: id?.toString(),
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      imageUrl: (json['cover_image_url'] ?? json['logo_url']) as String?,
      logoUrl: json['logo_url'] as String?,
      orgName: json['org_name'] as String?,
      totalPercent: json['total_percent'] as int?,
      totalAmountRaisedLabel: json['total_amount_raised_label'] as String?,
      targetAmountLabel: json['target_amount_label'] as String?,
    );
  }
}

class HomeOnboardingItem {
  const HomeOnboardingItem({this.identifier, this.visibility = false});

  final String? identifier;
  final bool visibility;

  factory HomeOnboardingItem.fromJson(Map<String, dynamic> json) {
    return HomeOnboardingItem(
      identifier: json['identifier'] as String?,
      visibility: json['visibility'] as bool? ?? false,
    );
  }
}

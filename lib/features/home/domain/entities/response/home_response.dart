/// Domain entities for home – no JSON or infrastructure dependencies.
class HomeResponse {
  const HomeResponse({
    this.banner,
    this.sections = const [],
    this.onBoardingSection = const [],
  });

  final String? banner;
  final List<HomeSection> sections;
  final List<HomeOnboardingItem> onBoardingSection;
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
}

class HomeOrgItem {
  const HomeOrgItem({
    this.id,
    this.name,
    this.logoUrl,
    this.coverUrl,
    this.slug,
    this.cityCountry,
  });

  final String? id;
  final String? name;
  final String? logoUrl;
  final String? coverUrl;
  final String? slug;
  final String? cityCountry;
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
}

class HomeOnboardingItem {
  const HomeOnboardingItem({this.identifier, this.visibility = false});

  final String? identifier;
  final bool visibility;
}

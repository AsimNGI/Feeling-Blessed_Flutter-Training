import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_training/bloc/home/home_bloc.dart';
import 'package:flutter_training/model/home_data.dart';
import 'package:flutter_training/model/home/new_home_models.dart';
import 'package:flutter_training/ui/home/generic_section.dart';
import 'package:flutter_training/ui/home/header_section.dart';
import 'package:flutter_training/ui/home/welcome_section.dart';
import 'package:flutter_training/utils/app_colors.dart';

/// Home screen: calls API via Bloc and shows loading / data / error.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(const HomeLoadRequested());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading || state is HomeInitial) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryAqua600,
              ),
            );
          }

          if (state is HomeError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      state.message,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 16),
                    FilledButton(
                      onPressed: () => context
                          .read<HomeBloc>()
                          .add(const HomeLoadRequested()),
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            );
          }

          if (state is HomeLoaded) {
            final homeResult = _toNewHomeResult(state.data);
            return CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(child: HeaderSection()),
                SliverToBoxAdapter(
                  child: WelcomeSection(
                    userName: null,
                    isGuestUser: true,
                    onBoardingSection: homeResult.onBoardingSection,
                    onNavigate: _onNavigate,
                  ),
                ),
                ...homeResult.sections.map(
                  (section) => SliverToBoxAdapter(
                    child: GenericSection(
                      section: section,
                      onOrgTap: _onOrgTap,
                      onFundraiserTap: _onFundraiserTap,
                      onSeeAllTap: () => _onSectionSeeAll(section),
                    ),
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 24)),
              ],
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }

  /// Convert API [HomeData] to [NewHomeResult] for existing section widgets.
  NewHomeResult _toNewHomeResult(HomeData data) {
    return NewHomeResult(
      banner: data.banner,
      sections: data.sections.map(_toNewHomeSection).toList(),
      onBoardingSection: data.onBoardingSection
          .map((o) => OnboardingSectionItem(
                identifier: o.identifier,
                visibility: o.visibility,
              ))
          .toList(),
    );
  }

  NewHomeSection _toNewHomeSection(HomeSection s) {
    return NewHomeSection(
      title: s.title,
      description: s.description,
      type: s.type,
      sectionType: s.sectionType,
      cellType: s.cellType,
      itemsOrg: s.itemsOrg
          .map((o) => OrgInfo(
                id: o.id,
                name: o.name,
                logoUrl: o.logoUrl,
                coverUrl: o.coverUrl,
                slug: o.slug,
                cityCountry: o.cityCountry,
              ))
          .toList(),
      itemsDrive: s.itemsDrive
          .map((f) => FundraiserInfo(
                id: f.id,
                name: f.name,
                slug: f.slug,
                imageUrl: f.imageUrl,
                logoUrl: f.logoUrl,
                orgName: f.orgName,
                totalPercent: f.totalPercent,
                totalAmountRaisedLabel: f.totalAmountRaisedLabel,
                targetAmountLabel: f.targetAmountLabel,
              ))
          .toList(),
    );
  }

  void _onNavigate(String identifier) {}

  void _onOrgTap(OrgInfo org) {}

  void _onFundraiserTap(FundraiserInfo fundraiser) {}

  void _onSectionSeeAll(NewHomeSection section) {}
}


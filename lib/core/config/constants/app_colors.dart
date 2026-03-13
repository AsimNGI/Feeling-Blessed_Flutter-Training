import 'package:flutter/material.dart';

class AppColors {
  // ---------------------------------------------------------------------------
  // Semantic (app-specific) – keep for backward compatibility
  // ---------------------------------------------------------------------------
  static const Color seedColor = Color(0xFF6750A4);
  static const Color primary = Color(0xFF6750A4);

  static const Color background = Color(0xFFF2F4F7);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color navBarBackground = Color(0xFFF2F4F7);
  static const Color navBarSelectedBubble = Color(0xFFD0D5DD);

  static const Color textPrimary = Color(0xFF000000);
  static const Color textSecondary = Color(0xFF475467);
  static const Color textMuted = Color(0xFF98A2B3);
  static const Color textOnDark = Color(0xFFFFFFFF);
  static const Color textOnDarkMuted = Color(0xB3FFFFFF);

  static const Color border = Color(0xFFEAECF0);
  static const Color divider = Color(0xFFEAECF0);
  static const Color iconMuted = Color(0xFF98A2B3);
  static const Color shadow = Color(0x0D000000);

  static const Color backgroundGradientStart = Color(0xFF006799);
  static const Color backgroundGradientEnd = Color(0xFF138677);

  // Donate button radial gradient
  static const Color donateGradientStart = Color(0xFF0089CC);
  static const Color donateGradientMid = Color(0xFF0099CC);
  static const Color donateGradientEnd = Color(0xFF0AA3C2);

  static const Color fundraiserProgressBackground = Color(0xFF20DFC6);
  static const Color fundraiserCardBackground = Color(0xFFF9FAFB);

  // Trust box (verification section)
  static const Color trustBoxBackground = Color(0xFFF8FAFC);
  static const Color trustBoxIcon = Color(0xFF4B5C6B);
  static const Color trustBoxTitle = Color(0xFF2D3642);
  static const Color trustBoxSubtitle = Color(0xFF6B7A8A);

  // ---------------------------------------------------------------------------
  // Base
  // ---------------------------------------------------------------------------
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);

  // ---------------------------------------------------------------------------
  // Gray
  // ---------------------------------------------------------------------------
  static const Color gray25 = Color(0xFFF0F0F0);
  static const Color gray50 = Color(0xFFF8F8F8);
  static const Color gray100 = Color(0xFFF2F2F2);
  static const Color gray200 = Color(0xFFEAEAE0);
  static const Color gray300 = Color(0xFFD9D9D9);
  static const Color gray400 = Color(0xFFB9B9B9);
  static const Color gray500 = Color(0xFF888888);
  static const Color gray600 = Color(0xFF474747);
  static const Color gray700 = Color(0xFF344054);
  static const Color gray800 = Color(0xFF102230);
  static const Color gray900 = Color(0xFF1C1826);

  // ---------------------------------------------------------------------------
  // Primary Aqua
  // ---------------------------------------------------------------------------
  static const Color primaryAqua50 = Color(0xFFE5F7FF);
  static const Color primaryAqua100 = Color(0xFFCCEEFF);
  static const Color primaryAqua200 = Color(0xFF8ECAFF);
  static const Color primaryAqua300 = Color(0xFF006CFF);
  static const Color primaryAqua400 = Color(0xFF338CFF);
  static const Color primaryAqua500 = Color(0xFF00B1FF);
  static const Color primaryAqua600 = Color(0xFF0099DD);
  static const Color primaryAqua700 = Color(0xFF006799);
  static const Color primaryAqua800 = Color(0xFF004566);
  static const Color primaryAqua900 = Color(0xFF002233);

  // ---------------------------------------------------------------------------
  // Secondary Green
  // ---------------------------------------------------------------------------
  static const Color secondaryGreen25 = Color(0xFFE9FDFB);
  static const Color secondaryGreen50 = Color(0xFFE1FCF9);
  static const Color secondaryGreen100 = Color(0xFFD2FDF4);
  static const Color secondaryGreen200 = Color(0xFFA8E2E8);
  static const Color secondaryGreen300 = Color(0xFF7BECDD);
  static const Color secondaryGreen400 = Color(0xFF4DCDD1);
  static const Color secondaryGreen500 = Color(0xFF2CBB9A);
  static const Color secondaryGreen600 = Color(0xFF08AD9B);
  static const Color secondaryGreen700 = Color(0xFF007777);
  static const Color secondaryGreen800 = Color(0xFF005555);
  static const Color secondaryGreen900 = Color(0xFF002D2B);

  // ---------------------------------------------------------------------------
  // Purple
  // ---------------------------------------------------------------------------
  static const Color purple50 = Color(0xFFEFEBFB);
  static const Color purple100 = Color(0xFFDED6F3);
  static const Color purple200 = Color(0xFFBEB1E7);
  static const Color purple300 = Color(0xFF9B8CDA);
  static const Color purple400 = Color(0xFF706DC5);
  static const Color purple500 = Color(0xFF5C3CC2);
  static const Color purple600 = Color(0xFF4A3F8D);
  static const Color purple700 = Color(0xFF372874);
  static const Color purple800 = Color(0xFF221E4E);
  static const Color purple900 = Color(0xFF120C27);

  // Legacy alias (was EFECF9 / DED8F3 / 5C3DC2)
  static const Color infoMain = Color(0xFF5C3CC2);

  // ---------------------------------------------------------------------------
  // Yellow
  // ---------------------------------------------------------------------------
  static const Color yellow50 = Color(0xFFFFFFE9);
  static const Color yellow100 = Color(0xFFFFF6D0);
  static const Color yellow150 = Color(0xFFFFF2B9);
  static const Color yellow200 = Color(0xFFFFEAE9);
  static const Color yellow300 = Color(0xFFFFED60);
  static const Color yellow400 = Color(0xFFFFD633);
  static const Color yellow500 = Color(0xFFFFC002);
  static const Color yellow600 = Color(0xFFCCA300);
  static const Color yellow700 = Color(0xFF997F00);
  static const Color yellow800 = Color(0xFF665500);
  static const Color yellow900 = Color(0xFF332900);

  // ---------------------------------------------------------------------------
  // Red
  // ---------------------------------------------------------------------------
  static const Color red25 = Color(0xFFFDEFF2);
  static const Color red50 = Color(0xFFFCEBEC);
  static const Color red100 = Color(0xFFFFCBE6);
  static const Color red200 = Color(0xFFF7A3A4);
  static const Color red300 = Color(0xFFFF758C);
  static const Color red400 = Color(0xFFFF476B);
  static const Color red500 = Color(0xFFEE3A42);
  static const Color red600 = Color(0xFFDB1435);
  static const Color red700 = Color(0xFFA91024);
  static const Color red800 = Color(0xFF7C0A1B);
  static const Color red900 = Color(0xFF5D050D);

  // ---------------------------------------------------------------------------
  // Green
  // ---------------------------------------------------------------------------
  static const Color green25 = Color(0xFFEEF8F2);
  static const Color green50 = Color(0xFFE6FBF2);
  static const Color green150 = Color(0xFFD2E0E9);
  static const Color green250 = Color(0xFFB4EBC9);
  static const Color green350 = Color(0xFF83DDCA);
  static const Color green450 = Color(0xFF50B080);
  static const Color green550 = Color(0xFF42A473);
  static const Color green650 = Color(0xFF338063);
  static const Color green750 = Color(0xFF245041);
  static const Color green850 = Color(0xFF1C3727);
  static const Color green950 = Color(0xFF071200);

  // ---------------------------------------------------------------------------
  // Blue
  // ---------------------------------------------------------------------------
  static const Color blue50 = Color(0xFFE6F0F9);
  static const Color blue150 = Color(0xFFC2E2FF);
  static const Color blue250 = Color(0xFF82C2FF);
  static const Color blue350 = Color(0xFF3187FF);
  static const Color blue450 = Color(0xFF144BFF);
  static const Color blue550 = Color(0xFF0022E5);
  static const Color blue650 = Color(0xFF00045D);
  static const Color blue750 = Color(0xFF00196D);
  static const Color blue850 = Color(0xFF001040);
  static const Color blue950 = Color(0xFF000B1A);
}

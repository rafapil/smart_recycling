import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_recycling/src/shared/themes/app_colors.dart';

class AppTextStyles {
  static final txtTitle = GoogleFonts.notoSans(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: AppColors.strongGreen,
  );

  static final txtSubTitle = GoogleFonts.notoSans(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );

  static final txtSubTitleBlack = GoogleFonts.notoSans(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
  );

  static final txtButtomBlack = GoogleFonts.notoSans(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.black,
  );

  static final txtButtomWhite = GoogleFonts.notoSans(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
  );

  static final txtTextForm = GoogleFonts.notoSans(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.strongGreen,
  );

  static final txtTextFormWhite = GoogleFonts.notoSans(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );

  static final txtTextFormHint = GoogleFonts.notoSans(
    fontSize: 12,
    color: AppColors.black,
  );

  static final txtBigTitle = GoogleFonts.notoSans(
    fontSize: 32,
    fontWeight: FontWeight.w100,
    color: AppColors.black,
  );
}

import 'package:flutter/material.dart';


abstract final class AppColors {
  static final background   = HSLColor.fromAHSL(1.0, 270, 0.30, 0.12).toColor();
  static final foreground   = HSLColor.fromAHSL(1.0,   0, 0.00, 0.98).toColor();
  static final card         = HSLColor.fromAHSL(1.0, 270, 0.20, 0.18).toColor();
  static final primary      = HSLColor.fromAHSL(1.0, 340, 0.70, 0.65).toColor();
  static final secondary    = HSLColor.fromAHSL(1.0, 260, 0.40, 0.50).toColor();
  static final accent       = HSLColor.fromAHSL(1.0, 200, 0.70, 0.60).toColor();
  static final muted        = HSLColor.fromAHSL(1.0, 270, 0.15, 0.25).toColor();
  static final mutedFg      = HSLColor.fromAHSL(1.0, 270, 0.10, 0.65).toColor();
  static final destructive  = HSLColor.fromAHSL(1.0,   0, 0.72, 0.55).toColor();
  static final border       = HSLColor.fromAHSL(1.0, 270, 0.15, 0.30).toColor();

  static final babyPeach    = HSLColor.fromAHSL(1.0,  20, 0.80, 0.80).toColor();
  static final babyMint     = HSLColor.fromAHSL(1.0, 160, 0.50, 0.70).toColor();
  static final babyLavender = HSLColor.fromAHSL(1.0, 270, 0.50, 0.75).toColor();

  static final statusOnline  = HSLColor.fromAHSL(1.0, 145, 0.65, 0.55).toColor();
  static final statusOffline = HSLColor.fromAHSL(1.0,   0, 0.00, 0.50).toColor();
}


abstract final class AppGlass {
  static final bg           = HSLColor.fromAHSL(0.35, 270, 0.20, 0.20).toColor();
  static final borderColor  = Colors.white.withOpacity(0.12);
  static final lightBg      = Colors.white.withOpacity(0.08);
  static final lightBorder  = Colors.white.withOpacity(0.10);
  static final buttonBg     = Colors.white.withOpacity(0.10);
  static final buttonHover  = Colors.white.withOpacity(0.18);

  static const blurSigma    = 10.0; // 20px blur → sigma ≈ 10
  static const shadow       = BoxShadow(
    color: Color(0x4D000000), // rgba(0,0,0,0.3)
    blurRadius: 32,
    offset: Offset(0, 8),
  );
}


abstract final class AppGradients {
  static final warm = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      HSLColor.fromAHSL(1.0, 270, 0.30, 0.15).toColor(),
      HSLColor.fromAHSL(1.0, 300, 0.25, 0.12).toColor(),
      HSLColor.fromAHSL(1.0, 340, 0.20, 0.10).toColor(),
    ],
  );

  static final accent = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      HSLColor.fromAHSL(1.0, 340, 0.70, 0.65).toColor(),
      HSLColor.fromAHSL(1.0, 280, 0.60, 0.55).toColor(),
    ],
  );

  static final cool = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      HSLColor.fromAHSL(1.0, 200, 0.70, 0.60).toColor(),
      HSLColor.fromAHSL(1.0, 260, 0.50, 0.55).toColor(),
    ],
  );
}


abstract final class AppGlows {
  static final primary = BoxShadow(
    color: HSLColor.fromAHSL(0.4, 340, 0.70, 0.65).toColor(),
    blurRadius: 20,
  );
  static final accent = BoxShadow(
    color: HSLColor.fromAHSL(0.4, 200, 0.70, 0.60).toColor(),
    blurRadius: 20,
  );
}


abstract final class AppFonts {
  static const display = 'Quicksand';
  static const body    = 'Nunito';
}


abstract final class AppSpacing {
  static const double xs  =  4;
  static const double sm  =  8;
  static const double md  = 16;
  static const double lg  = 24;
  static const double xl  = 32;
  static const double xxl = 48;
}


abstract final class AppRadius {
  static const double sm = 12;
  static const double md = 14;
  static const double lg = 16;
  static const double full = 999;
}


abstract final class AppDurations {
  static const fast   = Duration(milliseconds: 150);
  static const normal = Duration(milliseconds: 200);
  static const slow   = Duration(milliseconds: 500);
}

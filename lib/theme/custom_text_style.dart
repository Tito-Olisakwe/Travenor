import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyLargeBluegray400 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.blueGray400,
      );
  static get bodyLargeBluegray400_1 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.blueGray400,
      );
  static get bodyLargeGillSansMTBluegray400 =>
      theme.textTheme.bodyLarge!.gillSansMT.copyWith(
        color: appTheme.blueGray400,
      );
  static get bodyMedium13 => theme.textTheme.bodyMedium!.copyWith(
        fontSize: 13.fSize,
      );
  static get bodyMedium14 => theme.textTheme.bodyMedium!.copyWith(
        fontSize: 14.fSize,
      );
  static get bodyMediumOnPrimary => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.onPrimary,
      );
  static get bodyMediumPrimary => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 14.fSize,
      );
  static get bodyMediumSecondaryContainer =>
      theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.secondaryContainer,
        fontSize: 14.fSize,
      );
  static get bodyMediumWhiteA700 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.whiteA700,
        fontSize: 14.fSize,
      );
  static get bodySmallOnPrimary => theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.onPrimary,
        fontSize: 11.fSize,
      );
  static get bodySmallOnPrimary_1 => theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.onPrimary,
      );
  static get bodySmall_1 => theme.textTheme.bodySmall!;
  static get bodySmallff7c838d => theme.textTheme.bodySmall!.copyWith(
        color: Color(0XFF7C838D),
      );
  // Display text style
  static get displaySmallGeometr415BlkBTWhiteA700 =>
      theme.textTheme.displaySmall!.geometr415BlkBT.copyWith(
        color: appTheme.whiteA700,
        fontSize: 34.fSize,
        fontWeight: FontWeight.w400,
      );
  static get displaySmallOnPrimary => theme.textTheme.displaySmall!.copyWith(
        color: theme.colorScheme.onPrimary,
        fontWeight: FontWeight.w600,
      );
  static get displaySmallSemiBold => theme.textTheme.displaySmall!.copyWith(
        fontWeight: FontWeight.w600,
      );
  static get displaySmallff2d323d => theme.textTheme.displaySmall!.copyWith(
        color: Color(0XFF2D323D),
        fontWeight: FontWeight.w300,
      );
  static get displaySmallffff7029 => theme.textTheme.displaySmall!.copyWith(
        color: Color(0XFFFF7029),
        fontWeight: FontWeight.w600,
      );
  // Headline text style
  static get headlineLargeff1b1e28 => theme.textTheme.headlineLarge!.copyWith(
        color: Color(0XFF1B1E28),
      );
  static get headlineLargeffff7029 => theme.textTheme.headlineLarge!.copyWith(
        color: Color(0XFFFF7029),
      );
  static get headlineSmall_1 => theme.textTheme.headlineSmall!;
  // Label text style
  static get labelLargePrimary => theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.primary,
      );
  // Title text style
  static get titleMedium18 => theme.textTheme.titleMedium!.copyWith(
        fontSize: 18.fSize,
      );
  static get titleMediumPrimary => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumSemiBold => theme.textTheme.titleMedium!.copyWith(
        fontSize: 18.fSize,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumWhiteA700 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumWhiteA700SemiBold =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.whiteA700,
        fontSize: 18.fSize,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallMedium => theme.textTheme.titleSmall!.copyWith(
        fontWeight: FontWeight.w500,
      );
  static get titleSmallPrimary => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w500,
      );
}

extension on TextStyle {
  TextStyle get gillSansMT {
    return copyWith(
      fontFamily: 'Gill Sans MT',
    );
  }

  TextStyle get sFUIDisplay {
    return copyWith(
      fontFamily: 'SF UI Display',
    );
  }

  TextStyle get geometr415BlkBT {
    return copyWith(
      fontFamily: 'Geometr415 Blk BT',
    );
  }
}

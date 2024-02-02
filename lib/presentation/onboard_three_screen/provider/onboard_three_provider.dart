import 'package:flutter/material.dart';
import 'package:travenor/core/app_export.dart';
import 'package:travenor/presentation/onboard_three_screen/models/onboard_three_model.dart';

/// A provider class for the OnboardThreeScreen.
///
/// This provider manages the state of the OnboardThreeScreen, including the
/// current onboardThreeModelObj

// ignore_for_file: must_be_immutable
class OnboardThreeProvider extends ChangeNotifier {
  OnboardThreeModel onboardThreeModelObj = OnboardThreeModel();

  @override
  void dispose() {
    super.dispose();
  }
}

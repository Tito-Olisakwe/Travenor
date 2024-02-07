import 'package:flutter/material.dart';
// import 'package:travenor/core/app_export.dart';
import 'package:travenor/presentation/details_screen/models/details_model.dart';
// import '../models/listdetails_item_model.dart';

/// A provider class for the DetailsScreen.
///
/// This provider manages the state of the DetailsScreen, including the
/// current detailsModelObj

// ignore_for_file: must_be_immutable
class DetailsProvider extends ChangeNotifier {
  DetailsModel detailsModelObj = DetailsModel();

  @override
  void dispose() {
    super.dispose();
  }
}

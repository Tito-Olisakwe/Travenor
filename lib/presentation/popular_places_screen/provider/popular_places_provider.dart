import 'package:flutter/material.dart';
// import 'package:travenor/core/app_export.dart';
import 'package:travenor/presentation/popular_places_screen/models/popular_places_model.dart';
// import '../models/popularplaces_item_model.dart';

/// A provider class for the PopularPlacesScreen.
///
/// This provider manages the state of the PopularPlacesScreen, including the
/// current popularPlacesModelObj

// ignore_for_file: must_be_immutable
class PopularPlacesProvider extends ChangeNotifier {
  PopularPlacesModel popularPlacesModelObj = PopularPlacesModel();

  @override
  void dispose() {
    super.dispose();
  }
}

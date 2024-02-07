import 'package:flutter/material.dart';
// import 'package:travenor/core/app_export.dart';
import 'package:travenor/presentation/favorite_places_screen/models/favorite_places_model.dart';
// import '../models/viewhierarchy_item_model.dart';

/// A provider class for the FavoritePlacesScreen.
///
/// This provider manages the state of the FavoritePlacesScreen, including the
/// current favoritePlacesModelObj

// ignore_for_file: must_be_immutable
class FavoritePlacesProvider extends ChangeNotifier {
  FavoritePlacesModel favoritePlacesModelObj = FavoritePlacesModel();

  @override
  void dispose() {
    super.dispose();
  }
}

import 'package:flutter/material.dart';
import 'package:travenor/core/app_export.dart';
import 'package:travenor/presentation/home_page/models/home_model.dart';
import '../models/destinationlist_item_model.dart';

/// A provider class for the HomePage.
///
/// This provider manages the state of the HomePage, including the
/// current homeModelObj

// ignore_for_file: must_be_immutable
class HomeProvider extends ChangeNotifier {
  HomeModel homeModelObj = HomeModel();

  @override
  void dispose() {
    super.dispose();
  }
}

import '../../../core/app_export.dart';

/// This class is used in the [listdetails_item_widget] screen.
class ListdetailsItemModel {
  ListdetailsItemModel({
    this.rectangle,
    this.id,
  }) {
    rectangle = rectangle ?? ImageConstant.imgRectangle822;
    id = id ?? "";
  }

  String? rectangle;

  String? id;
}

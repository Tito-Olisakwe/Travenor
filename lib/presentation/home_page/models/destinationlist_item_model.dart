import '../../../core/app_export.dart';

/// This class is used in the [destinationlist_item_widget] screen.
class DestinationlistItemModel {
  DestinationlistItemModel({
    this.reservoirImage,
    this.reservoirName,
    this.ratingText,
    this.locationText,
    this.id,
  }) {
    reservoirImage = reservoirImage ?? ImageConstant.imgRectangle27;
    reservoirName = reservoirName ?? "Niladri Reservoir";
    ratingText = ratingText ?? "4.7";
    locationText = locationText ?? "Tekergat, Sunamgnj";
    id = id ?? "";
  }

  String? reservoirImage;

  String? reservoirName;

  String? ratingText;

  String? locationText;

  String? id;
}

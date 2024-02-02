import '../../../core/app_export.dart';

/// This class is used in the [popularplaces_item_widget] screen.
class PopularplacesItemModel {
  PopularplacesItemModel({
    this.reservoirImage,
    this.niladriReservoir,
    this.tekergatText,
    this.fortySeven,
    this.id,
  }) {
    reservoirImage = reservoirImage ?? ImageConstant.imgRectangle838;
    niladriReservoir = niladriReservoir ?? "Niladri Reservoir";
    tekergatText = tekergatText ?? "Tekergat, Sunamgnj";
    fortySeven = fortySeven ?? "4.7";
    id = id ?? "";
  }

  String? reservoirImage;

  String? niladriReservoir;

  String? tekergatText;

  String? fortySeven;

  String? id;
}

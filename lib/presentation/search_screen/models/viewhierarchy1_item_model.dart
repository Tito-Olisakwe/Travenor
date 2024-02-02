import '../../../core/app_export.dart';

/// This class is used in the [viewhierarchy1_item_widget] screen.
class Viewhierarchy1ItemModel {
  Viewhierarchy1ItemModel({
    this.reservoirImage,
    this.reservoirText,
    this.sunamgnjText,
    this.id,
  }) {
    reservoirImage = reservoirImage ?? ImageConstant.imgRectangle839;
    reservoirText = reservoirText ?? "Niladri Reservoir";
    sunamgnjText = sunamgnjText ?? "Tekergat, Sunamgnj";
    id = id ?? "";
  }

  String? reservoirImage;

  String? reservoirText;

  String? sunamgnjText;

  String? id;
}

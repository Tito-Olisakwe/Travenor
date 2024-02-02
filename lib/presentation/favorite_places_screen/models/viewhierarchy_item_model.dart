import '../../../core/app_export.dart';

/// This class is used in the [viewhierarchy_item_widget] screen.
class ViewhierarchyItemModel {
  ViewhierarchyItemModel({
    this.reservoirImage,
    this.reservoirText,
    this.sunamgnjText,
    this.id,
  }) {
    reservoirImage = reservoirImage ?? ImageConstant.imgRectangle838;
    reservoirText = reservoirText ?? "Niladri Reservoir";
    sunamgnjText = sunamgnjText ?? "Tekergat, Sunamgnj";
    id = id ?? "";
  }

  String? reservoirImage;

  String? reservoirText;

  String? sunamgnjText;

  String? id;
}

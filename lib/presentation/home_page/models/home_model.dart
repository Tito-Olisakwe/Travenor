import '../../../core/app_export.dart';
import 'destinationlist_item_model.dart';

class HomeModel {
  List<DestinationlistItemModel> destinationlistItemList = [
    DestinationlistItemModel(
        reservoirImage: ImageConstant.imgRectangle27,
        reservoirName: "Niladri Reservoir",
        ratingText: "4.7",
        locationText: "Tekergat, Sunamgnj"),
    DestinationlistItemModel(reservoirImage: ImageConstant.imgRectangle34)
  ];
}

import 'package:shamiri/features/feature_merchant_store/domain/model/variation_model.dart';

class MerchantConstants {
  static const variationGroups = ["Size", "Color", "Quantity"];

  static List<VariationModel> variations = [
    //  sizes
    VariationModel(
        variationName: "Large",
        variationPrice: 150,
        variationGroup: variationGroups[0]),
    VariationModel(
        variationName: "Medium",
        variationPrice: 100,
        variationGroup: variationGroups[0]),
    VariationModel(
        variationName: "Small",
        variationPrice: 50,
        variationGroup: variationGroups[0]),

    //  color
    VariationModel(
        variationName: "Red",
        variationPrice: 150,
        variationGroup: variationGroups[1]),
    VariationModel(
        variationName: "Green",
        variationPrice: 100,
        variationGroup: variationGroups[1]),
    VariationModel(
        variationName: "Blue",
        variationPrice: 50,
        variationGroup: variationGroups[1]),
    VariationModel(
        variationName: "Yellow",
        variationPrice: 150,
        variationGroup: variationGroups[1]),
    VariationModel(
        variationName: "Orange",
        variationPrice: 100,
        variationGroup: variationGroups[1]),
    VariationModel(
        variationName: "Pink",
        variationPrice: 50,
        variationGroup: variationGroups[1]),

    //  quantity
    VariationModel(
        variationName: "1 Kg",
        variationPrice: 150,
        variationGroup: variationGroups[2]),
    VariationModel(
        variationName: "1/2 Kg",
        variationPrice: 100,
        variationGroup: variationGroups[2]),
    VariationModel(
        variationName: "1/4 Kg",
        variationPrice: 50,
        variationGroup: variationGroups[2]),
  ];
}

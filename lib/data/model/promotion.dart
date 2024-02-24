import 'package:aviz/constants/string_constants.dart';

class Promotion {
  String? collectionId;
  String? id;
  String? title;
  String? description;
  int? price;
  String? thumbnail;

  Promotion(this.collectionId, this.id, this.title, this.description,
      this.price, this.thumbnail);

  factory Promotion.withJson(Map<String, dynamic> jsonMapObject) {
    return Promotion(
      jsonMapObject["collectionId"],
      jsonMapObject["id"],
      jsonMapObject["name"],
      jsonMapObject["description"],
      jsonMapObject["price"],
      "${StringConstants.baseUrl}${jsonMapObject["collectionId"]}/${jsonMapObject["id"]}/${jsonMapObject["thumbnail"]}",
    );
  }
}

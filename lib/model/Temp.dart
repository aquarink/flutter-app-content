import 'dart:convert';

List<Users> modelProductByCategoryFromJson(String str) =>
    new List<Users>.from(json.decode(str).map((x) => Users.fromJson(x)));

String modelProductByCategoryToJson(List<Users> data) =>
    json.encode(new List<dynamic>.from(data.map((x) => x.toJson())));

class Users {
  int id;
  int categoryId;
  String productCode;
  String title;
  String price;
  String description;
  int qty;
  String rating;
  String showInSlider;
  DateTime createdAt;
  DateTime updatedAt;
  String productCover;
  List<ProductPhoto> productPhotos;

  Users({
    this.id,
    this.categoryId,
    this.productCode,
    this.title,
    this.price,
    this.description,
    this.qty,
    this.rating,
    this.showInSlider,
    this.createdAt,
    this.updatedAt,
    this.productCover,
    this.productPhotos,
  });

  factory Users.fromJson(Map<String, dynamic> json) => new Users(
        id: json["id"],
        categoryId: json["category_id"],
        productCode: json["product_code"],
        title: json["title"],
        price: json["price"],
        description: json["description"],
        qty: json["qty"],
        rating: json["rating"],
        showInSlider: json["show_in_slider"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        productCover: json["product_cover"],
        productPhotos: new List<ProductPhoto>.from(
            json["product_photos"].map((x) => ProductPhoto.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "product_code": productCode,
        "title": title,
        "price": price,
        "description": description,
        "qty": qty,
        "rating": rating,
        "show_in_slider": showInSlider,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "product_cover": productCover,
        "product_photos":
            new List<dynamic>.from(productPhotos.map((x) => x.toJson())),
      };
}

class ProductPhoto {
  int id;
  int productId;
  String fileName;
  String isCover;
  dynamic createdAt;
  dynamic updatedAt;

  ProductPhoto({
    this.id,
    this.productId,
    this.fileName,
    this.isCover,
    this.createdAt,
    this.updatedAt,
  });

  factory ProductPhoto.fromJson(Map<String, dynamic> json) => new ProductPhoto(
        id: json["id"],
        productId: json["product_id"],
        fileName: json["file_name"],
        isCover: json["is_cover"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "file_name": fileName,
        "is_cover": isCover,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

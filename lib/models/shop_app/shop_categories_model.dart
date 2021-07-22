class ShopCategoriesModel{

  List<Categories> categories = [];

  ShopCategoriesModel.fromJson(Map<String,dynamic> json){
    json['docs'].forEach((element){
      categories.add(Categories.fromJson(element));
    });
  }
}

class Categories {
  dynamic id;
  dynamic name;
  dynamic description;
  List<ImageModel> image = [];
  // dynamic image;
  bool isActive;
  dynamic slug;
  dynamic productsCount;

  Categories.fromJson(Map<String,dynamic> json){
    id = json['_id'];
    name = json['name'];
    description = json['description'];
    // image = json['image'];
    json['image']?.forEach((element){
      image.add(ImageModel.fromJson(element));
    });
    slug = json['slug'];
    isActive = json['isActive'];
    productsCount = json['productsCount'];
  }
}

class ImageModel {
  int id;
  String url;
  String name;
  ImageModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    url = json['src'];
    name = json['name'];
  }
}
class ShopHomeModel{
  dynamic count;
  dynamic pages;
  dynamic page;
  List<Docs> docs =[];

  ShopHomeModel.fromJson(Map<String,dynamic> json){
    count = json['count'];
    pages = json['pages'];
    page = json['page'];

    json['docs'].forEach((element){
      docs.add(Docs.fromJson(element));
    });
  }
}

class Docs {
  dynamic id;
  dynamic name;
  dynamic type;
  dynamic description;
  dynamic shortDescription;
  dynamic price;
  dynamic salePrice;
  dynamic regularPrice;
  dynamic shippingInfo;
  List<Images> images = [];

  Docs.fromJson(Map<String,dynamic> json){
    id = json['_id'];
    name = json['name'];
    type = json['type'];
    description = json['description'];
    price = json['price'];
    shortDescription = json['shortDescription'];
    salePrice = json['salePrice'];
    regularPrice = json['regularPrice'];
    shippingInfo = json['shippingInfo'];

    json['images'].forEach((element){
      images.add(Images.fromJson(element));
    });
  }
}

class Images {
  dynamic id;
  dynamic url;
  Images.fromJson(Map<String,dynamic> json){
    id = json['_id'];
    url = json['url'];
  }
}

// class ShopHomeModel
// {
//   bool status;
//   HomeDataModel data;
//
//   ShopHomeModel.fromJson(Map<String, dynamic> json)
//   {
//     status = json['status'];
//     data = HomeDataModel.fromJson(json['data']);
//   }
// }
//
// class HomeDataModel
// {
//   List<BannerModel> banners = [];
//   List<ProductModel> products = [];
//
//   HomeDataModel.fromJson(Map<String, dynamic> json)
//   {
//     json['banners'].forEach((element)
//     {
//       banners.add(BannerModel.fromJson(element));
//     });
//
//     json['products'].forEach((element)
//     {
//       products.add(ProductModel.fromJson(element));
//     });
//   }
// }
//
// class BannerModel
// {
//   int id;
//   String image;
//
//   BannerModel.fromJson(Map<String, dynamic> json)
//   {
//     id = json['id'];
//     image = json['image'];
//   }
// }
//
// class ProductModel
// {
//   int id;
//   dynamic price;
//   dynamic oldPrice;
//   dynamic discount;
//   String image;
//   String name;
//   bool inFavorites;
//   bool inCart;
//
//   ProductModel.fromJson(Map<String, dynamic> json)
//   {
//     id = json['id'];
//     price = json['price'];
//     oldPrice = json['old_price'];
//     discount = json['discount'];
//     image = json['image'];
//     name = json['name'];
//     inFavorites = json['in_favorites'];
//     inCart = json['in_cart'];
//   }
// }
// // class ShopHomeModel {
// //   bool status;
// //   HomeDataModel data;
// //
// //   ShopHomeModel.fromJson(Map<String, dynamic> json) {
// //     status = json['status'];
// //     data = HomeDataModel.fromJson(json['data']);
// //   }
// // }
// //
// // class HomeDataModel {
// //   List<Banners> banners = [];
// //   List<Products> products = [];
// //
// //   HomeDataModel.fromJson(Map<String, dynamic> json) {
// //     json['banners'].forEach((element) {
// //       banners.add(element);
// //     });
// //
// //     json['products'].forEach((element) {
// //       products.add(element);
// //     });
// //   }
// // }
// //
// // class Banners {
// //   int id;
// //   String image;
// //
// //   Banners.fromJson(Map<String, dynamic> json) {
// //     id = json['id'];
// //     image = json['image'];
// //   }
// // }
// //
// // class Products {
// //   int id;
// //   dynamic price;
// //   dynamic oldPrice;
// //   String image;
// //   dynamic discount;
// //   String name;
// //   bool inFavorites;
// //   bool inCart;
// //
// //   Products.fromJson(Map<String, dynamic> json) {
// //     id = json['id'];
// //     price = json['price'];
// //     oldPrice = json['old_price'];
// //     image = json['image'];
// //     discount = json['discount'];
// //     name = json['name'];
// //     inFavorites = json['in_favorites'];
// //     inCart = json['in_cart'];
// //   }
// // }

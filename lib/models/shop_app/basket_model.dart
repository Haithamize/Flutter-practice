class MyBasketModel{
  Coupon coupon;
  int minOrderCost;
  List<Products> products ;
  ShippingAddress shippingAddress;

  MyBasketModel(
      this.coupon, this.minOrderCost, this.products, this.shippingAddress);


  MyBasketModel.fromJson(Map<String, dynamic> json) {
    coupon = json['coupon'] != null ? new Coupon.fromJson(json['coupon']) : null;
    minOrderCost = json['minOrderCost'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) { products.add(new Products.fromJson(v)); });
    }
    shippingAddress = json['shipping_address'] != null ? new ShippingAddress.fromJson(json['shipping_address']) : null;
  }
}


class Coupon{
  Coupon.fromJson(json);
}

class Products{
  int iId;
  String slug;
  int wooCommerceId;
  String name;
  String price;
  String salePrice;
  String regularPrice;
  String key;
  String sku;
  int quantity;
  int stockQuantity;
  bool stockStatus;
  String type;
  bool isSubProduct;
  String description;
  String shortDescription;
  List<Null> categories = []; //de btrg3 list of null
  List<Images> images = [];
  Rating rating;

  Products(
      this.iId,
      this.slug,
      this.wooCommerceId,
      this.name,
      this.price,
      this.salePrice,
      this.regularPrice,
      this.key,
      this.sku,
      this.quantity,
      this.stockQuantity,
      this.stockStatus,
      this.type,
      this.isSubProduct,
      this.description,
      this.shortDescription,
      this.categories,
      this.images,
      this.rating);

  Products.fromJson(Map<String, dynamic> json) {
    iId = json['_id'];
    slug = json['slug'];
    wooCommerceId = json['wooCommerceId'];
    name = json['name'];
    price = json['price'];
    salePrice = json['salePrice'];
    regularPrice = json['regularPrice'];
    key = json['key'];
    sku = json['sku'];
    quantity = json['quantity'];
    stockQuantity = json['stockQuantity'];
    stockStatus = json['stockStatus'];
    type = json['type'];
    isSubProduct = json['isSubProduct'];
    description = json['description'];
    shortDescription = json['shortDescription'];
    // if (json['categories'] != null) {
    //   json['categories'].forEach((v) { categories.add(Categorie.fromJson(v)); });
    // }
    if (json['images'] != null) {
      json['images'].forEach((v) { images.add(new Images.fromJson(v)); });
    }
    rating = json['rating'] != null ? new Rating.fromJson(json['rating']) : null;
  }


}


class Images {
  int iId;
  String url;

  Images({this.iId, this.url});

  Images.fromJson(Map<String, dynamic> json) {
    iId = json['_id'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.iId;
    data['url'] = this.url;
    return data;
  }
}

class Rating {
  int averageRating;
  int ratingCount;

  Rating({this.averageRating, this.ratingCount});

  Rating.fromJson(Map<String, dynamic> json) {
    averageRating = json['averageRating'];
    ratingCount = json['ratingCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['averageRating'] = this.averageRating;
    data['ratingCount'] = this.ratingCount;
    return data;
  }
}

class ShippingAddress {
  String firstName;
  String lastName;
  String company;
  String address1;
  String address2;
  String city;
  String state;
  String postcode;
  String country;

  ShippingAddress({this.firstName, this.lastName, this.company, this.address1, this.address2, this.city, this.state, this.postcode, this.country});

  ShippingAddress.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    company = json['company'];
    address1 = json['address_1'];
    address2 = json['address_2'];
    city = json['city'];
    state = json['state'];
    postcode = json['postcode'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['company'] = this.company;
    data['address_1'] = this.address1;
    data['address_2'] = this.address2;
    data['city'] = this.city;
    data['state'] = this.state;
    data['postcode'] = this.postcode;
    data['country'] = this.country;
    return data;
  }
}
class ProductModel {
  int? prodId;
  String? prodName;
  String? prodSlug;
  int? prodPrice;
  String? prodImg;
  String? prodWarranty;
  String? prodAccessories;
  String? prodCondition;
  String? prodPromotion;
  int? prodStatus;
  String? proDescription;
  int? prodFeatured;
  int? prodCate;
  String? createdAt;
  String? updatedAt;

  ProductModel(
      {this.prodId,
        this.prodName,
        this.prodSlug,
        this.prodPrice,
        this.prodImg,
        this.prodWarranty,
        this.prodAccessories,
        this.prodCondition,
        this.prodPromotion,
        this.prodStatus,
        this.proDescription,
        this.prodFeatured,
        this.prodCate,
        this.createdAt,
        this.updatedAt});

  ProductModel.fromJson(Map<String, dynamic> json) {
    prodId = json['prod_id'];
    prodName = json['prod_name'];
    prodSlug = json['prod_slug'];
    prodPrice = json['prod_price'];
    prodImg = json['prod_img'];
    prodWarranty = json['prod_warranty'];
    prodAccessories = json['prod_accessories'];
    prodCondition = json['prod_condition'];
    prodPromotion = json['prod_promotion'];
    prodStatus = json['prod_status'];
    proDescription = json['pro_description'];
    prodFeatured = json['prod_featured'];
    prodCate = json['prod_cate'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['prod_id'] = this.prodId;
    data['prod_name'] = this.prodName;
    data['prod_slug'] = this.prodSlug;
    data['prod_price'] = this.prodPrice;
    data['prod_img'] = this.prodImg;
    data['prod_warranty'] = this.prodWarranty;
    data['prod_accessories'] = this.prodAccessories;
    data['prod_condition'] = this.prodCondition;
    data['prod_promotion'] = this.prodPromotion;
    data['prod_status'] = this.prodStatus;
    data['pro_description'] = this.proDescription;
    data['prod_featured'] = this.prodFeatured;
    data['prod_cate'] = this.prodCate;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
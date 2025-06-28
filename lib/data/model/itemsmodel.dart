class ItemsModel {
  String? itemsId;
  String? itemsName;
  String? itemsNameFr;
  String? itemsDesc;
  String? itemsDescFr;
  String? itemsImage;
  String? itemsCount;
  String? itemsActive;
  String? itemsPrice;
  String? itemsDiscount;
  String? itemsDate;
  String? itemsCat;
  String? categoriesId;
  String? categoriesName;
  String? categoriesNameFr;
  String? categoriesImage;
  String? categoriesDatetime;
  String? favorite;
  String? itemsPriceDiscount;


  ItemsModel(
      {this.itemsId,
        this.itemsName,
        this.itemsNameFr,
        this.itemsDesc,
        this.itemsDescFr,
        this.itemsImage,
        this.itemsCount,
        this.itemsActive,
        this.itemsPrice,
        this.itemsDiscount,
        this.itemsDate,
        this.itemsCat,
        this.itemsPriceDiscount,
        this.categoriesId,
        this.categoriesName,
        this.categoriesNameFr,
        this.categoriesImage,
        this.categoriesDatetime,
        this.favorite});

  ItemsModel.fromJson(Map<String, dynamic> json) {
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsNameFr = json['items_name_fr'];
    itemsDesc = json['items_desc'];
    itemsDescFr = json['items_desc_fr'];
    itemsImage = json['items_image'];
    itemsCount = json['items_count'];
    itemsActive = json['items_active'];
    itemsPrice = json['items_price'];
    itemsDiscount = json['items_discount'];
    itemsDate = json['items_date'];
    itemsCat = json['items_cat'];
    itemsPriceDiscount = json['itemspricedisount'];
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
    categoriesNameFr = json['categories_name_fr'];
    categoriesImage = json['categories_image'];
    categoriesDatetime = json['categories_datetime'];
    favorite = json['favorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['items_id'] = this.itemsId;
    data['items_name'] = this.itemsName;
    data['items_name_fr'] = this.itemsNameFr;
    data['items_desc'] = this.itemsDesc;
    data['items_desc_fr'] = this.itemsDescFr;
    data['items_image'] = this.itemsImage;
    data['items_count'] = this.itemsCount;
    data['items_active'] = this.itemsActive;
    data['items_price'] = this.itemsPrice;
    data['items_discount'] = this.itemsDiscount;
    data['items_date'] = this.itemsDate;
    data['items_cat'] = this.itemsCat;
    data['categories_id'] = this.categoriesId;
    data['categories_name'] = this.categoriesName;
    data['categories_name_fr'] = this.categoriesNameFr;
    data['categories_image'] = this.categoriesImage;
    data['categories_datetime'] = this.categoriesDatetime;

    return data;
  }
}
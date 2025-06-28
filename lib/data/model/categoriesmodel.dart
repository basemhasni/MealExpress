
class Categoriesmodel {
  String? categoriesId;
  String? categoriesName;
  String? categoriesNameFr;
  String? categoriesImage;
  String? categoriesDatetime;

  Categoriesmodel(
      {this.categoriesId,
        this.categoriesName,
        this.categoriesNameFr,
        this.categoriesImage,
        this.categoriesDatetime});

  Categoriesmodel.fromJson(Map<String, dynamic> json) {
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
    categoriesNameFr = json['categories_name_fr'];
    categoriesImage = json['categories_image'];
    categoriesDatetime = json['categories_datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categories_id'] = this.categoriesId;
    data['categories_name'] = this.categoriesName;
    data['categories_name_fr'] = this.categoriesNameFr;
    data['categories_image'] = this.categoriesImage;
    data['categories_datetime'] = this.categoriesDatetime;
    return data;
  }
}
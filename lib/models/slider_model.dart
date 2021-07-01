class SliderModel {
  final int id;
  final int brandId;
  final int modId;
  final int companyId;
  final String titleEn;
  final String titleKu;
  final String titleAr;
  final String year;
  final int view;
  final String image;
  final String descriptionKu;
  final String descriptionAr;
  final String descriptionEn;
  final int price;
  final int used;
  final int sold;
  final int createdBy;
//  final String updatedBy;
  final String createdAt;
  final String updatedAt;

  SliderModel({
    required this.id,
    required this.brandId,
    required this.modId,
    required this.companyId,
    required this.titleEn,
    required this.titleKu,
    required this.titleAr,
    required this.year,
    required this.view,
    required this.image,
    required this.descriptionKu,
    required this.descriptionAr,
    required this.descriptionEn,
    required this.price,
    required this.used,
    required this.sold,
    required this.createdBy,
    //  required this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SliderModel.fromJson(Map<String, dynamic> json) {
    return SliderModel(
      id: json['id'],
      brandId: json['brand_id'],
      modId: json['mod_id'],
      companyId: json['company_id'],
      titleEn: json['title_en'],
      titleKu: json['title_ku'],
      titleAr: json['title_ar'],
      year: json["year"],
      view: json['view'],
      image: json["image"],
      descriptionKu: json['description_ku'],
      descriptionAr: json["description_ar"],
      descriptionEn: json['description_en'],
      price: json["price"],
      used: json['used'],
      sold: json["sold"],
      createdBy: json["created_by"],
      //  updatedBy: json['updated_by'],
      createdAt: json["created_at"],
      updatedAt: json['updated_at'],
    );
  }
}

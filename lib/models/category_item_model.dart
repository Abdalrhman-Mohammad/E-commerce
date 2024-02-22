// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CategoryModel {
  final String id;
  final String title;
  final int numberOfProducts;
  final String imgUrl;

  CategoryModel({
    required this.id,
    required this.title,
    required this.imgUrl,
    required this.numberOfProducts,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'numberOfProducts': numberOfProducts,
      'imgUrl': imgUrl,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'] as String,
      title: map['title'] as String,
      numberOfProducts: map['numberOfProducts'] as int,
      imgUrl: map['imgUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

List<CategoryModel> dummyCategories = [
  CategoryModel(
    id: 'HfracMRZu1Iv8eozN7aY',
    title: "New Arrivals",
    numberOfProducts: 12,
    imgUrl:
        'https://www.stitchfix.com/men/blog/wp-content/uploads/2023/09/hero_5x4-4-616x411.png',
  ),
  CategoryModel(
    id: '248M08QOZqMco59doUwk',
    title: "Clothes",
    numberOfProducts: 123,
    imgUrl:
        'https://www.telegraph.co.uk/content/dam/men/2022/01/12/Main-image_trans_NvBQzQNjv4Bq2oUEflmHZZHjcYuvN_Gr-bVmXC2g6irFbtWDjolSHWg.jpg?imwidth=680',
  ),
  CategoryModel(
    id: 'dwXp9iGgGDTh9aVrvdGf',
    title: "Bags",
    numberOfProducts: 23,
    imgUrl:
        'https://assets.adidas.com/images/w_450,f_auto,q_auto/031efe514c5643a5a57cfb8ff520bd8a_9366/IF4848_HM1.jpg',
  ),
  CategoryModel(
    id: 'gwzt50GmdBcdEi4cofpg',
    title: "Shoes",
    numberOfProducts: 45,
    imgUrl:
        'https://hips.hearstapps.com/hmg-prod/images/messnger-bags-men-1572275343.jpg',
  ),
  CategoryModel(
    id: 'FQRHEYlxJrrK9vYCmaw3',
    title: "Electronics",
    numberOfProducts: 125,
    imgUrl:
        'https://www.thenoiseuk.com/wp-content/uploads/2021/10/Consumer-Electronics-Appliance_blog.jpeg',
  ),
];

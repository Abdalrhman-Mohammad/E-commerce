import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class AddressModel {
  final String id;
  final String title;
  final String description;
  final String imgUrl;
  final bool isFav;
  AddressModel({
    required this.id,
    required this.title,
    required this.description,
    required this.imgUrl,
    required this.isFav,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'imgUrl': imgUrl,
      'isFav': isFav, 
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      id: map['id'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      imgUrl: map['imgUrl'] as String,
      isFav: map['isFav'] as bool,
    );
  }

  AddressModel copyWith({
    String? id,
    String? title,
    String? description,
    String? imgUrl,
    bool? isFav,
  }) {
    return AddressModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      imgUrl: imgUrl ?? this.imgUrl,
      isFav: isFav ?? this.isFav,
    );
  }
}

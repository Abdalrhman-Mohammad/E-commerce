import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class PaymentMethod {
  final String id;
  final String name;
  final String code;
  final String imgUrl;
  final bool isFav;
  PaymentMethod({
    required this.id,
    required this.name,
    required this.code,
    required this.imgUrl,
    required this.isFav,
  });

  PaymentMethod copyWith({
    String? id,
    String? name,
    String? serialNumber,
    String? imgUrl,
    bool? isFav,
  }) {
    return PaymentMethod(
      id: id ?? this.id,
      name: name ?? this.name,
      code: serialNumber ?? this.code,
      imgUrl: imgUrl ?? this.imgUrl,
      isFav: isFav ?? this.isFav,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'code': code,
      'imgUrl': imgUrl,
      'isFav': isFav,
    };
  }

  factory PaymentMethod.fromMap(Map<String, dynamic> map) {
    return PaymentMethod(
      id: map['id'] as String,
      name: map['name'] as String,
      code: map['code'] as String,
      imgUrl: map['imgUrl'] as String,
      isFav: map['isFav'] as bool,
    );
  }

}

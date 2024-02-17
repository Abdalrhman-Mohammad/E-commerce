import 'package:flutter/material.dart';

class LinkedAccount {
  final String provider;
  final String imgLink;

  LinkedAccount({required this.provider, required this.imgLink});
}

class UserModel {
  final String name;
  final String email;
  final String imgUrl;
  final List<LinkedAccount> linkedAccounts;
  UserModel({
    required this.name,
    required this.email,
    required this.imgUrl,
    required this.linkedAccounts,
  });
}

UserModel dummyUser = UserModel(
  name: "Abdalrhman Janem",
  email: "abdabood2664@gmail.com",
  imgUrl:
      "https://media.licdn.com/dms/image/C4D03AQE3Qd9SkKKdow/profile-displayphoto-shrink_400_400/0/1653334218070?e=1712793600&v=beta&t=r6xjxk3f0k7uwpD0gDCNwZKtA-ZqEZ_ouQuqU6Lpvjc",
  linkedAccounts: [
    LinkedAccount(
      provider: "Google",
      imgLink: "assets/images/google.png",
    ),
    LinkedAccount(
      provider: "Facebook",
      imgLink: "assets/images/facebook.png",
    ),
  ],
);

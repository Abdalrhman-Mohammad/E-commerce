
class LinkedAccount {
  final String provider;
  final String imgLink;

  LinkedAccount({required this.provider, required this.imgLink});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'provider': provider,
      'imgLink': imgLink,
    };
  }

  factory LinkedAccount.fromMap(Map<String, dynamic> map) {
    return LinkedAccount(
      provider: map['provider'] as String,
      imgLink: map['imgLink'] as String,
    );
  }

 
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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'imgUrl': imgUrl,
      'linkedAccounts': linkedAccounts.map((x) => x.toMap()).toList(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      email: map['email'] as String,
      imgUrl: map['imgUrl'] as String,
      linkedAccounts: List<LinkedAccount>.from(
          (map['linkedAccounts'] as List<dynamic>).map((element) {
        return LinkedAccount(
          provider: element['provider']!,
          imgLink: element['imgLink']!,
        );
      })),
    );
  }

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

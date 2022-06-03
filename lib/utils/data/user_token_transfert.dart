class UserTokenTransfert {
  final String id;

  UserTokenTransfert({required this.id});

  factory UserTokenTransfert.fromJson(Map<String, dynamic> json) {
    return UserTokenTransfert(id: json["id"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
    };
  }
}

class User {
  User({required this.email, required this.id});

  User.fromMap(Map<String, dynamic> data)
      : id = data["id"],
        email = data["email"];

  final int id;
  final String email;

  Map<String, dynamic> toMap() {
    return {
      "email": email,
      "uuid": id,
    };
  }
}

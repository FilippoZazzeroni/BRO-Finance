class STGUser {

  STGUser({required this.email, required this.equityInPercentage, required this.uuid, required this.name});

  STGUser.fromMap(Map<String, dynamic> data)
      : uuid = data["uuid"],
        equityInPercentage = data["equityPercentage"],
        name = data["name"],
        email = data["email"];

  final String uuid;
  final double equityInPercentage;
  final double totalDollars = 911.0;
  final String email;
  String? name;

  Map<String, dynamic> toMap() {
    return {
      "name": name ?? "",
      "equityPercentage": equityInPercentage,
      "email": email,
      "uuid": uuid,
    };
  }
}
